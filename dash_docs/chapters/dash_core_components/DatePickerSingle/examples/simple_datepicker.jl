using Dash, DashHtmlComponents, DashCoreComponents, Dates

app = dash()

app.layout = html_div(style = Dict("height" => "350px")) do
    dcc_datepickersingle(
        id="date-picker-single-example",
        min_date_allowed = Date(1995, 8, 5),
        max_date_allowed = Date(2017, 9, 10),
        initial_visible_month= Date(2017, 8, 5),
        date = Date(2017, 8, 25)
    ),
    html_div(id="output-container-date-picker-single")
end

callback!(
    app,
    Output("output-container-date-picker-single", "children"),
    Input("date-picker-single-example", "date"),
) do date_value
    return "You have selected: $(Dates.format(Date(date_value), "U d, yyyy"))"
end

run_server(app, "0.0.0.0", debug=true)
