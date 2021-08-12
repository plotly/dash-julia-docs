using Dash, DashHtmlComponents, DashCoreComponents
using HTTP, PlotlyJS, CSV, DataFrames, JSON2

external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]

app = dash(external_stylesheets=external_stylesheets)

read_remote_csv(url) = DataFrame(CSV.File(HTTP.get(url).body))
df = read_remote_csv("https://raw.githubusercontent.com/plotly/datasets/master/gapminderDataFiveYear.csv")

available_countries = unique(df.country)

app.layout = html_div() do
    dcc_graph(id="clientside-graph-plotlyjs"),
    dcc_store(
        id="clientside-figure-store-plotlyjs",
        data=[
            Dict(
                :x => df[df.country .== "Canada", "year"],
                :y => df[df.country .== "Canada", "pop"],
            )
        ]
    ),
    "Indicator",
    dcc_dropdown(
        id="clientside-graph-indicator-plotlyjs",
        options=[
            (label = "Population", value = "pop"),
            (label = "Life Expectancy", value = "lifeExp"),
            (label = "GDP per Capita", value = "gdpPercap"),
        ],
        value="pop",
    ),
    "Country",
    dcc_dropdown(
        id="clientside-graph-country-plotlyjs",
        options=[
            (label = country, value = country) for country in available_countries
        ],
        value="Canada",
    ),
    "Graph scale",
    dcc_radioitems(
        id="clientside-graph-scale-plotlyjs",
        options=[(label = x, value = x) for x in ["linear", "log"]],
        value="linear",
    ),
    html_hr(),
    html_details([
        html_summary("Contents of figure storage"),
        dcc_markdown(id="clientside-figure-json"),
    ])
end



callback!(
    app,
    Output("clientside-figure-store-plotlyjs", "data"),
    Input("clientside-graph-indicator-plotlyjs", "value"),
    Input("clientside-graph-country-plotlyjs", "value"),
) do indicator, country
    dff = df[df.country .== country, :]
    plot(df, x=:year, y=Symbol(indicator), mode="markers")
end

callback!(
    """
    function(figure, scale) {
        if(figure === undefined) {
            return {'data': [], 'layout': {}};
        }
        const fig = Object.assign({}, figure, {
            'layout': {
                ...figure.layout,
                'yaxis': {
                    ...figure.layout.yaxis, type: scale
                }
             }
        });
        return fig;
    }
    """,
    app,
    Output("clientside-graph-plotlyjs", "figure"),
    Input("clientside-figure-store-plotlyjs", "data"),
    Input("clientside-graph-scale-plotlyjs", "value"),
)

callback!(
    app,
    Output("clientside-figure-json-plotlyjs", "children"),
    Input("clientside-figure-store-plotlyjs", "data"),
) do data
    buf = IOBuffer()
    JSON2.pretty(buf, JSON2.write(data))
    js = String(take!(buf))
    """
    ```
    $(js)
    ```
    """
end

run_server(app, "0.0.0.0", debug=true)
