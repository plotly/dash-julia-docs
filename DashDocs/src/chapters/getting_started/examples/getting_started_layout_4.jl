using DataFrames, CSV, RDatasets
using Dash, DashHtmlComponents, DashCoreComponents
using PlotlyJS:plot

iris = dataset("datasets", "iris")

p1 = plot(
    iris, x=:SepalLength, y=:SepalWidth, color=:Species,
    mode="markers", marker_size=8
)

app = dash()

app.layout = html_div() do
    html_h4("Iris Sepal Length vs Sepal Width"),
    dcc_graph(
        id="example-graph-3",
        figure=p1,
    )
end

run_server(app, "0.0.0.0", debug=true)
