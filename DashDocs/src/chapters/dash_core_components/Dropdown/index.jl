@doc_chapter "/dash-core-components/dropdown" begin

    @example default "default.jl"
    @example multi "multi.jl"
    @example searchable "searchable.jl"
    @example clearable "clearable.jl"
    @example placeholder "placeholder.jl"
    @example disabled "disabled.jl"
    @example disabled_options "disabled_options.jl"
    @example dynamic_options "dynamic_options.jl"
  
    @layout html_div() do

    html_h1("Dropdown Examples and Reference"),

    dcc_markdown("
    For production Dash apps, the Dash Core Components styling & layout should be managed with Dash Enterprise [Design Kit](https://plotly.com/dash/design-kit).
    "),

    html_h3("Default Dropdown"),

    html_div("An example of a default dropdown without any extra properties."),

    source"default",
    layout"default",

    html_h3("Multi-value dropdown"),

    dcc_markdown("A dropdown component with the `multi` property set to `true` will allow the user to select more than one value at a time."),

    source"multi",
    layout"multi",

    html_h3("Disable Search"),

    dcc_markdown("The `searchable` property is set to `true` by default on all Dropdown components. To prevent searching the dropdown value, just set the `searchable` property to `false`. Try searching for 'New York' on this dropdown below and compare it to the other dropdowns on the page to see the difference."),

    source"searchable",
    layout"searchable",

    html_h3("Dropdown Clear"),

    dcc_markdown("The `clearable` property is set to `true` by default on all Dropdown components. To prevent the clearing of the selected dropdown value, just set the `clearable` property to `false."),

    source"clearable",
    layout"clearable",

    html_h3("Placeholder Text"),

    dcc_markdown("The `placeholder` property allows you to define default text shown when no value is selected."),

    source"placeholder",
    layout"placeholder",

    html_h3("Disable Dropdown"),

    dcc_markdown("To disable the dropdown just set `disabled=True.`"),

    source"disabled",
    layout"disabled",

    html_h3("Disable Options"),

    dcc_markdown("To disable a particular option inside the dropdown menu, set the `disabled property` in the options."),

    source"disabled_options",
    layout"disabled_options",

    html_h3("Dyanmic Options"),

    dcc_markdown("This is an example on how to update the options on the server depending on the search terms the user types. For example purpose the options are empty on first load, as soon as you start typing they will be loaded with the corresponding values."),

    source"dynamic_options",
    layout"dynamic_options",
    html_h3("dcc_dropdown Reference"),
    dcc_markdown("""
        ```julia
            Access this documentation in your Julia REPL with:

            ?help dcc_dropdown

            Our recommended IDE for writing Dash apps is Dash Enterprise's Data Science Workspaces, which has typeahead support for Dash Component Properties. Find out if your company is using Dash Enterprise.
        ```
    """),
    dcc_markdown(string(@doc dcc_dropdown)) 

end

end
