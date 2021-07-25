using Dash 
using DashTable

using CSV, DataFrames   

df = CSV.read("datasets/multline_height_constrain.csv", DataFrame)


app = dash()

app.layout = DashTable.dash_datatable(
    data = map(eachrow(df)) do r
      Dict(names(r) .=> values(r))
    end,
    columns=[Dict("name" =>c, "id" => c) for c in names(df)],
    style_table=Dict("overflowX" =>  "auto"),
    style_cell=Dict(
        "height" =>  "auto",
        # all three widths are needed
        "minWidth" =>  "180px", "width" =>  "180px", "maxWidth" =>  "180px",
        "whiteSpace" =>  "normal"
    ),
    
)

run_server(app, "0.0.0.0", debug=true)