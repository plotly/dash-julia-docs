using Dash, DashHtmlComponents, DashCoreComponents, Dates

app = dash()

app.layout = html_div(style = Dict("height" => "450px")) do
    dcc_datepickerrange(
        calendar_orientation = "vertical",
        start_date_placeholder_text = "Start Period",
        end_date_placeholder_text = "End Period",
    )
end

run_server(app, "0.0.0.0", debug=true)