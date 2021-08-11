@doc_chapter "/dash-core-components/slider" begin

    @example slider1 "basic_slider.jl"
    @example slider2 "marks_steps.jl"
    @example slider3 "included_styling_marks.jl"
    @example slider4 "included_false.jl"
    @example slider5 "non_linear_slider.jl"
    @example slider6 "drag_value.jl"
  
    @layout html_div() do

    html_h1("Slider Examples and Reference"),

    html_h3("Simple Slider Example"),

    dcc_markdown("An example of a basic slider tied to a callback."),

    source"slider1",
    layout"slider1",

    html_h3("Marks and Steps"),

    dcc_markdown("If slider `marks` are defined and `step` is set to `nothing` then the slider will only be able to select values that have been predefined by the `marks`. Note that the default is `step=1`, so you must explicitly specify `nothing` to get this behavior. `marks` is a `Dict` where the keys represent the numerical values and the values represent their labels."),

    source"slider2",
    layout"slider2",

    html_h3("Included and Styling Marks"),

    dcc_markdown("By default, `included=true`, meaning the rail trailing the handle will be highlighted. To have the handle act as a discrete value set `included=false`. To style `marks`, include a style css attribute alongside the key value."),

    source"slider3",
    layout"slider3",

    source"slider4",
    layout"slider4",

    html_h3("Non-Linear Slider and Updatemode"),

    dcc_markdown("Create a logarithmic slider by setting the labels of the `marks` property to be logarithmic and adjusting the slider's output `value` in the callbacks. The `updatemode` property allows us to determine when we want a callback to be triggered. The following example has `updatemode='drag'` which means a callback is triggered everytime the handle is moved. The default setting is `mouseup` which triggers the callback when you release your mouse from the slider."),

    source"slider5",
    layout"slider5",

    html_h3("Using drag_value"),

    dcc_markdown("Rather than changing the `updatemode` of the slider, you can also use `drag_value` as an input. This makes it possile to react differently to drag and mouseup."),

    source"slider6",
    layout"slider6",

    html_h3("dcc_slider Reference"),
    dcc_markdown("""
        ```julia
            Access this documentation in your Julia REPL with:

            ?help dcc_slider

            Our recommended IDE for writing Dash apps is Dash Enterprise's Data Science Workspaces, which has typeahead support for Dash Component Properties. Find out if your company is using Dash Enterprise.
        ```
    """),
    dcc_markdown(string(@doc dcc_slider))

end

end
