using Dash 
using DashTable

using CSV, DataFrames   

df = CSV.read(download("https://raw.githubusercontent.com/plotly/datasets/master/solar.csv"), DataFrame)


app = dash()

app.layout = DashTable.dash_datatable(
    style_data=Dict(
        "whiteSpace" =>  "normal",
        "height" =>  "auto",
    ),
    data = map(eachrow(df)) do r
      Dict(names(r) .=> values(r))
    end,
    columns=[Dict("name" =>c, "id" => c) for c in names(df)],
    
)

run_server(app, "0.0.0.0", debug=true)