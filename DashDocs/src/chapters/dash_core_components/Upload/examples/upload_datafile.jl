using Core: Typeof
using Dash, DashCoreComponents, DashHtmlComponents, DashTable
using Base64, Dates, CSV, DataFrames

external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]

app = dash(external_stylesheets=external_stylesheets)

app.layout = html_div([
    dcc_upload(
        id="upload-datan",
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
    html_div(id="output-data-uploadn"),
])


function parse_contents(contents, filename, date)
  content_type, content_string = split(contents, ',')
  decoded = base64decode(content_string)
  df = DataFrame()
  try
    if occursin("csv", filename)
      str = String(decoded)
      df =  CSV.read(IOBuffer(str), DataFrame)
    end
  catch e
    print(e)
    return html_div([
        "There was an error processing this file."
    ])
  end
  
  return html_div([
      html_h5(filename),
      html_h6(Libc.strftime(date)),

      DashTable.dash_datatable(
          data=[Dict(pairs(NamedTuple(eachrow(df)[j]))) for j in 1:nrow(df)],
          columns=[Dict("name" =>i, "id" => i) for i in names(df)]
      ),

      html_hr(),  # horizontal line

      # For debugging, display the raw contents provided by the web browser
      html_div("Raw Content"),
      html_pre(string(contents[1:200], "..."), style=Dict(
          "whiteSpace" => "pre-wrap",
          "wordBreak" => "break-all"
      ))
  ])
end


callback!(
    app,
    Output("output-data-uploadn", "children"),
    Input("upload-datan", "contents"),
    State("upload-datan", "filename"),
    State("upload-datan", "last_modified"),
) do contents, filename, last_modified
  if !(contents isa Nothing)
      children = [
        parse_contents(c...) for c in
        zip(contents, filename, last_modified)]
      return children
  end
end

run_server(app, "0.0.0.0", debug=true)