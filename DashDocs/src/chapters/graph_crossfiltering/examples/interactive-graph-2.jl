using CSV, DataFrames, HTTP, PlotlyJS
using Dash, DashHtmlComponents, DashCoreComponents

load_csv(url) = DataFrame(CSV.File(HTTP.get(url).body))

df6 = load_csv("https://raw.githubusercontent.com/plotly/datasets/master/country_indicators.csv")

rename!(df6, Dict(:"Year" => "year"))

dropmissing!(df6)

available_indicators = unique(df6[:, "Indicator Name"])
years = unique(df6[:, "year"])

app = dash()

app.layout = html_div() do
    html_div(
        children = [
            html_div(
                children = [
                    dcc_dropdown(
                        id = "crossfilter-xaxis-column",
                        options = [
                            (label = i, value = i)
                            for i in available_indicators
                        ],
                        value = "Fertility rate, total (births per woman)",
                    ),
                    dcc_radioitems(
                        id = "crossfilter-xaxis-type",
                        options = [
                            (label = i, value = i) for i in ["linear", "log"]
                        ],
                        value = "linear",
                    ),
                ],
                style = (width = "49%", display = "inline-block"),
            ),
            html_div(
                children = [
                    dcc_dropdown(
                        id = "crossfilter-yaxis-column",
                        options = [
                            (label = i, value = i)
                            for i in available_indicators
                        ],
                        value = "Life expectancy at birth, total (years)",
                    ),
                    dcc_radioitems(
                        id = "crossfilter-yaxis-type",
                        options = [
                            (label = i, value = i) for i in ["linear", "log"]
                        ],
                        value = "linear",
                    ),
                ],
                style = (
                    width = "49%",
                    float = "right",
                    display = "inline-block",
                ),
            ),
        ],
        style = (
            borderBottom = "thin lightgrey solid",
            backgroundColor = "rgb(250, 250, 250)",
            padding = "10px 5px",
        ),
    ),
    html_div(
        children = [
            dcc_graph(id = "crossfilter-indicator-scatter"),
            dcc_slider(
                id = "crossfilter-year-slider",
                min = minimum(years),
                max = maximum(years),
                marks = Dict([Symbol(v) => Symbol(v) for v in years]),
                value = minimum(years),
                step = nothing,
            ),
        ],
        style = (
            width = "49%",
            display = "inline-block"
        ),
    ),
    html_div(
        children = [
            dcc_graph(id = "x-time-series"),
            dcc_graph(id = "y-time-series"),
        ],
        style = (width = "49%", display = "inline-block"),
    )
end

callback!(
    app,
    Output("crossfilter-indicator-scatter", "figure"),
    Input("crossfilter-xaxis-column", "value"),
    Input("crossfilter-yaxis-column", "value"),
    Input("crossfilter-xaxis-type", "value"),
    Input("crossfilter-yaxis-type", "value"),
    Input("crossfilter-year-slider", "value"),
) do xaxis_column_name, yaxis_column_name, xaxis_type, yaxis_type, year_slider_value

    df6f = df6[df6.year .== year_slider_value, :]
    x = df6f[df6f[!, Symbol("Indicator Name")] .== xaxis_column_name, :Value]
    y = df6f[df6f[!, Symbol("Indicator Name")] .== yaxis_column_name, :Value]
    return plot(
        x, y,
        Layout(
            xaxis=attr(type=xaxis_type, title_text=xaxis_column_name),
            yaxis=attr(type=yaxis_type, title_text=yaxis_column_name),
            height=450,
        ),
        kind = "scatter",
        text = df6f[
            df6f[!, Symbol("Indicator Name")] .== yaxis_column_name,
            Symbol("Country Name"),
        ],
        customdata = df6f[
            df6f[!, Symbol("Indicator Name")] .== yaxis_column_name,
            Symbol("Country Name"),
        ],
        mode = "markers",
        marker=attr(size = 15, opacity=0.5, line=attr(width=0.5, color="white"))
    )
end

function create_time_series(df6f, axis_type, title)
    plot(
        df6f, x=:year, y=:Value,
        Layout(
            yaxis_type=axis_type,
            xaxis_showgrid = false,
            annotations = [attr(
                x = 0, y = 0.85,
                xanchor = "left", yanchor = "bottom",
                xref = "paper", yref = "paper",
                showarrow = false,
                align = "left",
                text = title,
                bgcolor = "rgba(255, 255, 255, 0.5)",
            )],
            height = 225,
        ),
        mode = "lines+markers",
    )
end

callback!(
    app,
    Output("x-time-series", "figure"),
    Input("crossfilter-indicator-scatter", "hoverData"),
    Input("crossfilter-xaxis-column", "value"),
    Input("crossfilter-xaxis-type", "value"),
) do hover_data, xaxis_column_name, axis_type
    country_name = isnothing(hover_data) ? "" : hover_data.points[1].customdata
    df6f = df6[df6[:, Symbol("Country Name")].==country_name, :]
    df6f = df6f[df6f[:, Symbol("Indicator Name")].==xaxis_column_name, :]
    title = "<b>$(country_name)</b><br>$(xaxis_column_name)"
    return create_time_series(df6f, axis_type, title)

end

callback!(
    app,
    Output("y-time-series", "figure"),
    Input("crossfilter-indicator-scatter", "hoverData"),
    Input("crossfilter-yaxis-column", "value"),
    Input("crossfilter-yaxis-type", "value"),
) do hover_data, yaxis_column_name, axis_type
    country_name = isnothing(hover_data) ? "" : hover_data.points[1].customdata
    df6f = df6[df6[:, Symbol("Country Name")].==country_name, :]
    df6f = df6f[df6f[:, Symbol("Indicator Name")].==yaxis_column_name, :]
    return create_time_series(df6f, axis_type, yaxis_column_name)
end

run_server(app, "0.0.0.0", debug = true)
