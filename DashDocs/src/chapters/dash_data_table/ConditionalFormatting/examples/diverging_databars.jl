using Dash
using DashTable

using CSV, DataFrames 

df = CSV.read("datasets/region_params.csv", DataFrame)
app = dash()

app.layout =  DashTable.dash_datatable(
        data=Dict.(pairs.(eachrow(df))),
        sort_action="native",
        columns=[Dict("name" =>c, "id" => c) for c in names(df)],
        style_data_conditional=[Dict(
          "if" =>  Dict("filter_query" =>  "{Date} datestartswith $(string("2015-10"))"),
          "backgroundColor" =>  "#85144b",
          "color" =>  "white"
          )]
    )
 
run_server(app, "0.0.0.0", debug=true)
