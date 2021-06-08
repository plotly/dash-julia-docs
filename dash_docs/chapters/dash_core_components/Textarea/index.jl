module chapters_dash_core_components_textarea

using Dash, DashHtmlComponents, DashCoreComponents

include("../../../utils.jl")

export examples

examples_path = joinpath(@__DIR__, "examples")

simple_textarea = LoadExampleCode(string(examples_path, "/simple_textarea.jl"))

examples = [simple_textarea]

app =  dash()

simple_textarea.callback!(app)


app.layout = html_div() do

    html_h1("Textarea Examples and Reference"),

    html_h3("Simple Textarea Example"),

    simple_textarea.source_code,
    simple_textarea.layout

end

end
