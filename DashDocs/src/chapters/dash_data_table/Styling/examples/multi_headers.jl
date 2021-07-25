using Dash 
using DashTable

using CSV, DataFrames   

df = CSV.read("datasets/region_params.csv", DataFrame)

app = dash()

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
data=[
    Dict(
        "year" =>  i,
        "montreal" =>  i * 10,
        "toronto" =>  i * 100,
        "ottawa" =>  i * -1,
        "vancouver" =>  i * -10,
        "temp" =>  i * -100,
        "humidity" =>  i * 5,
    )
    for i in 1:10
],
merge_duplicate_headers=true,
    
)

run_server(app, "0.0.0.0", debug=true)