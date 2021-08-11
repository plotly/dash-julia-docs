using Dash
using DashTable

using CSV, DataFrames 

df = CSV.read("datasets/region_params.csv", DataFrame)
app = dash()

app.layout =  DashTable.dash_datatable(
        data=Dict.(pairs.(eachrow(df))),
        columns=[Dict("name" =>c, "id" => c) for c in names(df)],
        tooltip_conditional=[
          Dict(
              "if" =>  Dict(
                  "filter_query" =>  "{Region} contains $(string("New"))"
              ),
              "type" =>  "markdown",
              "value" =>  "This row is significant."
          )
      ],

      style_data_conditional=[
          Dict(
              "if" =>  Dict(
                  "filter_query" =>  "{Region} contains $(string("New"))"
              ),
              "backgroundColor" =>  "#0074D9",
              "color" =>  "white",
              "textDecoration" =>  "underline",
              "textDecorationStyle" =>  "dotted",
          )
      ],
      tooltip_delay=0,
      tooltip_duration=nothing
    )
 
run_server(app, "0.0.0.0", debug=true)
