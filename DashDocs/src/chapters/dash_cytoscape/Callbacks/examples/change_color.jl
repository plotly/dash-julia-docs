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
        html_div(style=Dict("width" =>  "50%", "display" =>  "inline"), children=[
            "Edge Color:  ",
            dcc_input(id="input-line-color", type="text")
        ]),
        html_div(style=Dict("width" =>  "50%", "display" =>  "inline"), children=[
            "Node Color:  ",
            dcc_input(id="input-bg-color", type="text")
        ])
    ]),
    cyto_cytoscape(
        id="cytoscape-stylesheet-callbacks",
        elements=elements,
        stylesheet=default_stylesheet,
        style=Dict("width" =>  "100%", "height" =>  "400px"),
        layout=Dict(
            "name" =>  "circle"
        )
    )    
])

callback!(app,
    Output("cytoscape-stylesheet-callbacks", "stylesheet"),
    Input("input-line-color", "value"),
    Input("input-bg-color", "value")
) do line_color, bg_color
    if line_color isa Nothing
        line_color = ""
    end

    if bg_color isa Nothing
        bg_color = ""
    end

    new_styles = [
        Dict(
            "selector" =>  "node",
            "style" =>  Dict(
                "background-color" =>  bg_color
            )
        ),
        Dict(
            "selector" =>  "edge",
            "style" =>  Dict(
                "line-color" =>  line_color
            )
        )
    ]

    return vcat(default_stylesheet, new_styles)
end

run_server(app, "0.0.0.0", debug=true)