module chapters_dash_daq

using Dash, DashHtmlComponents, DashCoreComponents, DashDaq, Chain, Pkg

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

booleanswitch_index_example = LoadExampleCode(string(examples_path, "/booleanswitch_index_example.jl"))

examples = [
    booleanswitch_index_example
]

app =  dash()

n = get_pkg_version("DashDaq")

app.layout = html_div() do

    html_h1("Dash DAQ"),

    dcc_markdown("
    Dash is a web application framework that provides pure Julia abstraction around HTML, CSS, and JavaScript.

    Dash DAQ comprises a robust set of controls that make it simpler to integrate data acquisition and controls into your Dash applications.

    The source is on GitHub at [plotly/dash-daq](https://github.com/plotly/dash-daq).

    These docs are using version $n."),

    html_a(html_h3("BooleanSwitch"), href="#"),

    booleanswitch_index_example.source_code,
    booleanswitch_index_example.layout
    
end

end
