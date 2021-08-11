using Dash 
using DashTable

using CSV, DataFrames   

df = CSV.read("datasets/region_params.csv", DataFrame)

app = dash()

app.layout = DashTable.dash_datatable(
    data = map(eachrow(df)) do r
      Dict(names(r) .=> values(r))
    end,
    columns=[Dict("name" =>c, "id" => c, "editable" => (c == "Humidity")) for c in names(df)],
    style_data_conditional=[Dict(
        "if" =>  Dict("column_editable" =>  false),
        "backgroundColor" =>  "rgb(30, 30, 30)",
        "color" =>  "white"
    )],
    style_header_conditional=[Dict(
        "if" =>  Dict("column_editable" =>  false),
        "backgroundColor" =>  "rgb(30, 30, 30)",
        "color" =>  "white"
    )],
    
)

run_server(app, "0.0.0.0", debug=true)