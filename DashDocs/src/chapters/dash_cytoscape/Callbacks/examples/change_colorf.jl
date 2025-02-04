using Dash, DashCytoscape
using DashCoreComponents
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

elements = vcat(nodes, edges)

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


app.layout = cyto_cytoscape(
        id="cytoscape-callbacks-2",
        elements=elements,
        stylesheet=default_stylesheet,
        style=Dict("width" =>  "100%", "height" =>  "400px"),
        layout=Dict(
            "name" =>  "circle"
        )
    )


run_server(app, "0.0.0.0", debug=true)