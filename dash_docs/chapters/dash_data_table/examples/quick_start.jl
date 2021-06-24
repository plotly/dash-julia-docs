using Dash, DashHtmlComponents, DashCoreComponents
using DashTable

using CSV, DataFrames   

df = CSV.read(download("https://raw.githubusercontent.com/plotly/datasets/master/solar.csv"), DataFrame)

app = dash()

app.layout = DashTable.dash_datatable(
    id="table",
    columns=[Dict("name" =>i, "id" => i) for i in names(df)],
    data = [Dict(pairs(NamedTuple(eachrow(df)[j]))) for j in 1:nrow(df)]
)

run_server(app, "0.0.0.0", debug=true)