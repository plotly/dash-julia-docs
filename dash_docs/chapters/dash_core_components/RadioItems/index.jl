module chapters_dash_core_components_radioitems

using Dash, DashHtmlComponents, DashCoreComponents

include("../../../utils.jl")

export examples

examples_path = joinpath(@__DIR__, "examples")

radioitems_vertical = LoadExampleCode(string(examples_path, "/radioitems_vertical.jl"))

radioitems_horizontal = LoadExampleCode(string(examples_path, "/radioitems_horizontal.jl"))

app =  dash()

app.layout = html_div() do

    html_h1("Radioitems Examples and Reference"),

    dcc_markdown("`dcc_radioitems()` is a component for rendering a set of checkboxes. See also [Checklist](/dash-core-components/checklist) for selecting a multiple options at a time or [Dropdown](/dash-core-components/dropdown) for a more compact view."),

    radioitems_vertical.source_code,
    radioitems_vertical.layout,

    radioitems_horizontal.source_code,
    radioitems_horizontal.layout

end

end
