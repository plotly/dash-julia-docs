using Dash, DashHtmlComponents, DashCoreComponents, Dates

app = dash()

app.layout = html_div() do
    dcc_datepickersingle(
        date = Date(1997, 5, 10)
    )
end

run_server(app, "0.0.0.0", debug=true)
