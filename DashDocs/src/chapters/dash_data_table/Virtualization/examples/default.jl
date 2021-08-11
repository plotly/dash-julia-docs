using Dash
using DashTable

using CSV, DataFrames 

df = CSV.read(download("https://raw.githubusercontent.com/plotly/datasets/master/Emissions%20Data.csv"), DataFrame)

app = dash()

app.layout = DashTable.dash_datatable(
        id="table-virtualization",
        data=Dict.(pairs.(eachrow(df))),
        columns=[
            Dict("name"=> i, "id"=> i) for i in names(df)
        ],
        fixed_rows=Dict( "headers"=> true, "data"=> 0 ),
        style_cell=Dict(
            "whiteSpace"=> "normal"
        ),
        style_data_conditional=[
            Dict("if"=> Dict("column_id"=> "index"),
             "width"=> "50px"),
            Dict("if"=> Dict("column_id"=> "Year"),
             "width"=> "50px"),
            Dict("if"=> Dict("column_id"=> "Country"),
             "width"=> "100px"),
            Dict("if"=> Dict("column_id"=> "Continent"),
             "width"=> "70px"),
            Dict("if"=> Dict("column_id"=> "Emission"),
             "width"=> "75px"),
        ],
        virtualization=true,
        page_action="none"
)

run_server(app, "0.0.0.0", debug=true)
