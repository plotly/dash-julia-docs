using Dash, DashHtmlComponents
using DashTable

using CSV, DataFrames   

df = CSV.read(download("https://raw.githubusercontent.com/plotly/dash-julia-docs/mf/dashtable_ex/datasets/firm_none_table.csv"), DataFrame)
df = CSV.read("datasets/firm_none_table.csv", DataFrame)
df[!,"2017"] = replace(df[!,"2017"], NaN => "N/A")
df[!,"2017"] = replace(df[!,"2017"], missing => "N/A")
app = dash()

app.layout = html_div([
  html_pre(string(df)),
  DashTable.dash_datatable(
      data=Dict.(pairs.(eachrow(df))),
      columns=[Dict("name" =>c, "id" => c) for c in names(df)],
      style_data_conditional=(
          [
              Dict(
                  "if" =>  Dict(
                      "filter_query" =>  "{$col} = $(string("N/A"))",
                      "column_id" =>  col
                  ),
                  "backgroundColor" =>  "tomato",
                  "color" =>  "white"
              ) for col in names(df)
          ]
      )
  )
])

run_server(app, "0.0.0.0", debug=true)

