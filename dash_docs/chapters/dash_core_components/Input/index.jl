module chapters_dash_core_components_input

using Dash, DashHtmlComponents, DashCoreComponents

include("../../../utils.jl")

export examples

examples_path = joinpath(@__DIR__, "examples")

input_types = LoadExampleCode(string(examples_path, "/input_types.jl"))

examples = [input_types]

app =  dash()

input_types.callback!(app)

app.layout = html_div() do

    html_h1("Input Examples and Reference"),

    html_h3("Supported Input Types"),

    input_types.source_code,
    input_types.layout

end

end
