using Dash, DashCytoscape
app = dash()

app.layout = cyto_cytoscape(
    id="cytoscape-elements-boolean",
    layout=Dict("name" =>  "preset"),
    style=Dict("width" =>  "100%", "height" =>  "400px"),
    elements=[
        Dict(
            "data" =>  Dict("id" =>  "one", "label" =>  "Locked"),
            "position" =>  Dict("x" =>  75, "y" =>  75),
            "locked" =>  true
        ),
        Dict(
            "data" =>  Dict("id" =>  "two", "label" =>  "Selected"),
            "position" =>  Dict("x" =>  75, "y" =>  200),
            "selected" =>  true
        ),
        Dict(
            "data" =>  Dict("id" =>  "three", "label" =>  "Not Selectable"),
            "position" =>  Dict("x" =>  200, "y" =>  75),
            "selectable" =>  false
        ),
        Dict(
            "data" =>  Dict("id" =>  "four", "label" =>  "Not grabbable"),
            "position" =>  Dict("x" =>  200, "y" =>  200),
            "grabbable" =>  false
        ),
        Dict("data" =>  Dict("source" =>  "one", "target" =>  "two")),
        Dict("data" =>  Dict("source" =>  "two", "target" =>  "three")),
        Dict("data" =>  Dict("source" =>  "three", "target" =>  "four")),
        Dict("data" =>  Dict("source" =>  "two", "target" =>  "four")),
    ]
)

run_server(app, "0.0.0.0", debug=true)