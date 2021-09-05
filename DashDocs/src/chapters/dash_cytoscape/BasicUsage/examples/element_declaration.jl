using Dash, DashCytoscape
app = dash()

app.layout = cyto_cytoscape(
    id="cytoscape-elements-basic",
    layout=Dict("name" => "preset"),
    style=Dict("width" => "100%", "height" => "400px"),
    elements=[
        # The nodes elements
        Dict("data" => Dict("id" => "one", "label" => "Node 1"),
         "position" => Dict("x" => 50, "y" => 50)),
        Dict("data" => Dict("id" => "two", "label" => "Node 2"),
         "position" => Dict("x" => 200, "y" => 200)),

        # The edge elements
        Dict("data" => Dict("source" => "one", "target" => "two", "label" => "Node 1 to 2"))
    ]
)

run_server(app, "0.0.0.0", debug=true)