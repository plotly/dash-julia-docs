using Dash, DashHtmlComponents, DashCoreComponents

app = dash()

app.layout = html_div() do
    dcc_tabs(
        [
            dcc_tab(
                label="Tab one", 
                children=[
                    dcc_graph(
                        figure = (
                            data = [
                                (x = ["giraffes", "orangutans", "monkeys"], y = [20, 14, 23], type = "bar", name = "SF"),
                                (x = ["giraffes", "orangutans", "monkeys"], y = [12, 18, 29], type = "bar", name = "Montreal"),
                            ],
                            layout = (title = "Dash Data Visualization", barmode="group")
                        )
                    )
                ]
            ),
            dcc_tab(
                label="Tab two", 
                children=[
                    dcc_graph(
                        figure = (
                            data = [
                                (x = ["giraffes", "orangutans", "monkeys"], y = [2, 14, 23], type = "bar", name = "SF"),
                                (x = ["giraffes", "orangutans", "monkeys"], y = [12, 18, 29], type = "bar", name = "Montreal"),
                            ],
                            layout = (title = "Dash Data Visualization", barmode="group")
                        )
                    )
                ]
            ),
            dcc_tab(
                label="Tab three", 
                children=[
                    dcc_graph(
                        figure = (
                            data = [
                                (x = ["giraffes", "orangutans", "monkeys"], y = [5, 14, 2], type = "bar", name = "SF"),
                                (x = ["giraffes", "orangutans", "monkeys"], y = [12, 18, 29], type = "bar", name = "Montreal"),
                            ],
                            layout = (title = "Dash Data Visualization", barmode="group")
                        )
                    )
                ]
            )
        ]
    )
end

run_server(app, "0.0.0.0", debug=true)