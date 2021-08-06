using Dash 
using DashTable

using CSV, DataFrames   

df = CSV.read(download("https://raw.githubusercontent.com/plotly/datasets/master/nz_weather.csv"), DataFrame)

app = dash()

app.layout = DashTable.dash_datatable(
    data = map(eachrow(df)) do r
      Dict(names(r) .=> values(r))
    end,
    columns=[Dict("name" =>c, "id" => c) for c in names(df)],
    page_size=20, # we have less data in this example, so setting to 20
    style_table=Dict("height" => "300px", "overflowY" => "auto")
)

run_server(app, "0.0.0.0", debug=true)