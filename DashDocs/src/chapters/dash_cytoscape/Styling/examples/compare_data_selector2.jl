using Dash, DashCytoscape
app = dash()

named_elements = [
    Dict("data" =>  Dict("id" =>  "A", "firstname" =>  "Albert")),
    Dict("data" =>  Dict("id" =>  "B", "firstname" =>  "Bert")),
    Dict("data" =>  Dict("id" =>  "C", "firstname" =>  "Charlie")),
    Dict("data" =>  Dict("id" =>  "D", "firstname" =>  "Daniela")),
    Dict("data" =>  Dict("id" =>  "E", "firstname" =>  "Emma")),

    Dict("data" =>  Dict("source" =>  "A", "target" =>  "B")),
    Dict("data" =>  Dict("source" =>  "A", "target" =>  "C")),
    Dict("data" =>  Dict("source" =>  "B", "target" =>  "D")),
    Dict("data" =>  Dict("source" =>  "B", "target" =>  "E")),
    Dict("data" =>  Dict("source" =>  "C", "target" =>  "E")),
    Dict("data" =>  Dict("source" =>  "D", "target" =>  "A"))
]

app.layout = cyto_cytoscape(
    id="cytoscape-styling-4",
    layout=Dict("name" =>  "circle"),
    style=Dict("width" =>  "100%", "height" =>  "400px"),
    elements=named_elements,
    stylesheet=[
        Dict(
            "selector" =>  "node",
            "style" =>  Dict(
                "label" =>  "data(firstname)"
            )
        ),
        Dict(
            "selector" =>  "[firstname *= 'ert']",
            "style" =>  Dict(
                "background-color" =>  "#FF4136",
                "shape" =>  "rectangle"
            )
        )
    ]
)

run_server(app, "0.0.0.0", debug=true)