using Dash, DashCytoscape
app = dash()

directed_edges = [
    Dict("data" =>  Dict("id" =>  string(src,tgt), "source" =>  src, "target" =>  tgt))
    for (src, tgt) in ["BA", "BC", "CD", "DA"]
]

directed_elements = vcat([Dict("data" =>  ("id" =>  id_)) for id_ in "ABCD"], directed_edges)

app.layout = cyto_cytoscape(
    id="cytoscape-styling-9",
    layout=Dict("name" =>  "circle"),
    style=Dict("width" =>  "100%", "height" =>  "400px"),
    elements=directed_elements,
    stylesheet=[
        Dict(
            "selector" =>  "node",
            "style" =>  Dict(
                "label" =>  "data(id)"
            )
        ),
        Dict(
            "selector" =>  "edge",
            "style" =>  Dict(
                # The default curve style does not work with certain arrows
                "curve-style" =>  "bezier"
            )
        ),
        Dict(
            "selector" =>  "#BA",
            "style" =>  Dict(
                "source-arrow-color" =>  "red",
                "source-arrow-shape" =>  "triangle",
                "line-color" =>  "red"
            )
        ),
        Dict(
            "selector" =>  "#DA",
            "style" =>  Dict(
                "target-arrow-color" =>  "blue",
                "target-arrow-shape" =>  "vee",
                "line-color" =>  "blue"
            )
        ),
        Dict(
            "selector" =>  "#BC",
            "style" =>  Dict(
                "mid-source-arrow-color" =>  "green",
                "mid-source-arrow-shape" =>  "diamond",
                "mid-source-arrow-fill" =>  "hollow",
                "line-color" =>  "green",
            )
        ),
        Dict(
            "selector" =>  "#CD",
            "style" =>  Dict(
                "mid-target-arrow-color" =>  "black",
                "mid-target-arrow-shape" =>  "circle",
                "arrow-scale" =>  2,
                "line-color" =>  "black",
            )
        )
    ]
)

run_server(app, "0.0.0.0", debug=true)