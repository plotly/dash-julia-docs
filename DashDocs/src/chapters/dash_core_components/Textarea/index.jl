module chapters_dash_core_components_textarea

using Dash, DashHtmlComponents, DashCoreComponents

include("../../../utils.jl")

export examples

examples_path = joinpath(@__DIR__, "examples")

simple_textarea = LoadExampleCode(string(examples_path, "/simple_textarea.jl"))

button_press = LoadExampleCode(string(examples_path, "/button_press.jl"))

examples = [simple_textarea, button_press]

app =  dash()

simple_textarea.callback!(app)
button_press.callback!(app)


app.layout = html_div() do

    html_h1("Textarea Examples and Reference"),

    html_h3("Simple Textarea Example"),

    simple_textarea.source_code,
    simple_textarea.layout,

    html_h3("Update `dcc_textarea` callback on button press"),

    button_press.source_code,
    button_press.layout

end

end