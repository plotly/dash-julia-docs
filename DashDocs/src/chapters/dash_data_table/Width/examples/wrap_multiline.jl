using Dash 
using DashTable

using CSV, DataFrames   

df = CSV.read("datasets/multline_height_constrain.csv", DataFrame)


app = dash()

app.layout = DashTable.dash_datatable(
    style_data=Dict(
        "whiteSpace" =>  "normal",
    ),
    data = Dict.(pairs.(eachrow(df))),
    columns=[Dict("name" =>c, "id" => c) for c in names(df)],
    css=[Dict(
        "selector" =>  ".dash-spreadsheet td div",
        "rule" =>  """
            line-height :  15px;
            max-height :  30px; min-height :  30px; height :  30px;
            display :  block;
            overflow-y :  hidden;
        """
    )],
    tooltip_data=map(eachrow(df)) do r
      Dict(names(r) .=> string.(values(r)))
    end,
    tooltip_duration=nothing,
    style_cell=Dict("textAlign" =>  "left") # left align text in columns for readability
    
)

run_server(app, "0.0.0.0", debug=true)