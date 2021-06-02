module chapters_dash_core_components_rangeslider

using Dash, DashHtmlComponents, DashCoreComponents, Chain, Pkg

include("../../../utils.jl")

export examples

examples_path = joinpath(@__DIR__, "examples")

rangeslider1 = LoadExampleCode(string(examples_path, "/simple_rangeslider.jl"))

rangeslider2 = LoadExampleCode(string(examples_path, "/rangeslider_marks_steps.jl"))

rangeslider3 = LoadExampleCode(string(examples_path, "/rangeslider_styling.jl"))
rangeslider4 = LoadExampleCode(string(examples_path, "/rangeslider_included_false.jl"))
rangeslider5 = LoadExampleCode(string(examples_path, "/multiple_handles.jl"))
rangeslider6 = LoadExampleCode(string(examples_path, "/pushable_handles.jl"))
rangeslider7 = LoadExampleCode(string(examples_path, "/crossing_handles.jl"))


examples = [rangeslider1]

app =  dash()

rangeslider1.callback!(app)

app.layout = html_div() do

    html_h1("RangeSlider Examples and Reference"),

    html_h3("Simple RangeSlider Example"),

    html_div("An example of a basic RangeSlider tied to a callback."),

    rangeslider1.source_code,
    rangeslider1.layout,

    html_h3("Marks and Steps"),

    dcc_markdown("If slider `marks` are defined and `step` is set to `nothing` then the slider will only be able to select values that have been predefined by the `marks`. Note that the default is `step=1`, so you must explicitly specify `nothing` to get this behavior"),

    rangeslider2.source_code,
    rangeslider2.layout,

    html_h3("Included Styling and Marks"),

    dcc_markdown("By default, `included=true`, meaning the rail trailing the handle will be highlighted. To have the handle act as a discrete value set `included=false`. To style `marks`, include a style css attribute alongside the key value."),

    rangeslider3.source_code,
    rangeslider3.layout,

    rangeslider4.source_code,
    rangeslider4.layout,

    html_h3("Multiple Handles"),

    dcc_markdown("To create multiple handles just define more values for `value`!"),

    rangeslider5.source_code,
    rangeslider5.layout,

    html_h3("Pushable Handles"),

    dcc_markdown("The `pushable` property is either a `boolean` or a numerical value. The numerical value determines the minimum distance between the handles. Try moving the handles around!"),

    rangeslider6.source_code,
    rangeslider6.layout,

    html_h3("Crossing Handles"),

    dcc_markdown("If `allowCross=false`, the handles will not be allowed to cross over each other"),

    rangeslider7.source_code,
    rangeslider7.layout


end

end
