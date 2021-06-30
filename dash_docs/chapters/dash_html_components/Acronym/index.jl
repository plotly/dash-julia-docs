
module chapters_dash_html_components_acronym

using Dash, DashHtmlComponents

include("../../../utils.jl")

export examples

examples_path = joinpath(@__DIR__, "examples")

docs = LoadExampleCode(string(examples_path, "/docs.jl"))



examples = []

app =  dash()

app.layout = html_div() do

    html_h1("Examples and References"),

    docs.layout    

end

end


