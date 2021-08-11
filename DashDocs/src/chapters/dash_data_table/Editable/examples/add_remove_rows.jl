using Dash, DashHtmlComponents, DashCoreComponents
using DashTable

using CSV, DataFrames 

app = dash()

app.layout = html_div([
    html_div([
        dcc_input(
            id="adding-rows-name",
            placeholder="Enter a column name...",
            value="",
            style=Dict("padding" =>  10)
        ),
        html_button("Add Column", id="adding-rows-button", n_clicks=0)
    ], style=Dict("height" =>  50)),

    DashTable.dash_datatable(
        id="adding-rows-table",
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
        row_deletable=true
    ),

    html_button("Add Row", id="editing-rows-button", n_clicks=0),

    dcc_graph(id="adding-rows-graph")
])


callback!(app,
    Output("adding-rows-table", "data"),
    Input("editing-rows-button", "n_clicks"),
    State("adding-rows-table", "data"),
    State("adding-rows-table", "columns")
) do n_clicks, rows, columns
    if n_clicks > 0
        push!(rows, Dict(c.id =>  "" for c in columns))
    end
    return rows
end


callback!(app,
    Output("adding-rows-table", "columns"),
    Input("adding-rows-button", "n_clicks"),
    State("adding-rows-name", "value"),
    State("adding-rows-table", "columns")
) do n_clicks, value, existing_columns
    if (n_clicks > 0) && (value != "")
        push!(existing_columns, Dict(
            "id" =>  value, "name" =>  value,
            "renamable" =>  true, "deletable" =>  true
        ))
    end
    return existing_columns
end


callback!(app,
    Output("adding-rows-graph", "figure"),
    Input("adding-rows-table", "data"),
    Input("adding-rows-table", "columns")
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
