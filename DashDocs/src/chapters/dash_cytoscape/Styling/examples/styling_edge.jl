using Dash, DashCytoscape
app = dash()

double_edges = [
    Dict("data" =>  Dict("id" =>  string(src,tgt), "source" =>  src, "target" =>  tgt))
    for (src, tgt) in ["AB", "BA", "BC", "CB", "CD", "DC", "DA", "AD"]
]

double_edged_el = vcat([("data" =>  ("id" =>  id_)) for id_ in "ABCD"],double_edges)

app.layout = cyto_cytoscape(
    id="cytoscape-styling-8",
    layout=Dict("name" =>  "circle"),
    style=Dict("width" =>  "100%", "height" =>  "400px"),
    elements=double_edged_el,
    stylesheet=[
        Dict(
            "selector" =>  "node",
            "style" =>  Dict(
                "label" =>  "data(id)"
            )
        ),
        Dict(
            "selector" =>  "#AB, #BA",
            "style" =>  Dict(
                "curve-style" =>  "bezier",
                "label" =>  "bezier",
                "line-color" =>  "red"
            )
        ),
        Dict(
            "selector" =>  "#AD, #DA",
            "style" =>  Dict(
                "curve-style" =>  "haystack",
                "label" =>  "haystack",
                "line-color" =>  "blue"
            )
        ),
        Dict(
            "selector" =>  "#DC, #CD",
            "style" =>  Dict(
                "curve-style" =>  "segments",
                "label" =>  "segments",
                "line-color" =>  "green"
            )
        )
    ]
)

run_server(app, "0.0.0.0", debug=true)