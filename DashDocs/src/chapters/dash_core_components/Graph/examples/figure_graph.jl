using Dash, DashCoreComponents, PlotlyBase

app = dash()

app.layout = dcc_graph(
    id = "example-graph",
    figure = Plot([bar(; x = [1, 2, 3], y = [4, 1, 2], name = "SF"),
                   bar(; x = [1, 2, 3], y = [2, 4, 5], name = "Montréal")],
                  Layout(; title = "Dash Data Visualization")))

run_server(app, "0.0.0.0", debug=true)
