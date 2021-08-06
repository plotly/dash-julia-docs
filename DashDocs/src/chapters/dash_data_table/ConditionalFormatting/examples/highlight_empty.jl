using Dash, DashHtmlComponents
using DashTable

using CSV, DataFrames   


df = CSV.read("datasets/firm_none_table.csv", DataFrame)
df2 = ifelse.(ismissing.(df) .| (df .∈ Ref(["nothing", "None"])), missing, df)
app = dash()

app.layout = html_div([
  html_pre(string(df)),
  DashTable.dash_datatable(
      data=Dict.(pairs.(eachrow(df2))),
      columns=[Dict("name" =>c, "id" => c) for c in names(df)],
      style_data_conditional=(
          [
              Dict(
                  "if" =>  Dict(
                      "filter_query" =>  "{$col} is blank",
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

