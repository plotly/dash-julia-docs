@doc_chapter "/dash-core-components/tab" begin

    @layout html_div() do

        html_h1("dcc_tab"),
        
        html_h3("dcc_tab Reference"),
        dcc_markdown("""
            ```julia
                Access this documentation in your Julia REPL with:

                ?help dcc_tab

                Our recommended IDE for writing Dash apps is Dash Enterprise's Data Science Workspaces, which has typeahead support for Dash Component Properties. Find out if your company is using Dash Enterprise.
            ```
        """),
        dcc_markdown(string(@doc dcc_tab))
    end

end
