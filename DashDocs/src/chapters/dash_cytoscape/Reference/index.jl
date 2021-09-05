@doc_chapter "/cytoscape/reference" begin
    @layout html_div() do
        html_h1("Cytoscape Reference"),
        html_blockquote([
            dcc_markdown("""
                Access this documentation in your Julia REPL with:
                ```julia
                ?help DashCytoscape.cyto_cytoscape
                ```
                Our recommended IDE for writing Dash apps is Dash
                Enterprise's [Data Science Workspaces](https://plotly.com/dash/workspaces/),
                which has typeahead support for Dash Component Properties. [Find out if your company is using Dash Enterprise](https://go.plotly.com/company-lookup).
            """)
        ]),
        dcc_markdown(string(@doc DashCytoscape.cyto_cytoscape))
    end
end