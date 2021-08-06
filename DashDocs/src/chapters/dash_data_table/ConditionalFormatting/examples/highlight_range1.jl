using Dash 
using DashTable

using CSV, DataFrames   

df = CSV.read("datasets/firm_table.csv", DataFrame)
app = dash()


app.layout = DashTable.dash_datatable(
    data = map(eachrow(df)) do r
      Dict(names(r) .=> values(r))
    end,
    sort_action="native",
    columns=[Dict("name" =>c, "id" => c) for c in names(df) if c!= "id"],
    style_data_conditional=[
      Dict(
          "if" =>  Dict(
              "filter_query" =>  "{$col} >= 5 && {$col} < 10",
              "column_id" =>  col
          ),
          "backgroundColor" =>  "#B10DC9",
          "color" =>  "white"
      ) for col in names(df)
  ]
    
)

run_server(app, "0.0.0.0", debug=true)
