using Dash, DashCoreComponents, DashHtmlComponents

external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]

app = dash(external_stylesheets=external_stylesheets)

app.layout = html_div([
    dcc_upload(html_button("Upload File")),

    html_hr(),

    dcc_upload(html_a("Upload File")),

    html_hr(),

    dcc_upload([
        "Drag and Drop or ",
        html_a("Select a File")
    ], 
    id="upload-datag",
    style=Dict(
        "width" => "100%",
        "height" => "60px",
        "lineHeight" => "60px",
        "borderWidth" => "1px",
        "borderStyle" => "dashed",
        "borderRadius" => "5px",
        "textAlign" => "center"
    ))
])



run_server(app, "0.0.0.0", debug=true)