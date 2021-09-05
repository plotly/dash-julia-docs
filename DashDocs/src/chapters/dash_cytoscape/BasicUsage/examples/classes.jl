using Dash, DashCytoscape
app = dash()

my_stylesheet = [
    # Group selectors
    Dict(
        "selector" =>  "node",
        "style" =>  Dict(
            "content" =>  "data(label)"
        )
    ),

    # Class selectors
    Dict(
        "selector" =>  ".red",
        "style" =>  Dict(
            "background-color" =>  "red",
            "line-color" =>  "red"
        )
    ),
    Dict(
        "selector" =>  ".triangle",
        "style" =>  Dict(
            "shape" =>  "triangle"
        )
    )
]

app.layout = cyto_cytoscape(
    id="cytoscape-elements-classes",
    layout=Dict("name" =>  "preset"),
    style=Dict("width" =>  "100%", "height" =>  "400px"),
    stylesheet=my_stylesheet,
    elements=[
        Dict(
            "data" =>  Dict("id" =>  "one", "label" =>  "Modified Color"),
            "position" =>  Dict("x" =>  75, "y" =>  75),
            "classes" =>  "red" # Single class
        ),
        Dict(
            "data" =>  Dict("id" =>  "two", "label" =>  "Modified Shape"),
            "position" =>  Dict("x" =>  75, "y" =>  200),
            "classes" =>  "triangle" # Single class
        ),
        Dict(
            "data" =>  Dict("id" =>  "three", "label" =>  "Both Modified"),
            "position" =>  Dict("x" =>  200, "y" =>  75),
            "classes" =>  "red triangle" # Multiple classes
        ),
        Dict(
            "data" =>  Dict("id" =>  "four", "label" =>  "Regular"),
            "position" =>  Dict("x" =>  200, "y" =>  200)
        ),
        Dict("data" =>  Dict("source" =>  "one", "target" =>  "two"), "classes" =>  "red"),
        Dict("data" =>  Dict("source" =>  "two", "target" =>  "three")),
        Dict("data" =>  Dict("source" =>  "three", "target" =>  "four"), "classes" =>  "red"),
        Dict("data" =>  Dict("source" =>  "two", "target" =>  "four")),
    ]
)

run_server(app, "0.0.0.0", debug=true)