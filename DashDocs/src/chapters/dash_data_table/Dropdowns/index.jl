@doc_chapter "/datatable/dropdowns" begin
    @example per_column_dropdown "per_column_dropdown.jl"
    @example per_row_dropdown "per_row_dropdown.jl"
    @layout html_div() do
        html_h1("DataTable Dropdowns"),
        dcc_markdown("""
            The DataTable includes support for per-column and per-cell dropdowns. In future releases, this will be tightly integrated with a more formal typing system.

            For now, use the dropdown renderer as a way to limit the options available when editing the values with an editable table.
        """),
        html_h3("DataTable with Per-Column Dropdowns"),
        source"per_column_dropdown",
        layout"per_column_dropdown",
        html_h3("DataTable with Per-Row Dropdowns"),
        source"per_row_dropdown",
        layout"per_row_dropdown"

    end
end