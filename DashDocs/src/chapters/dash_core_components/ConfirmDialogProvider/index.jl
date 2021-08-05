@doc_chapter "/dash_core_components/confirmprovider" begin

    @example confirm_provider "confirm_provider.jl"
    
    
    
    
    @layout html_div() do

    html_h1("dcc_confirmdialogprovider Documentation"),

    source"confirm_provider",
    layout"confirm_provider",

    html_h3("dcc_confirmdialogprovider Reference"),

    dcc_markdown("""
        ```
            Access this documentation in your Julia REPL with:

            ?help dcc_confirmdialogprovider

            Our recommended IDE for writing Dash apps is Dash Enterprise's Data Science Workspaces, which has typeahead support for Dash Component Properties. Find out if your company is using Dash Enterprise.
        ```
    """),
    dcc_markdown(string(@doc dcc_confirmdialogprovider)) 

end

end