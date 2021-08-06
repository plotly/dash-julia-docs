using Dash 
using DashTable

using CSV, DataFrames   
using Statistics

df = CSV.read("datasets/region_params.csv", DataFrame)
app = dash()

nm = names(df)
new_nm = names(df,Number)
df_numeric_columns = df[!,new_nm]
val_quant_5 = [quantile(Array(df_numeric_columns[!,n]), 0.5) for n in names(df_numeric_columns)]
val_quant_1 = [quantile(Array(df_numeric_columns[!,n]), 0.1) for n in names(df_numeric_columns)]


app.layout = DashTable.dash_datatable(
    data = map(eachrow(df)) do r
      Dict(names(r) .=> values(r))
    end,
    sort_action="native",
    columns=[Dict("name" =>c, "id" => c) for c in names(df) if c!= "id"],
    style_data_conditional=vcat(
      [
          Dict(
              "if" =>  Dict(
                  "filter_query" =>  "{$(new_nm[col])} > $value",
                  "column_id" =>  new_nm[col]
              ),
              "backgroundColor" =>  "#3D9970",
              "color" =>  "white"
              ) for (col, value) in enumerate(val_quant_1)
      ],
      [
          Dict(
              "if" =>  Dict(
                  "filter_query" =>  "{$(new_nm[col])} <= $value",
                  "column_id" =>  new_nm[col]
              ),
              "backgroundColor" =>  "#FF4136",
              "color" =>  "white"
              ) for (col, value) in enumerate(val_quant_5)
      ]
  )
    
)

run_server(app, "0.0.0.0", debug=true)

