using Dash, DashCytoscape, DashHtmlComponents
app = dash()

app.layout = html_div([
    cyto_cytoscape(
        id="cytoscape-compound",
        layout=Dict("name" =>  "preset"),
        style=Dict("width" =>  "100%", "height" =>  "450px"),
        stylesheet=[
            Dict(
                "selector" =>  "node",
                "style" =>  Dict("content" =>  "data(label)")
            ),
            Dict(
                "selector" =>  ".countries",
                "style" =>  Dict("width" =>  5)
            ),
            Dict(
                "selector" =>  ".cities",
                "style" =>  Dict("line-style" =>  "dashed")
            )
        ],
        elements=[
            # Parent Nodes
            Dict(
                "data" =>  Dict("id" =>  "us", "label" =>  "United States")
            ),
            Dict(
                "data" =>  Dict("id" =>  "can", "label" =>  "Canada")
            ),

            # Children Nodes
            Dict(
                "data" =>  Dict("id" =>  "nyc", "label" =>  "New York", "parent" =>  "us"),
                "position" =>  Dict("x" =>  100, "y" =>  100)
            ),
            Dict(
                "data" =>  Dict("id" =>  "sf", "label" =>  "San Francisco", "parent" =>  "us"),
                "position" =>  Dict("x" =>  100, "y" =>  200)
            ),
            Dict(
                "data" =>  Dict("id" =>  "mtl", "label" =>  "Montreal", "parent" =>  "can"),
                "position" =>  Dict("x" =>  400, "y" =>  100)
            ),

            # Edges
            Dict(
                "data" =>  Dict("source" =>  "can", "target" =>  "us"),
                "classes" =>  "countries"
            ),
            Dict(
                "data" =>  Dict("source" =>  "nyc", "target" =>  "sf"),
                "classes" =>  "cities"
            ),
            Dict(
                "data" =>  Dict("source" =>  "sf", "target" =>  "mtl"),
                "classes" =>  "cities"
            )
        ]
    )
])

run_server(app, "0.0.0.0", debug=true)