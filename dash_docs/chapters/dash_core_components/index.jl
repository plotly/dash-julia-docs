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

textarea_index_example = LoadExampleCode(string(examples_path, "/textarea_index_example.jl"))

checkbox_vertical = LoadExampleCode(string(examples_path, "/checkbox_vertical.jl"))

checkbox_horizontal = LoadExampleCode(string(examples_path, "/checkbox_horizontal.jl"))

radioitems_vertical = LoadExampleCode(string(examples_path, "/radioitems_vertical.jl"))

radioitems_horizontal = LoadExampleCode(string(examples_path, "/radioitems_horizontal.jl"))

datepickersingle = LoadExampleCode(string(examples_path, "/datepickersingle.jl"))

datepicker_range = LoadExampleCode(string(examples_path, "/datepicker_range.jl"))

markdown = LoadExampleCode(string(examples_path, "/markdown.jl"))

tabs = LoadExampleCode(string(examples_path, "/tabs.jl"))

examples = [tabs]

app =  dash()

tabs.callback!(app)

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

    html_a(html_h3("Input"), href="/dash_core_components/input"),

    input_index_example.source_code,
    input_index_example.layout,

    html_a(html_h3("Textarea"), href="/dash_core_components/textarea"),

    textarea_index_example.source_code,
    textarea_index_example.layout,

    html_a(html_h3("Checkboxes"), href="/dash_core_components/checklist"),

    checkbox_vertical.source_code,
    checkbox_vertical.layout,

    checkbox_horizontal.source_code,
    checkbox_horizontal.layout,

    html_a(html_h3("Radioitems"), href="/dash_core_components/radioitems"),

    radioitems_vertical.source_code,
    radioitems_vertical.layout,

    radioitems_horizontal.source_code,
    radioitems_horizontal.layout,

    html_a(html_h3("DatePickerSingle"), href="/dash_core_components/datepickersingle"),

    datepickersingle.source_code,
    datepickersingle.layout,

    html_a(html_h3("DatePickerRange"), href="/dash_core_components/datepickerrange"),

    datepicker_range.source_code,
    datepicker_range.layout,

    html_a(html_h3("Markdown"), href="/dash_core_components/markdown"),

    markdown.source_code,
    markdown.layout,

    html_a(html_h3("Tabs"), href="/dash_core_components/tabs"),

    tabs.source_code,
    tabs.layout


end

end
