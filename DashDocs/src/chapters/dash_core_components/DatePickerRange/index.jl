module chapters_dash_core_components_datepickerrange

using Dash, DashHtmlComponents, DashCoreComponents

include("../../../utils.jl")

export examples

examples_path = joinpath(@__DIR__, "examples")

simple_datepickerrange = LoadExampleCode(string(examples_path, "/simple_datepickerrange.jl"))

datepickerrange_MMM_format = LoadExampleCode(string(examples_path, "/datepickerrange_MMM_format.jl"))

datepickerrange_MDYQ_format = LoadExampleCode(string(examples_path, "/datepickerrange_MDYQ_format.jl"))

datepickerrange_MMMMYDD_format = LoadExampleCode(string(examples_path, "/datepickerrange_MMMMYDD_format.jl"))

datepickerrange_x_format = LoadExampleCode(string(examples_path, "/datepickerrange_x_format.jl"))

datepickerrange_MMM_format_month = LoadExampleCode(string(examples_path, "/datepickerrange_MMM_format_month.jl"))

datepickerrange_MDYQ_format_month = LoadExampleCode(string(examples_path, "/datepickerrange_MDYQ_format_month.jl"))

datepickerrange_MMMMYDD_format_month = LoadExampleCode(string(examples_path, "/datepickerrange_MMMMYDD_format_month.jl"))

datepickerrange_x_format_month = LoadExampleCode(string(examples_path, "/datepickerrange_x_format_month.jl"))

datepickerrange_vertical = LoadExampleCode(string(examples_path, "/datepickerrange_vertical.jl"))

datepickerrange_clearable = LoadExampleCode(string(examples_path, "/datepickerrange_clearable.jl"))

datepickerrange_rtl = LoadExampleCode(string(examples_path, "/datepickerrange_rtl.jl"))

examples = [simple_datepickerrange]

app =  dash()

app.layout = html_div() do

    html_h1("DatePickerRange Examples and Reference"),

    html_h3("Simple DatePickerRange Example"),

    dcc_markdown("""This is a simple example of a `DatePickerRange` component tied to a callback. You can use either strings in the form `YYYY-MM-DD` or date objects from the `Dates` package to provide dates to Dash components. Strings are preferred because that's the form dates take as callback arguments.
    If you are using date objects, we recommend using `Date()` so there is no time part. DatePickerRange will accept dates with a time part, but this can be confusing, particularly for the initial call of a callback. After the user chooses a new date there will be no time part, only the date.
    If you already have a `DateTime` object, you can easily convert it with `Date()`. The `min_date_allowed` and `max_date_allowed` properties define the minimum and maximum selectable dates on the calendar while `initial_visible_month` defines the calendar month that is first displayed when the `DatePickerRange` component is opened."""),

    simple_datepickerrange.source_code,
    simple_datepickerrange.layout,

    html_h3("Month and Display Format"),

    dcc_markdown("""
    The `display_format` property determines how selected dates are displayed in the `DatePickerRange` component. The `month_format` property determines how calendar headers are displayed when the calendar is opened.
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

    html_h3("Display Format Examples"),

    dcc_markdown("You can utilize any permutation of the string tokens shown in the table above to change how selected dates are displayed in the DatePickerRange component."),

    datepickerrange_MMM_format.source_code,
    datepickerrange_MMM_format.layout,

    datepickerrange_MDYQ_format.source_code,
    datepickerrange_MDYQ_format.layout, 

    datepickerrange_MMMMYDD_format.source_code,
    datepickerrange_MMMMYDD_format.layout,

    datepickerrange_x_format.source_code,
    datepickerrange_x_format.layout,

    html_h3("Month Format Examples"),

    datepickerrange_MMM_format_month.source_code,
    datepickerrange_MMM_format_month.layout,

    datepickerrange_MDYQ_format_month.source_code,
    datepickerrange_MDYQ_format_month.layout,

    datepickerrange_MMMMYDD_format_month.source_code,
    datepickerrange_MMMMYDD_format_month.layout,

    datepickerrange_x_format_month.source_code,
    datepickerrange_x_format_month.layout,

    html_h3("Vertical Calendar and Placeholder Text"),

    dcc_markdown("""The `DatePickerRange` component can be rendered in two orientations, either horizontally or vertically. 
    If calendar_orientation is set to `vertical`, it will be rendered vertically and will default to `horizontal` if not defined.
    The `start_date_placeholder_text` and `end_date_placeholder_text` define the grey default text defined in the calendar input boxes when no date is selected."""),

    datepickerrange_vertical.source_code,
    datepickerrange_vertical.layout,

    html_h3("Minimum Nights, Calendar Clear, and Portals"),

    dcc_markdown("""The `minimum_nights` property defines the number of nights 
    that must be in between the range of two selected dates.
    When the `clearable` property is set to `true` the component will be rendered with a 
    small 'x' that will remove all selected dates when selected.
    
    The `DatePickerRange` component supports two different portal types, one being a full screen 
    portal (`with_full_screen_portal`) and another being a simple screen overlay, like the 
    one shown below (`with_portal`).
    
    
    """),

    datepickerrange_clearable.source_code,
    datepickerrange_clearable.layout,

    html_h3("Right to Left Calendars and First Day of Week"),

    dcc_markdown("""
    When the `is_RTL` property is set to `true` the calendar will be rendered from right to left.
    The `first_day_of_week` property allows you to define which day of the week will be set as 
    the first day of the week. In the example below, Tuesday is the first day of the week."""),

    datepickerrange_rtl.source_code,
    datepickerrange_rtl.layout

end

end