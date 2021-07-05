using Dash, DashHtmlComponents, DashCoreComponents, Dates

app = dash()

app.layout = html_div() do
    dcc_datepickersingle(
        clearable = true,
        with_portal= true,
        date = Date(2017, 6, 21)
    )
end

run_server(app, "0.0.0.0", debug=true)