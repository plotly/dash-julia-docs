using Dash, DashHtmlComponents
using DashTable

using CSV, DataFrames   

df = CSV.read("datasets/firm_none_table.csv", DataFrame)
app = dash()

app.layout = html_div([
  html_pre(string(df)),
  DashTable.dash_datatable(
      data=Dict.(pairs.(eachrow(df))),
      columns=[
            Dict(
                "name" =>  i,
                "id" =>  i,
                "type" =>  "numeric",
                "format" =>  Format(
                    nully="N/A"
                )
            ) for i in names(df)
        ],
        editable=true
  )
])

run_server(app, "0.0.0.0", debug=true)

