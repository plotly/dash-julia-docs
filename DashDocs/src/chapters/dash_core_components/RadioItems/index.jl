@doc_chapter "/dash-core-components/radioitems" begin

    @example radioitems_vertical "radioitems_vertical.jl"
    @example radioitems_horizontal "radioitems_horizontal.jl"
  
    @layout html_div() do

    html_h1("Radioitems Examples and Reference"),

    dcc_markdown("`dcc_radioitems()` is a component for rendering a set of checkboxes. See also [Checklist](/dash-core-components/checklist) for selecting a multiple options at a time or [Dropdown](/dash-core-components/dropdown) for a more compact view."),

    source"radioitems_vertical",
    layout"radioitems_vertical",

    source"radioitems_horizontal",
    layout"radioitems_horizontal",

    html_h3("dcc_radioitems Reference"),
    dcc_markdown("""
        ```
            Access this documentation in your Julia REPL with:

            ?help dcc_radioitems

            Our recommended IDE for writing Dash apps is Dash Enterprise's Data Science Workspaces, which has typeahead support for Dash Component Properties. Find out if your company is using Dash Enterprise.
        ```
    """),
    dcc_markdown(string(@doc dcc_radioitems)) 

end

end