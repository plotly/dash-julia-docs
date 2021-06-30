module chapters_dash_core_components_store

using Dash, DashHtmlComponents, DashCoreComponents

include("../../../utils.jl")

export examples

examples_path = joinpath(@__DIR__, "examples")

store_clicks = LoadExampleCode(string(examples_path, "/store_clicks.jl"))

# store_callbacks = LoadExampleCode(string(examples_path, "/store_callbacks.jl"))


app =  dash()

store_clicks.callback!(app) 

examples = [store_clicks]

app.layout = html_div() do

    html_h1("dcc_store"),

    store_clicks.source_code,
    store_clicks.layout    

end

end