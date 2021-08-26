@doc_chapter "/cytoscape/responsive" begin

    @example default_cyto_graph "default_cyto_graph.jl"

    @layout html_div() do
        html_h1("Building responsive Cytoscape graphs"),
        dcc_markdown("""
            Starting from v0.2.0, you can make your cytoscape graph responsive:
            ```julia
                cyto_cytoscape(
                    id='cytoscape',
                    ...,
                    responsive=true
                )
            ```
            The following app shows this new feature in action:
        """),
        source"default_cyto_graph",
        layout"default_cyto_graph"
    end
end