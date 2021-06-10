module chapters_dash_core_components_slider

using Dash, DashHtmlComponents, DashCoreComponents

include("../../../utils.jl")

export examples

examples_path = joinpath(@__DIR__, "examples")

slider1 = LoadExampleCode(string(examples_path, "/basic_slider.jl"))

slider2 = LoadExampleCode(string(examples_path, "/marks_steps.jl"))

slider3 = LoadExampleCode(string(examples_path, "/included_styling_marks.jl"))

slider4 = LoadExampleCode(string(examples_path, "/included_false.jl"))

slider5 = LoadExampleCode(string(examples_path, "/non_linear_slider.jl"))

slider6 = LoadExampleCode(string(examples_path, "/drag_value.jl"))

examples = [slider1, slider5, slider6]

app =  dash()
slider1.callback!(app)

app.layout = html_div() do

    html_h1("Slider Examples and Reference"),

    html_h3("Simple Slider Example"),

    dcc_markdown("An example of a basic slider tied to a callback."),

    slider1.source_code,
    slider1.layout,

    html_h3("Marks and Steps"),

    dcc_markdown("If slider `marks` are defined and `step` is set to `nothing` then the slider will only be able to select values that have been predefined by the `marks`. Note that the default is `step=1`, so you must explicitly specify `nothing` to get this behavior. `marks` is a `Dict` where the keys represent the numerical values and the values represent their labels."),

    slider2.source_code,
    slider2.layout,

    html_h3("Included and Styling Marks"),

    dcc_markdown("By default, `included=true`, meaning the rail trailing the handle will be highlighted. To have the handle act as a discrete value set `included=false`. To style `marks`, include a style css attribute alongside the key value."),

    slider3.source_code,
    slider3.layout,

    slider4.source_code,
    slider4.layout,

    html_h3("Non-Linear Slider and Updatemode"),

    dcc_markdown("Create a logarithmic slider by setting the labels of the `marks` property to be logarithmic and adjusting the slider's output `value` in the callbacks. The `updatemode` property allows us to determine when we want a callback to be triggered. The following example has `updatemode='drag'` which means a callback is triggered everytime the handle is moved. The default setting is `mouseup` which triggers the callback when you release your mouse from the slider."),

    slider5.source_code,
    slider5.layout,

    html_h3("Using drag_value"),

    dcc_markdown("Rather than changing the `updatemode` of the slider, you can also use `drag_value` as an input. This makes it possile to react differently to drag and mouseup."),

    slider6.source_code,
    slider6.layout

end

end
