using Dash 
using DashTable

using CSV, DataFrames   

df = CSV.read("datasets/region_params.csv", DataFrame)
app = dash()

nm = names(df)
new_nm = names(df,Number)
df_numeric_columns = df[!,new_nm]
df_mean = mean([mean(df[!,n]) for n in names(df, Number)])


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
                  "filter_query" =>  "{$col} > $df_mean",
                  "column_id" =>  col
              ),
              "backgroundColor" =>  "#3D9970",
              "color" =>  "white"
              ) for col in names(df)
      ],
      [
          Dict(
              "if" =>  Dict(
                  "filter_query" =>  "{$col} <= $df_mean",
                  "column_id" =>  col
              ),
              "backgroundColor" =>  "#FF4136",
              "color" =>  "white"
              ) for col in names(df)
      ]
  )
    
)

run_server(app, "0.0.0.0", debug=true)

