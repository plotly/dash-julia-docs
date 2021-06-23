module chapters_dash_core_components_input

using Dash, DashHtmlComponents, DashCoreComponents, Chain, Pkg

include("../../../utils.jl")

export examples

examples_path = joinpath(@__DIR__, "examples")

input_types = LoadExampleCode(string(examples_path, "/input_types.jl"))

debounce = LoadExampleCode(string(examples_path, "/debounce.jl"))

examples = [input_types, debounce]

app =  dash()

input_types.callback!(app)
debounce.callback!(app)

default = LoadExampleCode(string(examples_path, "/default.jl"))


examples = [default]

app =  dash()

default.callback!(app)

app.layout = html_div() do

    html_h1("Input Examples and Reference"),

    html_h3("Supported Input Types"),

    input_types.source_code,
    input_types.layout,

    html_h3("Debounce delays Input processing"),

    debounce.source_code,
    debounce.layout
    dcc_markdown("
    For production Dash apps, the Dash Core Components styling & layout should be managed with Dash Enterprise [Design Kit](https://plotly.com/dash/design-kit).
    "),

    html_h3("Default Input"),

    html_div("An example of a default input without any extra properties."),

    default.source_code,
    default.layout

end

end
