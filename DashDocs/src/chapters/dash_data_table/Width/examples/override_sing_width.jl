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
    style_data=Dict(
        "width" =>  "100px",
        "maxWidth" =>  "100px",
        "minWidth" =>  "100px",
    ),
    style_cell_conditional=[
        Dict(
            "if" =>  ("column_id" =>  "Region"),
            "width" =>  "250px"
        ),
    ],
    style_table=Dict(
        "overflowX" =>  "auto"
    )
    
)

run_server(app, "0.0.0.0", debug=true)