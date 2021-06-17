using Dash, DashHtmlComponents, DashCoreComponents, Dates

app = dash()

app.layout = html_div(style = Dict("height" => "350px")) do
    dcc_datepickerrange(
        end_date = Date(2017, 6, 21),
        month_format = "x",
        start_date_placeholder_text = "x"
    )
end

run_server(app, "0.0.0.0", debug=true)
