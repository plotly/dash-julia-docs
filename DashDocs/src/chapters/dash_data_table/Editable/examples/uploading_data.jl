using Dash, DashHtmlComponents, DashCoreComponents
using DashTable

using CSV, DataFrames 
using Base64
external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]
app = dash(external_stylesheets=external_stylesheets)

app.layout =  html_div([
  dcc_upload(
      id="datatable-upload",
      children=html_div([
          "Drag and Drop or ",
          html_a("Select Files")
      ]),
      style=Dict(
          "width" =>  "100%", "height" =>  "60px", "lineHeight" =>  "60px",
          "borderWidth" =>  "1px", "borderStyle" =>  "dashed",
          "borderRadius" =>  "5px", "textAlign" =>  "center", "margin" =>  "10px"
      ),
  ),
  DashTable.dash_datatable(id="datatable-upload-container"),
  dcc_graph(id="datatable-upload-graph")
])
function parse_contents(contents, filename)
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
    return df
  end

callback!(app,
    Output("datatable-upload-container", "data"),
    Output("datatable-upload-container", "columns"),
    Input("datatable-upload", "contents"),
    State("datatable-upload", "filename")
) do contents, filename
    if contents isa Nothing
        return [Dict()], []
    end
    df = parse_contents(contents, filename)
    return Dict.(pairs.(eachrow(df))), [Dict("name" =>  i, "id" =>  i) for i in names(df)]
end

callback!(app,
    Output("datatable-upload-graph", "figure"),
    Input("datatable-upload-container", "data")
) do rows
    if any([isempty(rw) for rw in rows])
        return Dict(
            "data" =>  [Dict(
                "x" =>  [],
                "y" =>  [],
                "type" =>  "bar"
            )]
        )
    end
    df = DataFrame(rows)
    nme = names(df)
    return Dict(
        "data" =>  [Dict(
            "x" =>  df[!, nme[1]],
            "y" =>  df[!, nme[2]],
            "type" =>  "bar"
        )]
    )

end
run_server(app, "0.0.0.0", debug=true)
