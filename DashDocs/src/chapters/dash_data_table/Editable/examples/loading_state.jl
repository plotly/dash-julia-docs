using Dash, DashHtmlComponents, DashCoreComponents
using DashTable
using Random

Random.seed!(123)

using CSV, DataFrames 

app = dash()

app.layout = html_div([
    "Choose property to load:  ",
    dcc_dropdown(
        id="loading-states-table-prop",
        options=[
            Dict("label" =>  prop, "value" =>  prop)
            for prop in ["style_cell", "data"]
        ]
    ),
    html_br(),
    DashTable.dash_datatable(
        id="loading-states-table",
        columns=[Dict(
            "name" =>  "Column $i",
            "id" =>  "column-$i",
            "deletable" =>  true,
            "renamable" =>  true
        ) for i in 1:5],
        data=data=[
          Dict("column-$i" => (rand(1:100)) for i in 1:5)
           for j in 1:5],
        editable=true
    )
])


callback!(app,
    Output("loading-states-table", "style_cell"),
    Input("loading-states-table-prop", "value")
) do value 
    if value == "style_cell"
        sleep(5)
        return Dict("color" =>  "rgb($(rand(0:255)), $(rand(0:255)), $(rand(0:255)))")
    end
    throw(PreventUpdate())
end

callback!(app,
    Output("loading-states-table", "data"),
    Input("loading-states-table-prop", "value")
) do value
    if value == "data"
        sleep(5)
        return [
            Dict("column-$i" => 
             (rand(0:100)) for i in 1:5)
            for j in 1:5
        ]
    end
    throw(PreventUpdate())
end


run_server(app, "0.0.0.0", debug=true)
