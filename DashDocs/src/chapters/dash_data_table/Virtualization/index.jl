@doc_chapter "/datatable/virtualization" begin
    @example default "default.jl"
    @layout html_div() do
        html_h1("Virtualization"),
        dcc_markdown("""
            In addition to pagination, `DataTable` also has virtualization capabilities for viewing large datasets. Virtualization saves browser resources while still permitting the user to scroll through the entire dataset. It achieves this by only a rendering a subset of the data at any instant.

            The virtualization backend makes a few assumptions about the style of your `DataTable` which must be adhered to in order to ensure that the table scrolls smoothly.

            - the width of the columns is fixed
            - the height of the rows is always the same
            - runtime styling changes will not affect width and height compared to the table's first rendering

            The example below prevents runtime style changes by fixing the column widths and setting the white-space CSS property in the cells to normal.
        """),
        source"default",
        layout"default"
    end
end