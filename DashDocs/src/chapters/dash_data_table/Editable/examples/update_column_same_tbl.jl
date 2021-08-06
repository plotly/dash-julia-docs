using Dash, DashHtmlComponents, DashCoreComponents
using DashTable

using CSV, DataFrames 

app = dash()

app.layout = html_div([
    DashTable.dash_datatable(
        id="computed-table",
        columns=[
            Dict("name" =>  "Input Data", "id" =>  "input-data"),
            Dict("name" =>  "Input Squared", "id" =>  "output-data")
        ],
        data=[Dict("input-data" =>  i) for i in 1:11],
        editable=true,
    ),
])


callback!(app,
    Output("computed-table", "data"),
    Input("computed-table", "data_timestamp"),
    State("computed-table", "data")
    ) do timestamp, rows
    rows_dict =  map(r->Dict(keys(r) .=> values(r)),rows)
    for row in rows_dict
        try
            row[Symbol("output-data")] = Float64(row[Symbol("input-data")])^2
        catch
            row[Symbol("input-data")] = "NA"
        end
    end
    return rows_dict
end



run_server(app, "0.0.0.0", debug=true)
