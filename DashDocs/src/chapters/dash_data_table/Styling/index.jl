@doc_chapter "/datatable/style" begin
    @example default "default.jl"
    @example add_border "add_border.jl"
    @example column_alignment "column_alignment.jl"
    @example dark_theme "dark_theme.jl"
    @example editable_column "editable_column.jl"
    @example minimal_header "minimal_header.jl"
    @example multi_headers "multi_headers.jl"
    @example stripped_rows "stripped_rows.jl"
    @example style_priority "style_priority.jl"
    @example styling "styling.jl"
    @layout html_div() do
        html_h1("Styling the DataTable"),
        html_h3("Default Styles"),
        dcc_markdown("""
            By default, the DataTable has grey headers and borders around each cell. It resembles a spreadsheet and the headers are clearly defined.
        """),
        source"default",
        layout"default",
        html_h3("Column Alignment"),
        dcc_markdown("""
            When displaying numerical data, it's a good practice to use monospaced fonts, to right-align the data, and to provide the same number of decimals throughout the column.
        """),
        html_blockquote([
            "To learn about formatting numbers and dates, see the ",
            html_a([html_b("data types section")], href="https://dash-julia.plotly.com/dash_data_table/typing")
        ]),
        dcc_markdown("""
            For textual data, left-aligning the text is usually easier to read.

            In both cases, the column headers should have the same alignment as the cell content.
        """),
        source"column_alignment",
        layout"column_alignment",
        html_h3("Styling the Table as a List"),
        dcc_markdown("""
            The gridded view is a good default view for an editable table as it looks and feels like a spreadsheet. If your table isn't editable, then in many cases it can look cleaner without the vertical grid lines.
        """),
        source"styling",
        layout"styling",
        html_h3("List Style with Minimal Headers"),
        dcc_markdown("""
            In some contexts, the grey background can look a little heavy. You can lighten this up by giving it a white background and a bold text.
        """),
        source"minimal_header",
        layout"minimal_header",
        html_h3("Striped Rows"),
        dcc_markdown("""
            When you're viewing datasets where you need to compare values within individual rows, it can sometimes be helpful to give the rows alternating background colors. We recommend using colors that are faded so as to not attract too much attention to the stripes.

            Notice the three different groups you can style: "cell" is the whole table, "header" is just the header rows, and "data" is just the data rows. To use even/odd or other styling based on `row_index` you must use `style_data_conditional`.
        """),
        source"stripped_rows",
        layout"stripped_rows",
        html_h3("Multi-Headers"),
        dcc_markdown("""
            Multi-headers are natively supported in the DataTable. Just set name inside `columns` as a list of strings instead of a single string and toggle `merge_duplicate_headers=true`. DataTable will check the neighbors of each header row and, if they match, will merge them into a single cell automatically.
        """),
        source"multi_headers",
        layout"multi_headers",
        html_h3("Dark Theme with Cells"),
        dcc_markdown("""
            You have full control over all of the elements in the table. If you are viewing your table in an app with a dark background, you can provide inverted background and font colors.
        """),
        source"dark_theme",
        layout"dark_theme",
        html_h3("Conditional Formatting"),
        dcc_markdown("""
            See the new conditional [formatting chapter](https://dash-julia.plotly.com/dash_data_table/conditional_formatting).
        """),
        html_h3("Styles Priority"),
        dcc_markdown("""
            There is a specific order of priority for the style* properties. If there are multiple style* props, the one with higher priority will take precedence. Within each prop, rules for higher indices will be prioritized over those for lower indices. Previously applied styles of equal priority win over later ones (applied top to bottom, left to right).

            These are the priorities of style_* props, in decreasing order:
            ```
            1. style_data_conditional
            2. style_data
            3. style_filter_conditional
            4. style_filter
            5. style_header_conditional
            6. style_header
            7. style_cell_conditional
            8. style_cell
            ```
        """),
        source"style_priority",
        layout"style_priority",
        html_h3("Adding Borders"),
        dcc_markdown("""
            Customize the table borders by adding `border` to style_* props.
        """),
        source"add_border",
        layout"add_border",
        html_h3("Styling Editable Columns"),
        dcc_markdown("""
            Editable columns can be styled using `column_editable` in style_header_conditional, style_filter_conditional, and style_data_conditional props.
        """),
        source"editable_column",
        layout"editable_column"
    end
end