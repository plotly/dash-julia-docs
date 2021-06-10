using Dash, DashHtmlComponents, DashCoreComponents

app = dash()

app.layout = html_div() do
    dcc_rangeslider(
        count=1,
        min=-5,
        max=6,
        step=0.5,
        value=[-3, 4],
        marks=Dict([i => ("Label $(i)") for i = -5:7]),
    )
end

run_server(app, "0.0.0.0", debug=true)
