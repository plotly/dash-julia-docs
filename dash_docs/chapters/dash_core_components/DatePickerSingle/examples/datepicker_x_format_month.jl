using Dash, DashHtmlComponents, DashCoreComponents, Dates

app = dash()

app.layout = html_div(style = Dict("height" => "350px")) do
    dcc_datepickersingle(
        date = Date(2017, 6, 21),
        month_format = "x",
        placeholder = "x"
    )
end

run_server(app, "0.0.0.0", debug=true)
