using Dash, DashHtmlComponents, DashCoreComponents, Dates

app = dash()

app.layout = html_div(style = Dict("height" => "450px")) do
    dcc_datepickersingle(
        calendar_orientation = "vertical",
        placeholder = "Select a date",
        date = Date(2017, 6, 21),
    )
end

run_server(app, "0.0.0.0", debug=true)
