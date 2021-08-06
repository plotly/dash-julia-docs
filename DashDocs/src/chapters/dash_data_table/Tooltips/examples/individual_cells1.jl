using Dash 
using DashTable

using CSV, DataFrames   

app = dash()

app.layout = DashTable.dash_datatable(
    data=[
        Dict("shop" =>  "Bakersfield", "sales" =>  4, "goal" =>  10),
        Dict("shop" =>  "Berkeley", "sales" =>  10, "goal" =>  1),
        Dict("shop" =>  "Big Bear Lake", "sales" =>  5, "goal" =>  4)
    ],
    columns=[
        Dict("id" =>  "shop", "name" =>  "Store Location"),
        Dict("id" =>  "sales", "name" =>  "Sales Revenue"),
        Dict("id" =>  "goal", "name" =>  "Revenue Goal"),
    ],
    tooltip_data=[
        Dict(
            "shop" =>  "Location at Bakersfield",
            "sales" =>  "\$4M in Revenue",
            "goal" =>  Dict("value" =>  "6M **under** Goal", "type" =>  "markdown")
        ),
        Dict(
            "shop" =>  "Location at Berkeley",
            "sales" =>  "\$10M in Revenue",
            "goal" =>  Dict("value" =>  "9M **over** Goal", "type" =>  "markdown")
        ),
        Dict(
            "shop" =>  "Location at Big Bear Lake",
            "sales" =>  "\$5M in Revenue",
            "goal" =>  Dict("value" =>  "1M **over** Goal", "type" =>  "markdown")
        ),
    ],
    tooltip_delay=0,
    tooltip_duration=nothing
)
run_server(app, "0.0.0.0", debug=true)