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
  columns=[
    Dict("name" =>  ["", "Year"], "id" =>  "year"),
    Dict("name" =>  ["City", "Montreal"], "id" =>  "montreal"),
    Dict("name" =>  ["City", "Toronto"], "id" =>  "toronto"),
    Dict("name" =>  ["City", "Ottawa"], "id" =>  "ottawa"),
    Dict("name" =>  ["City", "Vancouver"], "id" =>  "vancouver"),
    Dict("name" =>  ["Climate", "Temperature"], "id" =>  "temp"),
    Dict("name" =>  ["Climate", "Humidity"], "id" =>  "humidity"),
],
data=[Dict(
    "year" =>  i, "montreal" =>  i * 10, "toronto" =>  i * 100,
    "ottawa" =>  i * -1, "vancouver" =>  i * -10, "temp" =>  i * -100,
    "humidity" =>  i * 5,
) for i in 1:10],
merge_duplicate_headers=true,

tooltip_header=Dict(
    "year" =>  ["", "Year the measurement was taken"],
    "montreal" =>  ["Average Measurements Across City", "Montreal, QC, Canada"],
    "toronto" =>  ["Average Measurements Across City", "Toronto, ON, Canada"],
    "ottawa" =>  ["Average Measurements Across City", "Ottawa, ON, Canada"],
    "vancouver" =>  ["Average Measurements Across City", "Vancouver, BC, Canada"],
    "temp" =>  ["Average for a Year", "Celcius"],
    "humidity" =>  ["Average for a Year", "Percentage"],
),

style_header=Dict(
    "textDecoration" =>  "underline",
    "textDecorationStyle" =>  "dotted",
),
)
run_server(app, "0.0.0.0", debug=true)