using Dash, DashHtmlComponents, DashCoreComponents
using DashTable

using CSV, DataFrames 

app = dash()

app.layout = html_div([
    html_div([
        dcc_input(
            id="editing-columns-name",
            placeholder="Enter a column name...",
            value="",
            style=Dict("padding" =>  10)
        ),
        html_button("Add Column", id="editing-columns-button", n_clicks=0)
    ], style=Dict("height" =>  50)),

    DashTable.dash_datatable(
        id="editing-columns",
        columns=[Dict(
            "name" =>  "Column $i",
            "id" =>  "column-$i",
            "deletable" =>  true,
            "renamable" =>  true
        ) for i in 1:4],
        data=[
            Dict("column-$i" =>  (j + (i-1)*5)-1 for i in 1:4)
            for j in 1:5
        ],
        editable=true,
    ),
    dcc_graph(id="editing-columns-graph")
])


callback!(app,
    Output("editing-columns", "columns"),
    Input("editing-columns-button", "n_clicks"),
    State("editing-columns-name", "value"),
    State("editing-columns", "columns")
)  do n_clicks, value, existing_columns
    if n_clicks > 0 && value != ""
        push!(existing_columns, Dict(
            "id" =>  value, "name" =>  value,
            "renamable" =>  true, "deletable" =>  true
        ))
    end
    return existing_columns
end


callback!(app,
    Output("editing-columns-graph", "figure"),
    Input("editing-columns", "data"),
    Input("editing-columns", "columns")
) do rows, columns
    try
        return Dict(
            "data" =>  [Dict(
                "type" =>  "heatmap",
                "z" =>  [[row[Symbol(c.id)] for c in columns] for row in rows],
                "x" =>  [c.name for c in columns]
            )]
        )
    catch
        throw(PreventUpdate())
    end
end

run_server(app, "0.0.0.0", debug=true)
