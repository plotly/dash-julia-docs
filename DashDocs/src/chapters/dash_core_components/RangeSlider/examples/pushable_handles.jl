using Dash, DashHtmlComponents, DashCoreComponents

app = dash()

app.layout = html_div() do
    dcc_rangeslider(
        min=0,
        max=30,
        value=[8, 10, 15, 17, 20],
        pushable=2
    )
end


run_server(app, "0.0.0.0", debug=true)
