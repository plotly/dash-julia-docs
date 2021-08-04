using Dash
using DashTable

using CSV, DataFrames 

app = dash()

markdown_table = """
| City       | Value     | Return     |
|  => ------------- |  => ---------- =>  | ----------- =>  |
|  Montreal   | 41,531    | 431.245 |
| Seattle   | 53,153 | 12.431 |
"""

app.layout =  DashTable.dash_datatable(
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
    tooltip=Dict(
        c =>  Dict("value" =>  markdown_table, "type" =>  "markdown")
        for c in ["shop", "sales", "goal"]
    ),
    tooltip_delay=0,
    tooltip_duration=nothing
)
 
run_server(app, "0.0.0.0", debug=true)
