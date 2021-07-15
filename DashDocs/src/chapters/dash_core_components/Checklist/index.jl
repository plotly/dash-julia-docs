@doc_chapter "/dash_core_components/checklist" begin

@example checkbox_vertical "checklist_vertical.jl"
@example checkbox_horizontal "checklist_horizontal.jl"




@layout html_div() do

    html_h1("Checklist Examples and Reference"),

    dcc_markdown("`dcc_checklist()` is a component for rendering a set of checkboxes. See also [RadioItems](/dash-core-components/radioitems) for selecting a single option at a time or [Dropdown](/dash-core-components/dropdown) for a more compact view."),

    source"checkbox_vertical",
    layout"checkbox_vertical",

    source"checkbox_horizontal",
    layout"checkbox_horizontal",
    html_h3("Checklist Properties"),
    dcc_markdown("""
    Access this documentation in your Julia REPL with:
    ```julia    
    ?help dcc_checklist
    ```
    Our recommended IDE for writing Dash apps is Dash
      Enterprise's [Data Science Workspaces](https://plotly.com/dash/workspaces/),
       which has typeahead support for Dash Component Properties. [Find out if your company is using Dash Enterprise](https://go.plotly.com/company-lookup).
    """)

end

end