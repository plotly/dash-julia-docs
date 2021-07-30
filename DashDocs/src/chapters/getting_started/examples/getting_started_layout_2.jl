using Dash, DashHtmlComponents, DashCoreComponents
using PlotlyBase

fig = Plot(
    [
        bar(x=["giraffes", "orangutans", "monkeys"], y=[20, 14, 23], name="SF"),
        bar(x=["giraffes", "orangutans", "monkeys"], y=[12, 18, 29], name="Montreal")
    ],
    Layout(
        title="Dash Data Visualization",
        barmode="group",
        template=templates["plotly_dark"]
    )
)

app = dash()

app.layout = html_div(style=Dict("backgroundColor" => "#111111")) do
    html_h1(
        "Hello Dash",
        style=Dict("color" => "#7FDBFF", "textAlign" => "center"),
    ),
    html_div(
        "Dash: A web application framework for Julia",
        style=Dict("color" => "#7FDBFF"),
    ),
    dcc_graph(
        id="example-graph-2",
        figure=fig
    )
end

run_server(app, "0.0.0.0", debug=true)
