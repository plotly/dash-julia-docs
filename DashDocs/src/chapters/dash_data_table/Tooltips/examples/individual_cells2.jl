using Dash 
using DashTable

using CSV, DataFrames   

df = DataFrame(Dict(
    "shop" =>  ["Bakersfield", "Berkely", "Big Bear Lake"],
    "sales" =>  [3, 1, 5],
    "goal" =>  [10, 1, 4],
    "address" =>  [
        "3000 Mall View Road, Suite 1107\n\nBakersfield, CA\n\n93306",
        "2130 Center Street, Suite 102\n\nBerkeley, CA\n\n94704",
        "652 Pine Knot Avenue\n\nBig Bear Lake, CA\n\n92315"
    ]
))

app = dash()

dict_data = Dict.(pairs.(eachrow(df)))

app.layout = DashTable.dash_datatable(
    data= dict_data,
    columns=[Dict("id" =>  c, "name" =>  c) for c in ["shop", "sales", "goal"]],
    tooltip_data=[Dict(
        "shop" =>  Dict("value" =>  row[:address], "type" =>  "markdown"),
        "sales" =>  Dict(
            "value" =>  "Sales were $(string(abs(row[:goal] - row[:sales]))) $((row[:goal] > row[:sales]) ? "less" : "more") than the goal",
            "type" =>  "markdown"
        ),
        "goal" =>  "Goal was $((row[:goal] > row[:sales]) ? "not achieved" : "achieved")"
    ) for row in dict_data],
    tooltip_delay=0,
    tooltip_duration=nothing
)
run_server(app, "0.0.0.0", debug=true)