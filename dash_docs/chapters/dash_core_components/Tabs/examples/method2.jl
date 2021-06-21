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
                            ]
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
                                (x = ["giraffes", "orangutans", "monkeys"], y = [2, 1, 2], type = "bar", name = "SF"),
                                (x = ["giraffes", "orangutans", "monkeys"], y = [1, 8, 9], type = "bar", name = "Montreal"),
                            ]
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
                                (x = ["giraffes", "orangutans", "monkeys"], y = [0, 4, 3], type = "bar", name = "SF"),
                                (x = ["giraffes", "orangutans", "monkeys"], y = [2, 1, 2], type = "bar", name = "Montreal"),
                            ]
                        )
                    )
                ]
            )
        ]
    )
end

run_server(app, "0.0.0.0", debug=true)
