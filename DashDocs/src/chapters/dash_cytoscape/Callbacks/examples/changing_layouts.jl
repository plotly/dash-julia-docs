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


app.layout = html_div([
    dcc_dropdown(
        id="dropdown-update-layout",
        value="grid",
        clearable=false,
        options=[
            Dict("label" =>  uppercase(name), "value" =>  name)
            for name in ["grid", "random", "circle", "cose", "concentric"]
        ]
    ),
    cyto_cytoscape(
        id="cytoscape-update-layout",
        elements=elements,
        style=Dict("width" =>  "100%", "height" =>  "450px"),
        layout=Dict(
            "name" =>  "grid"
        )
    )    

])

callback!(app,
    Output("cytoscape-update-layout", "layout"),
    Input("dropdown-update-layout", "value")
) do layout
    return Dict(
        "name" =>  layout,
        "animate" =>  true
    )
end

run_server(app, "0.0.0.0", debug=true)