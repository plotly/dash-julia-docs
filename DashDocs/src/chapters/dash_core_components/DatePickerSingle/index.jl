@doc_chapter "/dash-core-components/datepickersingle" begin

    @example simple_datepicker "simple_datepicker.jl"
    @example datepicker_MMM_format "datepicker_MMM_format.jl"
    @example datepicker_MDYQ_format "datepicker_MDYQ_format.jl"
    @example datepicker_MMMMYDD_format "datepicker_MMMMYDD_format.jl"
    @example datepicker_x_format "datepicker_x_format.jl"
    @example datepicker_MMM_format_month "datepicker_MMM_format_month.jl"
    @example datepicker_MDYQ_format_month "datepicker_MDYQ_format_month.jl"
    @example datepicker_MMMMYDD_format_month "datepicker_MMMMYDD_format_month.jl"
    @example datepicker_x_format_month "datepicker_x_format_month.jl"
    @example datepicker_vertical "datepicker_vertical.jl"
    @example datepicker_clearable "datepicker_clearable.jl"
    @example datepicker_rtl "datepicker_rtl.jl"
    
    
    
    
    @layout html_div() do

    html_h1("DatePickerSingle Examples and Reference"),

    html_h3("Simple DatePickerSingle Example"),

    dcc_markdown("""This is a simple example of a `DatePickerSingle` component tied to a callback. You can use either strings in the form `YYYY-MM-DD` or date objects from the `Dates` package to provide dates to Dash components. Strings are preferred because that's the form dates take as callback arguments.
    If you are using date objects, we recommend using `Date()` so there is no time part. DatePickerSingle will accept dates with a time part, but this can be confusing, particularly for the initial call of a callback. After the user chooses a new date there will be no time part, only the date.
    If you already have a `DateTime` object, you can easily convert it with `Date()`. The `min_date_allowed` and `max_date_allowed` properties define the minimum and maximum selectable dates on the calendar while `initial_visible_month` defines the calendar month that is first displayed when the `DatePickerSingle` component is opened."""),

    source"simple_datepicker",
    layout"simple_datepicker",

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

    html_h3("Display Format Examples"),

    dcc_markdown("You can utilize any permutation of the string tokens shown in the table above to change how selected dates are displayed in the `DatePickerSingle` component."),

    source"datepicker_MMM_format",
    layout"datepicker_MMM_format",

    source"datepicker_MDYQ_format",
    layout"datepicker_MDYQ_format",

    source"datepicker_MMMMYDD_format",
    layout"datepicker_MMMMYDD_format",

    source"datepicker_x_format",
    layout"datepicker_x_format",

    html_h3("Month Format Examples"),

    source"datepicker_MMM_format_month",
    layout"datepicker_MMM_format_month",

    source"datepicker_MDYQ_format_month",
    layout"datepicker_MDYQ_format_month",

    source"datepicker_MMMMYDD_format_month",
    layout"datepicker_MMMMYDD_format_month",

    source"datepicker_x_format_month",
    layout"datepicker_x_format_month",

    html_h3("Vertical Calendar and Placeholder Text"),

    dcc_markdown("""
    The `DatePickerSingle` component can be rendered in two orientations, either horizontally or vertically. If `calendar_orientation` is set to `'vertical'`, it will be rendered vertically and will default to `'horizontal'` if not defined.
    The `placeholder` defines the grey default text defined in the calendar input boxes when no date is selected."""),

    source"datepicker_vertical",
    layout"datepicker_vertical",

    html_h3("Calendar Clear and Portals"),

    dcc_markdown("""
    When the `clearable` property is set to `true` the component will be rendered with a small 'x' that will remove all selected dates when selected.
    The `DatePickerSingle` component supports two different portal types, one being a full screen portal (`with_full_screen_portal`) and another being a simple screen overlay, like the one shown below (`with_portal`)."""),

    source"datepicker_clearable",
    layout"datepicker_clearable",

    html_h3("Right To Left Calendars and First Day of Week"),

    dcc_markdown("""
    When the `is_RTL` property is set to `true` the calendar will be rendered from right to left.
    The `first_day_of_week` property allows you to define which day of the week will be set as the first day of the week. In the example below, Tuesday is the first day of the week.."""),

    source"datepicker_rtl",
    layout"datepicker_rtl",
    
    html_h3("dcc_datepickersingle Reference"),
    dcc_markdown("""
        ```julia
            Access this documentation in your Julia REPL with:

            ?help dcc_datepickersingle

            Our recommended IDE for writing Dash apps is Dash Enterprise's Data Science Workspaces, which has typeahead support for Dash Component Properties. Find out if your company is using Dash Enterprise.
        ```
    """),
    dcc_markdown(string(@doc dcc_datepickersingle)) 


end

end