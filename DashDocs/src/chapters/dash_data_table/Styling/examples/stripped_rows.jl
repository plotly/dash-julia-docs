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
        Dict(
            "if" =>  Dict("column_id" =>  c),
            "textAlign" =>  "left"
        ) for c in ["Date", "Region"]
    ],
    style_data_conditional=[
        Dict(
            "if" =>  Dict("row_index" =>  "odd"),
            "backgroundColor" =>  "rgb(248, 248, 248)"
        )
    ],
    style_header=Dict(
        "backgroundColor" =>  "rgb(230, 230, 230)",
        "fontWeight" =>  "bold"
    )
    
)

run_server(app, "0.0.0.0", debug=true)