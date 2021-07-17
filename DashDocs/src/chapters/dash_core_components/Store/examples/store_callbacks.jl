using Dash, DashHtmlComponents, DashCoreComponents
using CSV, DataFrames, DashTable


app = dash()



df = CSV.read(download("https://raw.githubusercontent.com/plotly/datasets/master/gapminderDataFiveYear.csv"), DataFrame)

countries = Set(df[!,"country"])


app.layout = html_div([
    dcc_store(id="memory-output"),
    dcc_dropdown(id="memory-countries", options=[
        Dict("value" => x, "label" => x) for x in countries
    ], multi=true, value=["Canada", "United States"]),
    dcc_dropdown(id="memory-field", options=[
        Dict("value" => "lifeExp", "label" => "Life expectancy"),
        Dict("value"=> "gdpPercap", "label"=> "GDP per capita"),
    ], value="lifeExp"),
    html_div([
        dcc_graph(id="memory-graph"),
        DashTable.dash_datatable(
            id="memory-table",
            columns=[Dict("name" =>i, "id" => i) for i in names(df)]
        ),
    ])
])


callback!(app,
  Output("memory-output", "data"),
  Input("memory-countries", "value")) do countries_selected

    
    if countries_selected isa Nothing
        # Return all the rows on initial load/no country selected.
        return [Dict(pairs(NamedTuple(eachrow(df)[j]))) for j in 1:nrow(df)]
    end
    return [Dict(pairs(NamedTuple(eachrow(df)[j]))) for j in 1:2]
    # filtered = df.query("country in @countries_selected")

    # return filtered.to_dict("records")

end
run_server(app, "0.0.0.0", debug=true)

@app.callback(Output("memory-table", "data"),
              Input("memory-output", "data"))
def on_data_set_table(data)=>
    if data is None=>
        raise PreventUpdate

    return data


callback(app, Output("memory-graph", "figure"),
              Input("memory-output", "data"),
              Input("memory-field", "value")) do data, field)
    if data isa Nothing
        throw(PreventUpdate())
    end

    aggregation = DefaultDict("lambda" => DefaultDict(Array))

    for row in data 

        a = aggregation[row["country"]]

        a["name"] = row["country"]
        a["mode"] = "lines+markers"

        a["x"].append(row[field])
        a["y"].append(row["year"])
    end

    return Dict(
        "data"=> [x for x in aggregation.values()]
    )
  

end 
if __name__ == "__main__"=>
    app.run_server(debug=True, threaded=True, port=10450)