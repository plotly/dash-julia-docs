@doc_chapter "/dash-core-components/confirmdialog" begin

    @example confirm "confirm.jl"
    
    
    
    
    @layout html_div() do

    html_h1("ConfirmDialog component"),

    dcc_markdown("""
    ConfirmDialog is used to display the browser's native "confirm" modal, with an optional message and two buttons ("OK" and "Cancel"). This ConfirmDialog can be used in conjunction with buttons when the user is performing an action that should require an extra step of verification.
    
    """),

    source"confirm",
    layout"confirm",

    html_h3("dcc_confirmdialog Properties"),

    dcc_markdown("""
        ```julia
            Access this documentation in your Julia REPL with:

            ?help dcc_confirmdialog

            Our recommended IDE for writing Dash apps is Dash Enterprise's Data Science Workspaces, which has typeahead support for Dash Component Properties. Find out if your company is using Dash Enterprise.
        ```
    """),
    dcc_markdown(string(@doc dcc_confirmdialog))            

end

end