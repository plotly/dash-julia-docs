
using Dash, DashCytoscape
using DashHtmlComponents, DashCoreComponents

app = dash()

# Object declaration
basic_elements = [
    Dict(
        "data" =>  Dict("id" =>  "one", "label" =>  "Node 1"),
        "position" =>  Dict("x" =>  50, "y" =>  50)
    ),
    Dict(
        "data" =>  Dict("id" =>  "two", "label" =>  "Node 2"),
        "position" =>  Dict("x" =>  200, "y" =>  200)
    ),
    Dict(
        "data" =>  Dict("id" =>  "three", "label" =>  "Node 3"),
        "position" =>  Dict("x" =>  100, "y" =>  150)
    ),
    Dict(
        "data" =>  Dict("id" =>  "four", "label" =>  "Node 4"),
        "position" =>  Dict("x" =>  400, "y" =>  50)
    ),
    Dict(
        "data" =>  Dict("id" =>  "five", "label" =>  "Node 5"),
        "position" =>  Dict("x" =>  250, "y" =>  100)
    ),
    Dict(
        "data" =>  Dict("id" =>  "six", "label" =>  "Node 6", "parent" =>  "three"),
        "position" =>  Dict("x" =>  150, "y" =>  150)
    ),
    Dict(
        "data" =>  Dict(
            "id" =>  "one-two",
            "source" =>  "one",
            "target" =>  "two",
            "label" =>  "Edge from Node1 to Node2"
        )
    ),
    Dict(
        "data" =>  Dict(
            "id" =>  "one-five",
            "source" =>  "one",
            "target" =>  "five",
            "label" =>  "Edge from Node 1 to Node 5"
        )
    ),
    Dict(
        "data" =>  Dict(
            "id" =>  "two-four",
            "source" =>  "two",
            "target" =>  "four",
            "label" =>  "Edge from Node 2 to Node 4"
        )
    ),
    Dict(
        "data" =>  Dict(
            "id" =>  "three-five",
            "source" =>  "three",
            "target" =>  "five",
            "label" =>  "Edge from Node 3 to Node 5"
        )
    ),
    Dict(
        "data" =>  Dict(
            "id" =>  "three-two",
            "source" =>  "three",
            "target" =>  "two",
            "label" =>  "Edge from Node 3 to Node 2"
        )
    ),
   Dict(
        "data" =>  Dict(
            "id" =>  "four-four",
            "source" =>  "four",
            "target" =>  "four",
            "label" =>  "Edge from Node 4 to Node 4"
        )
    ),
    Dict(
        "data" =>  Dict(
            "id" =>  "four-six",
            "source" =>  "four",
            "target" =>  "six",
            "label" =>  "Edge from Node 4 to Node 6"
        )
    ),
    Dict(
        "data" =>  Dict(
            "id" =>  "five-one",
            "source" =>  "five",
            "target" =>  "one",
            "label" =>  "Edge from Node 5 to Node 1"
        )
    ),
]

styles = Dict(
    "output" =>  Dict(
        "overflow-y" =>  "scroll",
        "overflow-wrap" =>  "break-word",
        "height" =>  "calc(100% - 25px)",
        "border" =>  "thin lightgrey solid"
    ),
    "tab" =>  Dict("height" =>  "calc(98vh - 115px)")
)


app.layout = html_div([
    html_div(className="eight columns", children=[
        cyto_cytoscape(
            id="cytoscape-image-export",
            elements=basic_elements,
            layout=Dict(
                "name" =>  "preset"
            ),
            style=Dict(
                "height" =>  "95vh",
                "width" =>  "calc(100% - 500px)",
                "float" =>  "left"
            )
        )
    ]),

    html_div(className="four columns", children=[
        dcc_tabs(id="tabs-image-export", children=[
            dcc_tab(label="generate jpg", value="jpg"),
            dcc_tab(label="generate png", value="png")
        ]),
        html_div(style=styles["tab"], children=[
            html_div(
                id="image-text",
                children="image data will appear here",
                style=styles["output"]
            )
        ]),
        html_div("Download graph => "),
        html_button("as jpg", id="btn-get-jpg"),
        html_button("as png", id="btn-get-png"),
        html_button("as svg", id="btn-get-svg")
    ])
])


callback!(app,
    Output("image-text", "children"),
    Input("cytoscape-image-export", "imageData"),
) do data
    return data
end


callback!(app,
    Output("cytoscape-image-export", "generateImage"),
    Input("tabs-image-export", "value"),
    Input("btn-get-jpg", "n_clicks"),
    Input("btn-get-png", "n_clicks"),
    Input("btn-get-svg", "n_clicks")
) do tab, get_jpg_clicks, get_png_clicks, get_svg_clicks

    # File type to output of "svg, "png", "jpg", or "jpeg" (alias of "jpg")
    ftype = tab

    # "store" =>  Stores the image data in "imageData" !only jpg/png are supported
    # "download"` =>  Downloads the image as a file with all data handling
    # "both"` =>  Stores image data and downloads image as file.
    action = "store"

    ctx = callback_context()
    if !isempty(ctx.triggered)
        input_id = split(ctx.triggered[1].prop_id, ".")[1]

        if input_id != "tabs"
            action = "download"
            ftype = split(input_id, "-")[end]
            return Dict(
                "type" =>  ftype,
                "action" =>  action
                )
        else
            throw(PreventUpdate())
        end
    else
        throw(PreventUpdate())
    end

    
end
run_server(app, "0.0.0.0", debug=true)