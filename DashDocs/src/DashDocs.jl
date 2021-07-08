module DashDocs
using DashCoreComponents, DashHtmlComponents, Dash, DataFrames, CSV
include("utils/_utils.jl")
test_fname = joinpath(@__DIR__, "chapters/basic_callbacks/examples/hello-slider.jl")
register_example("hello-slider", test_fname)

@eval_toplevel


const df1 = DataFrame(urldownload("https://raw.githubusercontent.com/plotly/datasets/master/gapminderDataFiveYear.csv"))

end # module
