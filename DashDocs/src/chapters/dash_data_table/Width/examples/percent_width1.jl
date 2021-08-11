using Dash 
using DashTable

using CSV, DataFrames   

df = CSV.read("datasets/region_params.csv", DataFrame)
df = select!(df, Not(:Date))

app = dash()

app.layout = DashTable.dash_datatable(
    data = map(eachrow(df)) do r
      Dict(names(r) .=> values(r))
    end,
    columns=[Dict("name" =>c, "id" => c) for c in names(df)],
    style_cell_conditional=[
            Dict("if" =>  Dict("column_id" =>  "Region"),
             "width" =>  "10%")
        ]
    
)

run_server(app, "0.0.0.0", debug=true)