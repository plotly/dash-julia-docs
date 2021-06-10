module chapters_dash_core_components_datepickersingle

using Dash, DashHtmlComponents, DashCoreComponents

include("../../../utils.jl")

export examples

examples_path = joinpath(@__DIR__, "examples")

simple_datepicker = LoadExampleCode(string(examples_path, "/simple_datepicker.jl"))

examples = [simple_datepicker]

app =  dash()

app.layout = html_div() do

    html_h1("DatePickerSingle Examples and Reference"),

    dcc_markdown("""This is a simple example of a `DatePickerSingle` component tied to a callback. You can use either strings in the form `YYYY-MM-DD` or date objects from the `Dates` package to provide dates to Dash components. Strings are preferred because that's the form dates take as callback arguments.

    If you are using date objects, we recommend using `Date()` so there is no time part. DatePickerSingle will accept dates with a time part, but this can be confusing, particularly for the initial call of a callback. After the user chooses a new date there will be no time part, only the date.

    If you already have a `DateTime` object, you can easily convert it with `Date()`. The `min_date_allowed` and `max_date_allowed` properties define the minimum and maximum selectable dates on the calendar while `initial_visible_month` defines the calendar month that is first displayed when the `DatePickerSingle` component is opened."""),

    simple_datepicker.source_code,
    simple_datepicker.layout,

    html_h3("Month and Display Format"),

    dcc_markdown("""
    The `display_format` property determines how selected dates are displayed in the `DatePickerSingle` component. The `month_format` property determines how calendar headers are displayed when the calendar is opened.

    Both of these properties are configured through strings that utilize a combination of any of the following tokens."""),

    html_table([
        html_tr(
            [
                html_th("String Token", style = Dict("text-align" => "left", "width" => "20%")),
                html_th("Example", style = Dict("text-align" => "left", "width" => "20%")),
                html_th("Description", style = Dict("text-align" => "left", "width" => "20%"))
            ]
        ),
        html_tr(
            [
                html_td(dcc_markdown("`YYYY`")),
                html_td(dcc_markdown("`2014`")),
                html_td("4 or 2 digit year")
            ]
        ),
        html_tr(
            [
                html_td(dcc_markdown("`YY`")),
                html_td(dcc_markdown("`14`")),
                html_td("2 digit year")
            ]
        ),
        html_tr(
            [
                html_td(dcc_markdown("`Y`")),
                html_td(dcc_markdown("`-25`")),
                html_td("Year with any number of digits and sign")
            ]
        ),
        html_tr(
            [
                html_td(dcc_markdown("`Q`")),
                html_td(dcc_markdown("`1..4`")),
                html_td("Quarter of year. Sets month to first month in quarter.")
            ]
        ),
        html_tr(
            [
                html_td(dcc_markdown("`M MM`")),
                html_td(dcc_markdown("`1..12`")),
                html_td("Month number")
            ]
        ),
        html_tr(
            [
                html_td(dcc_markdown("`MMM MMM`")),
                html_td(dcc_markdown("`Jan..December`")),
                html_td("Month name")
            ]
        ),
        html_tr(
            [
                html_td(dcc_markdown("`D DD`")),
                html_td(dcc_markdown("`1..31`")),
                html_td("Day of month")
            ]
        ),
        html_tr(
            [
                html_td(dcc_markdown("`Do`")),
                html_td(dcc_markdown("`1st...31st`")),
                html_td("Day of month with ordinal")
            ]
        ),
        html_tr(
            [
                html_td(dcc_markdown("`DDD DDDD`")),
                html_td(dcc_markdown("`1..365`")),
                html_td("Day of year")
            ]
        ),
        html_tr(
            [
                html_td(dcc_markdown("`X`")),
                html_td(dcc_markdown("`1410715640.579`")),
                html_td("Unix timestamp")
            ]
        ),
        html_tr(
            [
                html_td(dcc_markdown("`x`")),
                html_td(dcc_markdown("`1410715640579`")),
                html_td("Unix ms timestamp")
            ]
        )]
    ),

    html_h3("Display Format Examples")

end

end
