using CSV, DataFrames, HTTP, PlotlyJS
using Dash, DashHtmlComponents, DashCoreComponents

load_csv(url) = DataFrame(CSV.File(HTTP.get(url).body))

df2 = load_csv("https://raw.githubusercontent.com/plotly/datasets/master/country_indicators.csv")

dropmissing!(df2)

rename!(df2, Dict(:"Year" => "year"))

available_indicators = unique(df2[!, "Indicator Name"])
years = unique(df2[!, "year"])

app = dash()

app.layout = html_div() do
    html_div(
        children = [
            dcc_dropdown(
                id = "xaxis-column",
                options = [
                    (label = i, value = i) for i in available_indicators
                ],
                value = "Fertility rate, total (births per woman)",
            ),
            dcc_radioitems(
                id = "xaxis-type",
                options = [(label = i, value = i) for i in ["linear", "log"]],
                value = "linear",
            ),
        ],
        style = (width = "48%", display = "inline-block"),
    ),
    html_div(
        children = [
            dcc_dropdown(
                id = "yaxis-column",
                options = [
                    (label = i, value = i) for i in available_indicators
                ],
                value = "Life expectancy at birth, total (years)",
            ),
            dcc_radioitems(
                id = "yaxis-type",
                options = [(label = i, value = i) for i in ["linear", "log"]],
                value = "linear",
            ),
        ],
        style = (width = "48%", display = "inline-block", float = "right"),
    ),
    dcc_graph(id = "indicator-graphic"),
    dcc_slider(
        id = "year-slider-2",
        min = minimum(years),
        max = maximum(years),
        marks = Dict([Symbol(v) => Symbol(v) for v in years]),
        value = minimum(years),
        step = nothing,
    )
end

callback!(
    app,
    Output("indicator-graphic", "figure"),
    Input("xaxis-column", "value"),
    Input("yaxis-column", "value"),
    Input("xaxis-type", "value"),
    Input("yaxis-type", "value"),
    Input("year-slider-2", "value"),
) do xaxis_column_name, yaxis_column_name, xaxis_type, yaxis_type, year_value
    df2f = df2[df2.year .== year_value, :]
    x = df2f[df2f[!, Symbol("Indicator Name")] .== xaxis_column_name, :Value]
    y = df2f[df2f[!, Symbol("Indicator Name")] .== yaxis_column_name, :Value]
    return plot(
        x, y,
        Layout(
            xaxis=attr(type=xaxis_type, title_text=xaxis_column_name),
            yaxis=attr(type=yaxis_type, title_text=yaxis_column_name),
        ),
        text = df2f[
            df2f[!, Symbol("Indicator Name")] .== yaxis_column_name,
            Symbol("Country Name"),
        ],
        mode = "markers",
        marker=attr(size = 15, opacity=0.5, line=attr(width=0.5, color="white"))
    )
end

run_server(app, "0.0.0.0", debug = true)
