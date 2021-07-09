module chapters_dash_core_components_dropdown

using Dash, DashHtmlComponents, DashCoreComponents

include("../../../utils.jl")

export examples

examples_path = joinpath(@__DIR__, "examples")

default = LoadExampleCode(string(examples_path, "/default.jl"))

multi = LoadExampleCode(string(examples_path, "/multi.jl"))

searchable = LoadExampleCode(string(examples_path, "/searchable.jl"))

clearable = LoadExampleCode(string(examples_path, "/clearable.jl"))

placeholder = LoadExampleCode(string(examples_path, "/placeholder.jl"))

disabled = LoadExampleCode(string(examples_path, "/disabled.jl"))

disabled_options = LoadExampleCode(string(examples_path, "/disabled_options.jl"))

dynamic_options = LoadExampleCode(string(examples_path, "/dynamic_options.jl"))

examples = [default, dynamic_options]

app =  dash()

default.callback!(app)

dynamic_options.callback!(app)

app.layout = html_div() do

    html_h1("Dropdown Examples and Reference"),

    dcc_markdown("
    For production Dash apps, the Dash Core Components styling & layout should be managed with Dash Enterprise [Design Kit](https://plotly.com/dash/design-kit).
    "),

    html_h3("Default Dropdown"),

    html_div("An example of a default dropdown without any extra properties."),

    default.source_code,
    default.layout,

    html_h3("Multi-value dropdown"),

    dcc_markdown("A dropdown component with the `multi` property set to `true` will allow the user to select more than one value at a time."),

    multi.source_code,
    multi.layout,

    html_h3("Disable Search"),

    dcc_markdown("The `searchable` property is set to `true` by default on all Dropdown components. To prevent searching the dropdown value, just set the `searchable` property to `false`. Try searching for 'New York' on this dropdown below and compare it to the other dropdowns on the page to see the difference."),

    searchable.source_code,
    searchable.layout,

    html_h3("Dropdown Clear"),

    dcc_markdown("The `clearable` property is set to `true` by default on all Dropdown components. To prevent the clearing of the selected dropdown value, just set the `clearable` property to `false."),

    clearable.source_code,
    clearable.layout,

    html_h3("Placeholder Text"),

    dcc_markdown("The `placeholder` property allows you to define default text shown when no value is selected."),

    placeholder.source_code,
    placeholder.layout,

    html_h3("Disable Dropdown"),

    dcc_markdown("To disable the dropdown just set `disabled=True.`"),

    disabled.source_code,
    disabled.layout,

    html_h3("Disable Options"),

    dcc_markdown("To disable a particular option inside the dropdown menu, set the `disabled property` in the options."),

    disabled_options.source_code,
    disabled_options.layout,

    html_h3("Dyanmic Options"),

    dcc_markdown("This is an example on how to update the options on the server depending on the search terms the user types. For example purpose the options are empty on first load, as soon as you start typing they will be loaded with the corresponding values."),

    dynamic_options.source_code,
    dynamic_options.layout

end

end
