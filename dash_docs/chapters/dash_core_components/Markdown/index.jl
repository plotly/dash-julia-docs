module chapters_dash_core_components_markdown

using Dash, DashHtmlComponents, DashCoreComponents

include("../../../utils.jl")

export examples

examples_path = joinpath(@__DIR__, "examples")

headers = LoadExampleCode(string(examples_path, "/headers.jl"))

emphasis = LoadExampleCode(string(examples_path, "/emphasis.jl"))

block = LoadExampleCode(string(examples_path, "/block.jl"))

lists = LoadExampleCode(string(examples_path, "/lists.jl"))

links = LoadExampleCode(string(examples_path, "/links.jl"))

inline = LoadExampleCode(string(examples_path, "/inline.jl"))

examples = []

app =  dash()

# default.callback!(app)

# dynamic_options.callback!(app)

app.layout = html_div() do

    html_h1("Markdown Examples and Reference"),

    html_h3("Headers"),

    headers.source_code,
    headers.layout,

    html_h3("Emphasis"),

    emphasis.source_code,
    emphasis.layout,

    html_h3("Lists"),

    lists.source_code,
    lists.layout,

    html_h3("Block Quotes"),

    block.source_code,
    block.layout,

    html_h3("Links"),

    links.source_code,
    links.layout,

    html_h3("Inline Code"),

    inline.source_code,
    inline.layout

end

end