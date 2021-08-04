using Dash 
using DashTable

using CSV, DataFrames
using DataStructures   

df = CSV.read("datasets/region_params.csv", DataFrame)

app = dash()

app.layout = DashTable.dash_datatable(
    data = map(eachrow(df)) do r
      Dict(names(r) .=> values(r))
    end,
    columns=[Dict("name" =>c, "id" => c) for c in names(df)],
    style_data_conditional=vcat(
      [
          Dict(
              "if" =>  Dict(
                  "filter_query" =>  "{Temperature} = $i",
                  "column_id" =>  "Temperature",
              ),
              "backgroundColor" =>  "#0074D9",
              "color" =>  "white"
          )
          for i in nlargest(3,df[!,"Temperature"])
      ],
      [
          Dict(
              "if" =>  Dict(
                  "filter_query" =>  "{Pressure} = $i",
                  "column_id" =>  "Pressure",
              ),
              "backgroundColor" =>  "#7FDBFF",
              "color" =>  "white"
          )
          for i in nsmallest(3, df[!,"Pressure"])
      ]
    )
    
)

run_server(app, "0.0.0.0", debug=true)
