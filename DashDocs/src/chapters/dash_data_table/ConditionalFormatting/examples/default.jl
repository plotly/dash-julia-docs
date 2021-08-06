using Dash 
using DashTable

using CSV, DataFrames   

df = CSV.read("datasets/region_params.csv", DataFrame)

app = dash()

app.layout = DashTable.dash_datatable(
    data = map(eachrow(df)) do r
      Dict(names(r) .=> values(r))
    end,
    sort_action="native",
    columns=[
        Dict("name" => "Date", "id" => "Date", "type" => "datetime", "editable" => false),
        Dict("name" => "Delivery", "id" => "Delivery", "type" => "datetime"),
        Dict("name" => "Region", "id" => "Region", "type" => "text"),
        Dict("name" => "Temperature", "id" => "Temperature", "type" => "numeric"),
        Dict("name" => "Humidity", "id" => "Humidity", "type" => "numeric"),
        Dict("name" => "Pressure", "id" => "Pressure", "type" => "any"),
    ],
    editable=true,
    style_data_conditional=[
        Dict(
            "if" => Dict(
                "column_id" => "Region",
            ),
            "backgroundColor" => "dodgerblue",
            "color" => "white"
        ),
        Dict(
            "if" => Dict(
                "filter_query" => "{Humidity} > 19 && {Humidity} < 41",
                "column_id" => "Humidity"
            ),
            "backgroundColor" => "tomato",
            "color" => "white"
        ),

        Dict(
            "if" => Dict(
                "column_id" => "Pressure",

                # since using .format, escape { with {{
                "filter_query" => "{Pressure} = $(maximum(df[!,"Pressure"]))"
            ),
            "backgroundColor" => "#85144b",
            "color" => "white"
        ),

        Dict(
            "if" => Dict(
                "row_index" => 5,  # number | "odd" | "even"
                "column_id" => "Region"
            ),
            "backgroundColor" => "hotpink",
            "color" => "white"
        ),

        Dict(
            "if" => Dict(
                "filter_query" => "{id} = 4",  # matching rows of a hidden column with the id, `id`
                "column_id" => "Region"
            ),
            "backgroundColor" => "RebeccaPurple"
        ),

        Dict(
            "if" => Dict(
                "filter_query" => "{Delivery} > {Date}", # comparing columns to each other
                "column_id" => "Delivery"
            ),
            "backgroundColor" => "#3D9970"
        ),

        Dict(
            "if" => Dict(
                "column_editable" => false  # True | False
            ),
            "backgroundColor" => "rgb(240, 240, 240)",
            "cursor" => "not-allowed"
        ),

        Dict(
            "if" => Dict(
                "column_type" => "text"  # "text" | "any" | "datetime" | "numeric"
            ),
            "textAlign" => "left"
        ),

        Dict(
            "if" => Dict(
                "state" => "active"  # "active" | "selected"
            ),
           "backgroundColor" => "rgba(0, 116, 217, 0.3)",
           "border" => "1px solid rgb(0, 116, 217)"
        )

    ],
    
)

run_server(app, "0.0.0.0", debug=true)