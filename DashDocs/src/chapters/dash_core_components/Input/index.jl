module chapters_dash_core_components_input

using Dash, DashHtmlComponents, DashCoreComponents

include("../../../utils.jl")

export examples

examples_path = joinpath(@__DIR__, "examples")

input_types = LoadExampleCode(string(examples_path, "/input_types.jl"))

debounce = LoadExampleCode(string(examples_path, "/debounce.jl"))

examples = [input_types, debounce]

app =  dash()

input_types.callback!(app)
debounce.callback!(app)


app.layout = html_div() do

    html_h1("Input Examples and Reference"),

    html_h3("Supported Input Types"),

    input_types.source_code,
    input_types.layout,

    html_h3("Debounce delays Input processing"),

    debounce.source_code,
    debounce.layout

end

end