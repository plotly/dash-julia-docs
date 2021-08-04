using Dash 
using DashTable

using CSV, DataFrames   
using Statistics

df = CSV.read("datasets/firm_table.csv", DataFrame)
app = dash()

nm = names(df)
new_nm = names(df,Number)
df_numeric_columns = df[!,new_nm]
val_quant = [quantile(Array(df_numeric_columns[!,n]), 0.1) for n in names(df_numeric_columns)]


app.layout = DashTable.dash_datatable(
    data = map(eachrow(df)) do r
      Dict(names(r) .=> values(r))
    end,
    sort_action="native",
    columns=[Dict("name" =>c, "id" => c) for c in names(df) if c!= "id"],
    style_data_conditional=[
      Dict(
          "if" =>  Dict(
              "filter_query" =>  "{$(new_nm[idx])} <= $value",
              "column_id" =>  new_nm[idx]
              ),
          "backgroundColor" =>  "#B10DC9",
          "color" =>  "white"
      ) for (idx, value) in enumerate(val_quant)
  ]
    
)

run_server(app, "0.0.0.0", debug=true)

