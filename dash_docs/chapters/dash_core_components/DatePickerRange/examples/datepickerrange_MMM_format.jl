using Dash, DashHtmlComponents, DashCoreComponents, Dates

app = dash()

app.layout = html_div(style = Dict("height" => "350px")) do
    dcc_datepickerrange(
        end_date = Date(2017, 6, 21),
        display_format = "MMM Do, YY"
    )
end

run_server(app, "0.0.0.0", debug=true)
