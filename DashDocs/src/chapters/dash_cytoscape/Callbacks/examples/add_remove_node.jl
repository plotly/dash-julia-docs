using Dash, DashCytoscape
using DashHtmlComponents, DashCoreComponents
app = dash()


nodes = [
    Dict(
        "data" =>  Dict("id" =>  short, "label" =>  label),
        "position" =>  Dict("x" =>  20*lat, "y" =>  -20*long)
    )
    for (short, label, long, lat) in (
        ("la", "Los Angeles", 34.03, -118.25),
        ("nyc", "New York", 40.71, -74),
        ("to", "Toronto", 43.65, -79.38),
        ("mtl", "Montreal", 45.50, -73.57),
        ("van", "Vancouver", 49.28, -123.12),
        ("chi", "Chicago", 41.88, -87.63),
        ("bos", "Boston", 42.36, -71.06),
        ("hou", "Houston", 29.76, -95.37)
    )
]

edges = [
    Dict("data" =>  Dict("source" =>  source, "target" =>  target))
    for (source, target) in (
        ("van", "la"),
        ("la", "chi"),
        ("to", "mtl"),
        ("mtl", "bos"),
        ("nyc", "bos"),
        ("to", "hou"),
        ("to", "nyc"),
        ("la", "nyc"),
        ("nyc", "bos")
    )
]


default_stylesheet = [
    Dict(
        "selector" =>  "node",
        "style" =>  Dict(
            "background-color" =>  "#BFD7B5",
            "label" =>  "data(label)"
        )
    ),
    Dict(
        "selector" =>  "edge",
        "style" =>  Dict(
            "line-color" =>  "#A3C4BC"
        )
    )
]


app.layout = html_div([
    html_div([
        html_button("Add Node", id="btn-add-node", n_clicks_timestamp=0),
        html_button("Remove Node", id="btn-remove-node", n_clicks_timestamp=0)
    ]),

    cyto_cytoscape(
        id="cytoscape-elements-callbacks",
        layout=Dict("name" =>  "circle"),
        stylesheet=default_stylesheet,
        style=Dict("width" =>  "100%", "height" =>  "450px"),
        elements=vcat(edges, nodes)
    )
])


callback!(app,
    Output("cytoscape-elements-callbacks", "elements"),
    Input("btn-add-node", "n_clicks_timestamp"),
    Input("btn-remove-node", "n_clicks_timestamp"),
    State("cytoscape-elements-callbacks", "elements")
) do btn_add, btn_remove, elements
    # If the add button was clicked most recently
    if Int(btn_add) > Int(btn_remove)
        next_node_idx = count(isdefined.(elements,Symbol("position")))
        # As long as we have not reached the max number of nodes, we add them
        # to the cytoscape elements
        if next_node_idx < length(nodes)
            new_nodes = nodes[1:next_node_idx+1]
            node_ids = map(x->x["data"]["id"], new_nodes)
            locs = map(x->(
                (x["data"]["target"] ∈ node_ids ) &&
                (x["data"]["source"] ∈ node_ids)
            ),edges)
            return vcat(edges[locs], new_nodes) 
        end
        
   # If the remove button was clicked most recently
    elseif Int(btn_remove) > Int(btn_add) 
        if length(elements) > length(edges)
            return elements[1:end-1]
        end
    end
    # # Neither have been clicked yet (or fallback condition)
    return elements
end

run_server(app, "0.0.0.0", debug=true)