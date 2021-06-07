using Dash, DashHtmlComponents, DashCoreComponents

app = dash()

app.layout = html_div() do
    dcc_rangeslider(
        min=0,
        max=30,
        value=[10, 15],
        allowCross=false
    )
end


run_server(app, "0.0.0.0", debug=true)
