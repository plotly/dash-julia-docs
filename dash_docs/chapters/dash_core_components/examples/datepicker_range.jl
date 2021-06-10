using Dash, DashHtmlComponents, DashCoreComponents, Dates

app = dash()

app.layout = html_div() do
    dcc_datepickerrange(
        start_date = Date(1997, 5, 10),
        end_date_placeholder_text="Select a date!"
    )
end

run_server(app, "0.0.0.0", debug=true)
