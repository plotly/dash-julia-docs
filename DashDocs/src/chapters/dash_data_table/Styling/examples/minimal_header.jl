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
    style_as_list_view=true,
    style_cell=Dict("padding" =>  "5px"),
    style_header=Dict(
        "backgroundColor" =>  "white",
        "fontWeight" =>  "bold"
    ),
    style_cell_conditional=[
        Dict(
            "if" =>  Dict("column_id" =>  c),
            "textAlign" =>  "left"
        ) for c in ["Date", "Region"]
    ],
    
)

run_server(app, "0.0.0.0", debug=true)