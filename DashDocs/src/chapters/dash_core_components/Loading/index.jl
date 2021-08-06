@doc_chapter "/dash_core_components/loading" begin

    @layout html_div() do

        html_h1("dcc_loading"),
        
        html_h3("dcc_loading Reference"),
        dcc_markdown("""
            ```
                Access this documentation in your Julia REPL with:

                ?help dcc_loading

                Our recommended IDE for writing Dash apps is Dash Enterprise's Data Science Workspaces, which has typeahead support for Dash Component Properties. Find out if your company is using Dash Enterprise.
            ```
        """),
        dcc_markdown(string(@doc dcc_loading))
    end

end
