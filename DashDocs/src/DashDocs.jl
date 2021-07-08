module DashDocs
using DashCoreComponents, DashHtmlComponents, Dash, DataFrames, CSV
include("utils/_utils.jl")
test_fname = joinpath(@__DIR__, "chapters/basic_callbacks/examples/hello-slider.jl")
register_example("hello-slider", test_fname)

@eval_toplevel

end # module
