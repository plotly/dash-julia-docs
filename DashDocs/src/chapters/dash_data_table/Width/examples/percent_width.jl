using Dash 
using DashTable

using CSV, DataFrames   

df = CSV.read("datasets/region_params.csv", DataFrame)


app = dash()

app.layout = DashTable.dash_datatable(
    data = map(eachrow(df)) do r
      Dict(names(r) .=> values(r))
    end,
    columns=[Dict("name" =>c, "id" => c) for c in names(df)],
    style_cell_conditional=[
        Dict("if" =>  Dict("column_id" =>  "Date"),
         "width" =>  "30%"),
         Dict("if" =>  Dict("column_id" =>  "Region"),
         "width" =>  "30%"),
    ]
    
)

run_server(app, "0.0.0.0", debug=true)