using Dash, DashHtmlComponents, DashCoreComponents, Dates

app = dash()

app.layout = html_div(style = Dict("height" => "350px")) do
    dcc_datepickerrange(
        end_date = Date(2017, 6, 21),
        month_format = "M-D-Y-Q",
        start_date_placeholder_text = "M-D-Y-Q"
    )
end

run_server(app, "0.0.0.0", debug=true)
