module chapters_dash_core_components_slider

using Dash, DashHtmlComponents, DashCoreComponents

include("../../../utils.jl")

export examples

examples_path = joinpath(@__DIR__, "examples")

slider1 = LoadExampleCode(string(examples_path, "/basic_slider.jl"))

slider2 = LoadExampleCode(string(examples_path, "/marks_steps.jl"))

slider3 = LoadExampleCode(string(examples_path, "/included_styling_marks.jl"))

slider4 = LoadExampleCode(string(examples_path, "/included_false.jl"))


examples = [slider1]

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
    slider4.layout

end

end
