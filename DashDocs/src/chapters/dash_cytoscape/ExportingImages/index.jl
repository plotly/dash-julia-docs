@doc_chapter "/cytoscape/images" begin

    @example default_export "default_export.jl"

    @layout html_div() do
        html_h1("Exporting Images in JPG, PNG and SVG"),
        dcc_markdown("""
        Starting from v0.2.0, you can now export your cytoscape graphs using callbacks. The following app shows this new feature in action:
        """),
        source"default_export",
        layout"default_export"
    end
end