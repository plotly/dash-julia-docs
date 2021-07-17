using DataFrames, CSV, PlotlyBase, RDatasets
using Dash, DashHtmlComponents, DashCoreComponents

iris = dataset("datasets", "iris")
fig = Plot(iris, x=:SepalLength, y=:SepalWidth, mode="markers", marker_size=8, group=:Species)

app = dash()

app.layout = html_div() do
    html_h4("Iris Sepal Length vs Sepal Width"),
    dcc_graph(
        id = "example-graph-3",
        figure = fig,
    )
end

run_server(app, "0.0.0.0", debug=true)