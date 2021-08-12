using DataFrames, CSV, PlotlyJS
using Dash, DashHtmlComponents, DashCoreComponents

iris = dataset(DataFrame, "iris")
fig = p1 = plot(
    iris, x=:sepal_length, y=:sepal_width, color=:species,
    mode="markers", marker_size=8
)

app = dash()

app.layout = html_div() do
    html_h4("Iris Sepal Length vs Sepal Width"),
    dcc_graph(
        id="example-graph-3",
        figure=fig,
    )
end

run_server(app, "0.0.0.0", debug=true)
