module chapters_dash_core_components_checklist

using Dash, DashHtmlComponents, DashCoreComponents

include("../../../utils.jl")

export examples

examples_path = joinpath(@__DIR__, "examples")

checkbox_vertical = LoadExampleCode(string(examples_path, "/checkbox_vertical.jl"))

checkbox_horizontal = LoadExampleCode(string(examples_path, "/checkbox_horizontal.jl"))

app =  dash()

app.layout = html_div() do

    html_h1("Checkbox Examples and Reference"),

    dcc_markdown("`dcc_checklist()` is a component for rendering a set of checkboxes. See also [RadioItems](/dash-core-components/radioitems) for selecting a single option at a time or [Dropdown](/dash-core-components/dropdown) for a more compact view."),

    checkbox_vertical.source_code,
    checkbox_vertical.layout,

    checkbox_horizontal.source_code,
    checkbox_horizontal.layout

end

end
