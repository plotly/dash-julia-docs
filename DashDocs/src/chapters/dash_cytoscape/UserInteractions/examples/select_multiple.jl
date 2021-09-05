using Dash, DashCytoscape
using DashHtmlComponents, DashCoreComponents

app = dash()

styles = Dict(
    "pre" =>  Dict(
        "border" =>  "thin lightgrey solid",
        "overflowX" =>  "scroll"
    )
)


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
        ("hou", "chi"),
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
    )
]


app.layout = html_div([
    cyto_cytoscape(
        id="cytoscape-event-callbacks-3",
        layout=Dict("name" => "preset"),
        elements=vcat(edges,nodes),
        stylesheet=default_stylesheet,
        style=Dict("width" => "100%", "height" => "450px")
    ),
    dcc_markdown(id="cytoscape-selectedNodeData-markdown")
])


callback!(app,
    Output("cytoscape-selectedNodeData-markdown", "children"),
    Input("cytoscape-event-callbacks-3", "selectedNodeData")
) do data_list
    if (data_list isa Nothing)
        return
    end

    cities_list = [data[:label] for data in data_list]
    return """
        You selected the following cities:\n $(join(cities_list,"\n"))
        """
end
run_server(app, "0.0.0.0", debug=true)