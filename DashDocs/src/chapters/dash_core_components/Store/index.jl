@doc_chapter "/dash_core_components/store" begin

    @example store_clicks "store_clicks.jl"
    # @example store_callbacks "store_callbacks.jl"
  
    @layout html_div() do

    html_h1("dcc_store"),

    source"store_clicks",
    layout"store_clicks",
    
    html_h3("dcc_store Reference"),
    dcc_markdown("""
        ```
            Access this documentation in your Julia REPL with:

            ?help dcc_store

            Our recommended IDE for writing Dash apps is Dash Enterprise's Data Science Workspaces, which has typeahead support for Dash Component Properties. Find out if your company is using Dash Enterprise.
        ```
    """),
    dcc_markdown(string(@doc dcc_store))

end

end