using Dash, DashCytoscape
app = dash()

weighted_elements = [
    Dict("data" =>  Dict("id" =>  "A")),
    Dict("data" =>  Dict("id" =>  "B")),
    Dict("data" =>  Dict("id" =>  "C")),
    Dict("data" =>  Dict("id" =>  "D")),
    Dict("data" =>  Dict("id" =>  "E")),

    Dict("data" =>  Dict("source" =>  "A", "target" =>  "B", "weight" =>  1)),
    Dict("data" =>  Dict("source" =>  "A", "target" =>  "C", "weight" =>  2)),
    Dict("data" =>  Dict("source" =>  "B", "target" =>  "D", "weight" =>  3)),
    Dict("data" =>  Dict("source" =>  "B", "target" =>  "E", "weight" =>  4)),
    Dict("data" =>  Dict("source" =>  "C", "target" =>  "E", "weight" =>  5)),
    Dict("data" =>  Dict("source" =>  "D", "target" =>  "A", "weight" =>  6))
]

app.layout = cyto_cytoscape(
    id="cytoscape-styling-3",
    layout=Dict("name" =>  "circle"),
    style=Dict("width" =>  "100%", "height" =>  "400px"),
    elements=weighted_elements,
    stylesheet=[
        Dict(
            "selector" =>  "edge",
            "style" =>  Dict(
                "label" =>  "data(weight)"
            )
        ),
        Dict(
            "selector" =>  "[weight <= 3]",
            "style" =>  Dict(
                "line-color" =>  "blue"
            )
        )
    ]
)

run_server(app, "0.0.0.0", debug=true)