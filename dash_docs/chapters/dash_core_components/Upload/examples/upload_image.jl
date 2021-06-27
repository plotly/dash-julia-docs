using Dash, DashCoreComponents, DashHtmlComponents, DashTable
using Base64, Dates

external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]

app = dash(external_stylesheets=external_stylesheets)

app.layout = html_div([
    dcc_upload(
        id="upload-image",
        children=html_div([
            "Drag and Drop or ",
            html_a("Select Files")
        ]),
        style=Dict(
            "width" => "100%",
            "height" => "60px",
            "lineHeight" => "60px",
            "borderWidth" => "1px",
            "borderStyle" => "dashed",
            "borderRadius" => "5px",
            "textAlign" => "center",
            "margin" => "10px"
        ),
        # Allow multiple files to be uploaded
        multiple=true
    ),
    html_div(id="output-image-upload"),
])


function parse_contents_fig(contents, filename, date)
    return html_div([
        html_h5(filename),
        html_h6(Libc.strftime(date)),
        
        # HTML images accept base64 encoded strings in the same format
        # that is supplied by the upload
        html_img(src=contents),
        html_hr(),
        html_div("Raw Content"),
        html_pre(string(contents[1:200],"..."), style=Dict(
            "whiteSpace" => "pre-wrap",
            "wordBreak" => "break-all"
        ))
    ])
end

callback!(
    app,
    Output("output-image-upload", "children"),
    Input("upload-image", "contents"),
    State("upload-image", "filename"),
    State("upload-image", "last_modified"),
) do contents, filename, last_modified
  if !(contents isa Nothing)
      children = [
        parse_contents_fig(c...) for c in
        zip(contents, filename, last_modified)]
      return children
  end
end

run_server(app, "0.0.0.0", debug=true)