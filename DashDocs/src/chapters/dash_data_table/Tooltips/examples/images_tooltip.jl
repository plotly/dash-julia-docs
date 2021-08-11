using Dash
using DashTable

using CSV, DataFrames 

app = dash()

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
  tooltip_data=[
      Dict(
          "shop" =>  Dict(
              "value" =>  "Location at Bakersfield\n\n![Bakersfield]($(string("/assets/images/table/bakers.jpg")))",
              "type" =>  "markdown"
          )
      ),
      Dict(
          "shop" =>  Dict(
              "value" =>  "Location at Berkeley\n\n![Berkeley]($(string("/assets/images/table/berkley.jpg")))",
              "type" =>  "markdown"
          )
      ),
      Dict(
          "shop" =>  Dict(
              "value" =>  "Location at Big Bear Lake\n\n![Big Bear Lake](https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Big_Bear_Valley%2C_California.jpg/1200px-Big_Bear_Valley%2C_California.jpg)",
              "type" =>  "markdown"
          )
      ),
  ],

  # Style headers with a dotted underline to indicate a tooltip
  style_data_conditional=[Dict(
      "if" =>  Dict("column_id" =>  "shop"),
      "textDecoration" =>  "underline",
      "textDecorationStyle" =>  "dotted",
  )],

  tooltip_delay=0,
  tooltip_duration=nothing
)
 
run_server(app, "0.0.0.0", debug=true)
