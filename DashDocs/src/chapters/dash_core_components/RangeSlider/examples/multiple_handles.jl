using Dash, DashHtmlComponents, DashCoreComponents

app = dash()

app.layout = html_div() do
    dcc_rangeslider(
        min=0,
        max=30,
        step=0.5,
        value=[1, 3, 4, 5, 12, 17]
    )
end


run_server(app, "0.0.0.0", debug=true)
