using Dash
using DashTable

using CSV, DataFrames 

df = CSV.read("datasets/region_params.csv", DataFrame)
app = dash()

app.layout =  DashTable.dash_datatable(
    data=Dict.(pairs.(eachrow(df))),
    columns=[Dict("name" =>c, "id" => c) for c in names(df)],
    tooltip_header=Dict(
        "Region" =>  "Reg",
        "Temperature" =>  "Temp",
        "Pressure" =>  "Pre",
    ),

    # Style headers with a dotted underline to indicate a tooltip
    style_header_conditional=[Dict(
        "if" =>  Dict("column_id" =>  col),
        "textDecoration" =>  "underline",
        "textDecorationStyle" =>  "dotted",
    ) for col in ["Region", "Temperature", "Pressure"]],

    # Overflow into ellipsis
    style_cell=Dict(
        "overflow" =>  "hidden",
        "textOverflow" =>  "ellipsis",
        "maxWidth" =>  0,
    ),
    tooltip_delay=0,
    tooltip_duration=nothing
)
 
run_server(app, "0.0.0.0", debug=true)
