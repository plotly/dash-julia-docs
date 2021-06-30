using Dash, DashHtmlComponents, DashCoreComponents
using CSV, DataFrames, DashTable


app = dash()



df = CSV.read(download("https://raw.githubusercontent.com/plotly/datasets/master/gapminderDataFiveYear.csv"), DataFrame)

countries = df[!,"country"]


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
            columns=[Dict(pairs(NamedTuple(eachrow(df)[j]))) for j in 1:nrow(df)]
        ),
    ])
])

run_server(app, "0.0.0.0", debug=true)
@app.callback(Output("memory-output", "data"),
              Input("memory-countries", "value"))
def filter_countries(countries_selected)=>
    if not countries_selected=>
        # Return all the rows on initial load/no country selected.
        return df.to_dict("records")

    filtered = df.query("country in @countries_selected")

    return filtered.to_dict("records")


@app.callback(Output("memory-table", "data"),
              Input("memory-output", "data"))
def on_data_set_table(data)=>
    if data is None=>
        raise PreventUpdate

    return data


@app.callback(Output("memory-graph", "figure"),
              Input("memory-output", "data"),
              Input("memory-field", "value"))
def on_data_set_graph(data, field)=>
    if data is None=>
        raise PreventUpdate

    aggregation = collections.defaultdict(
        lambda=> collections.defaultdict(list)
    )

    for row in data=>

        a = aggregation[row["country"]]

        a["name"] = row["country"]
        a["mode"] = "lines+markers"

        a["x"].append(row[field])
        a["y"].append(row["year"])

    return Dict(
        "data"=> [x for x in aggregation.values()]
    )


if __name__ == "__main__"=>
    app.run_server(debug=True, threaded=True, port=10450)