using Dash, DashHtmlComponents, DashCoreComponents, Dates

app = dash()

app.layout = html_div(style = Dict("height" => "350px")) do
    dcc_datepickersingle(
        is_RTL = true,
        first_day_of_week = 3,
        date = Date(2017, 6, 21)
    )
end

run_server(app, "0.0.0.0", debug=true)
