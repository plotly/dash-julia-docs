using Dash, DashHtmlComponents, DashCoreComponents, PlotlyJS

app = dash()

function make_plot()
    plot(
        [
            bar(x=["giraffes", "orangutans", "monkeys"], y=rand(1:20, 3), name="SF"),
            bar(x=["giraffes", "orangutans", "monkeys"], y=rand(3:20, 3), name="Montreal")
        ],
        Layout(
            title="Dash Data Visualization",
            barmode="group",
        )
    )
end



app.layout = html_div() do
    dcc_tabs(
        [
            dcc_tab(
                label="Tab one",
                children=[dcc_graph(figure=make_plot())]
            ),
            dcc_tab(
                label="Tab two",
                children=[dcc_graph(figure=make_plot())]
            ),
            dcc_tab(
                label="Tab three",
                children=[dcc_graph(figure=make_plot())]
            )
        ]
    )
end

run_server(app, "0.0.0.0", debug=true)
