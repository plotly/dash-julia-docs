using Dash, DashHtmlComponents
using DashTable

using CSV, DataFrames   

df = CSV.read("datasets/firm_none_table.csv", DataFrame)
app = dash()

app.layout = html_div([
  html_pre(string(df)),
  DashTable.dash_datatable(
      data=Dict.(pairs.(eachrow(df))),
      columns=[Dict("name" =>c, "id" => c) for c in names(df)],
      editable=true,
      style_data_conditional=[
            Dict(
                "if" => Dict(
                    "filter_query" => "{col} = N/A",
                    "column_id" => col
                ),
                "backgroundColor" => "tomato",
                "color" => "white"
            ) for col in names(df)
        ]
  )
])

run_server(app, "0.0.0.0", debug=true)
