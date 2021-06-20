module chapters_dash_core_components_input

using Dash, DashHtmlComponents, DashCoreComponents, Chain, Pkg

include("../../../utils.jl")

export examples

examples_path = joinpath(@__DIR__, "examples")

default = LoadExampleCode(string(examples_path, "/default.jl"))


examples = [default]

app =  dash()

default.callback!(app)

app.layout = html_div() do

    html_h1("Input Examples and Reference"),

    dcc_markdown("
    For production Dash apps, the Dash Core Components styling & layout should be managed with Dash Enterprise [Design Kit](https://plotly.com/dash/design-kit).
    "),

    html_h3("Default Input"),

    html_div("An example of a default input without any extra properties."),

    default.source_code,
    default.layout

end

end
