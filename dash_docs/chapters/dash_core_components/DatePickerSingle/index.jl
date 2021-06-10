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
    simple_datepicker.layout

end

end
