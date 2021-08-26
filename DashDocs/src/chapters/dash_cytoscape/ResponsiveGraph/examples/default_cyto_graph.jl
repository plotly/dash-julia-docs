
using Dash, DashCytoscape
using DashHtmlComponents, DashCoreComponents
using JSON

app = dash()

# Load Data
elements = JSON.parsefile(download("https://js.cytoscape.org/demos/colajs-graph/data.json"))
stylesheet = JSON.parsefile(download("https://js.cytoscape.org/demos/colajs-graph/cy-style.json"))

styles = Dict(
    "container" =>  Dict(
        "position" =>  "fixed",
        "display" =>  "flex",
        "flex-direction" =>  "column",
        "height" =>  "100%",
        "width" =>  "100%"
    ),
    "cy-container" =>  Dict(
        "flex" =>  "1",
        "position" =>  "relative"
    ),
    "cytoscape" =>  Dict(
        "position" =>  "absolute",
        "width" =>  "100%",
        "height" =>  "100%",
        "z-index" =>  999
    )
)

# App
app.layout = html_div(style=styles["container"], children=[
    html_div([
        html_button("Responsive Toggle", id="toggle-button"),
        html_div(id="toggle-text")
    ]),
    html_div(className="cy-container", style=styles["cy-container"], children=[
        cyto_cytoscape(
            id="cytoscape-responsive-layout",
            elements=elements,
            stylesheet=stylesheet,
            style=styles["cytoscape"],
            layout=Dict(
                "name" =>  "cose",
                "idealEdgeLength" =>  100,
                "nodeOverlap" =>  20,
                "refresh" =>  20,
                "fit" =>  true,
                "padding" =>  30,
                "randomize" =>  false,
                "componentSpacing" =>  100,
                "nodeRepulsion" =>  400000,
                "edgeElasticity" =>  100,
                "nestingFactor" =>  5,
                "gravity" =>  80,
                "numIter" =>  1000,
                "initialTemp" =>  200,
                "coolingFactor" =>  0.95,
                "minTemp" =>  1.0
            ),
            responsive=true
        )
    ])
])


callback!(app, 
    Output("cytoscape-responsive-layout", "responsive"), 
    Input("toggle-button", "n_clicks")
) do n_clicks 
    n_clicks = (n_clicks isa Nothing) ? 2 : n_clicks
    toggle_on = (n_clicks % 2 == 0)
    return toggle_on
end


callback!(app,
    Output("toggle-text", "children"), 
    Input("cytoscape-responsive-layout", "responsive")
) do responsive
    return string("\t", "Responsive ", (responsive ? "On" : "Off"))
end

run_server(app, "0.0.0.0", debug=true)