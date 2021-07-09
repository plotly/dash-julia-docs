using Base: start_base_include
using Dash, DashHtmlComponents, DashCoreComponents, Dates

app = dash()

app.layout = html_div(style = Dict("height" => "350px")) do
    dcc_datepickerrange(
        id="date-picker-range-example",
        min_date_allowed = Date(1995, 8, 5),
        max_date_allowed = Date(2017, 9, 10),
        initial_visible_month= Date(2017, 8, 5),
        end_date = Date(2017, 8, 25)
    ),
    html_div(id="output-container-date-picker-range")
end

callback!(
    app,
    Output("output-container-date-picker-range", "children"),
    Input("date-picker-range-example", "start_date"),
    Input("date-picker-range-example", "end_date"),
) do start_date, end_date
    string_prefix = "You  have selected: "
    if !isnothing(start_date)
        start_date_string = Dates.format(Date(start_date), "U d, yyyy")
        string_prefix = string_prefix * start_date_string * " | "
    end

    if !isnothing(end_date)
        end_date_string = Dates.format(Date(end_date), "U d, yyyy")
        string_prefix = string_prefix * "End Date: " * end_date_string
    end

    if length(string_prefix) == length("You have selected: ")
        return "Select a date to see it displayed here"
    else
        return string_prefix
    end

end

run_server(app, "0.0.0.0", debug=true)