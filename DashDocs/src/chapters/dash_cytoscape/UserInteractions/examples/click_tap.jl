using Dash, DashCytoscape
using DashHtmlComponents, DashCoreComponents
using JSON

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
        id="cytoscape-event-callbacks-2",
        layout=Dict("name" =>  "preset"),
        elements=vcat(edges,nodes),
        stylesheet=default_stylesheet,
        style=Dict("width" =>  "100%", "height" =>  "450px")
    ),
    html_p(id="cytoscape-tapNodeData-output"),
    html_p(id="cytoscape-tapEdgeData-output"),
    html_p(id="cytoscape-mouseoverNodeData-output"),
    html_p(id="cytoscape-mouseoverEdgeData-output")
])


callback!(app,
    Output("cytoscape-tapNodeData-output", "children"),
    Input("cytoscape-event-callbacks-2", "tapNodeData")
) do data
    if !(data isa Nothing)
        return ("You recently clicked/tapped the 
        city =>  $(data[:label])")
    end
end


callback!(app,
    Output("cytoscape-tapEdgeData-output", "children"),
    Input("cytoscape-event-callbacks-2", "tapEdgeData")
) do data
    if !(data isa Nothing)
        return "You recently clicked/tapped the edge 
        between $(uppercase(data[:source])) 
        and $(uppercase(data[:target]))"
    end
end


callback!(app,
    Output("cytoscape-mouseoverNodeData-output", "children"),
    Input("cytoscape-event-callbacks-2", "mouseoverNodeData")
) do data
    if !(data isa Nothing)
        return "You recently hovered over 
        the city =>  $(data[:label])"
    end
end


callback!(app,
    Output("cytoscape-mouseoverEdgeData-output", "children"),
    Input("cytoscape-event-callbacks-2", "mouseoverEdgeData")
) do data
    if !(data isa Nothing)
        return "You recently hovered over the edge 
        between $(uppercase(data[:source])) 
        and $(uppercase(data[:target]))"
    end
end

run_server(app, "0.0.0.0", debug=true)