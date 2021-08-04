using Dash, DashHtmlComponents, DashCoreComponents
using DashTable

using CSV, DataFrames 

app = dash()


params = [
    "Weight", "Torque", "Width", "Height",
    "Efficiency", "Power", "Displacement"
]

app.layout = html_div([
    DashTable.dash_datatable(
        id="table-editing-simple",
        columns=(
            vcat([Dict("id" =>  "Model", "name" =>  "Model")],
            [Dict("id" =>  p, "name" =>  p) for p in params])
        ),
        data=[Dict("Model" => i, [param => 0
          for param in params]...) for i in 1:5
        ],
        editable=true
    ),
    dcc_graph(id="table-editing-simple-output")
])


callback!(app,
    Output("table-editing-simple-output", "figure"),
    Input("table-editing-simple", "data"),
    Input("table-editing-simple", "columns")
    ) do rows, columns 
    df = DataFrame(rows)
    select!(df, [c.name for c in columns])
    return (
        "data" =>  [Dict(
            "type" =>  "parcoords",
            "dimensions" =>  [Dict(
                "label" =>  col.name,
                "values" =>  df[!, col.id]
            ) for col in columns]
        )]
    )
end

run_server(app, "0.0.0.0", debug=true)
