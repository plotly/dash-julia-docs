@doc_chapter "/dash-core-components/rangeslider" begin

    @example rangeslider1 "simple_rangeslider.jl"
    @example rangeslider2 "rangeslider_marks_steps.jl"
    @example rangeslider3 "rangeslider_styling.jl"
    @example rangeslider4 "rangeslider_included_false.jl"
    @example rangeslider5 "multiple_handles.jl"
    @example rangeslider6 "pushable_handles.jl"
    @example rangeslider7 "crossing_handles.jl"
    @example rangeslider8 "non_linear_range.jl"
  
    @layout html_div() do

    html_h1("RangeSlider Examples and Reference"),

    html_h3("Simple RangeSlider Example"),

    html_div("An example of a basic RangeSlider tied to a callback."),

    source"rangeslider1",
    layout"rangeslider1",

    html_h3("Marks and Steps"),

    dcc_markdown("If slider `marks` are defined and `step` is set to `nothing` then the slider will only be able to select values that have been predefined by the `marks`. Note that the default is `step=1`, so you must explicitly specify `nothing` to get this behavior"),

    source"rangeslider2",
    layout"rangeslider2",

    html_h3("Included Styling and Marks"),

    dcc_markdown("By default, `included=true`, meaning the rail trailing the handle will be highlighted. To have the handle act as a discrete value set `included=false`. To style `marks`, include a style css attribute alongside the key value."),

    source"rangeslider3",
    layout"rangeslider3",

    source"rangeslider4",
    layout"rangeslider4",

    html_h3("Multiple Handles"),

    dcc_markdown("To create multiple handles just define more values for `value`!"),

    source"rangeslider5",
    layout"rangeslider5",

    html_h3("Pushable Handles"),

    dcc_markdown("The `pushable` property is either a `boolean` or a numerical value. The numerical value determines the minimum distance between the handles. Try moving the handles around!"),

    source"rangeslider6",
    layout"rangeslider6",

    html_h3("Crossing Handles"),

    dcc_markdown("If `allowCross=false`, the handles will not be allowed to cross over each other"),

    source"rangeslider7",
    layout"rangeslider7",

    html_h3("Non-Linear Slider and Updatemode"),

    dcc_markdown("Create a logarithmic slider by setting `marks` to be logarithmic and adjusting the slider's output `value` in the callbacks. The `updatemode` property allows us to determine when we want a callback to be triggered. The following example has `updatemode='drag'` which means a callback is triggered everytime the handle is moved. Contrast the callback output with the first example on this page to see the difference."),

    source"rangeslider8",
    layout"rangeslider8",

    html_h3("dcc_rangeslider Reference"),
    dcc_markdown("""
        ```julia
            Access this documentation in your Julia REPL with:

            ?help dcc_rangeslider

            Our recommended IDE for writing Dash apps is Dash Enterprise's Data Science Workspaces, which has typeahead support for Dash Component Properties. Find out if your company is using Dash Enterprise.
        ```
    """),
    dcc_markdown(string(@doc dcc_rangeslider))


end

end
