module chapters_dash_core_components

using Dash, DashHtmlComponents, DashCoreComponents, Chain, Pkg

function get_pkg_version(name::AbstractString)
    @chain Pkg.dependencies() begin
        values
        [x for x in _ if x.name == name]
        only
        _.version
    end
end

include("../../utils.jl")

export examples

examples_path = joinpath(@__DIR__, "examples")

dropdown_index_example = LoadExampleCode(string(examples_path, "/dropdown_index_example.jl"))

slider_index_example = LoadExampleCode(string(examples_path, "/slider_index_example.jl"))

slider_with_marks = LoadExampleCode(string(examples_path, "/slider_with_marks.jl"))

rangeslider_index_example = LoadExampleCode(string(examples_path, "/rangeslider_index_example.jl"))

rangeslider_with_marks = LoadExampleCode(string(examples_path, "/rangeslider_with_marks.jl"))

input_index_example = LoadExampleCode(string(examples_path, "/input_index_example.jl"))


examples = [dropdown_index_example]

app =  dash()
dropdown_index_example.callback!(app)

n = get_pkg_version("DashCoreComponents")

app.layout = html_div() do

    html_h1("Dash Core Components"),

    dcc_markdown("
    Dash ships with supercharged components for interactive user interfaces. A core set of components, written and maintained by the Dash team, is available in the `DashCoreComponents` library.

    For production Dash apps, the Dash Core Components styling & layout should be managed with Dash Enterprise [Design Kit](https://plotly.com/dash/design-kit).

    The source is on GitHub at [plotly/dash-core-components](https://github.com/plotly/dash-core-components).

    These docs are using version $n."),

    html_a(html_h3("Dropdown"), href="/dash_core_components/dropdown"),

    dropdown_index_example.source_code,
    dropdown_index_example.layout,

    html_a(html_h3("Slider"), href="/dash_core_components/slider"),

    slider_index_example.source_code,
    slider_index_example.layout,

    slider_with_marks.source_code,
    slider_with_marks.layout,

    html_a(html_h3("RangeSlider"), href="/dash_core_components/rangeslider"),

    rangeslider_index_example.source_code,
    rangeslider_index_example.layout,

    rangeslider_with_marks.source_code,
    rangeslider_with_marks.layout,

    #Input
    html_a(html_h3("Input"), href="/dash_core_components/input"),

    input_index_example.source_code,
    input_index_example.layout


end

end
