@doc_chapter "/dash_data_table/tooltips" begin
    @example conditional_tooltip "conditional_tooltip.jl"
    @example images_tooltip "images_tooltip.jl"
    @example individual_cells "individual_cells.jl"
    @example individual_cells1 "individual_cells1.jl"
    @example individual_cells2 "individual_cells2.jl"
    @example single_tooltip_column "single_tooltip_column.jl"
    @example styling_tooltip "styling_tooltip.jl"
    @example table_tooltips "table_tooltips.jl"
    @example tooltip_column_header "tooltip_column_header.jl"
    @example tooltip_header_diff "tooltip_header_diff.jl"
    @example colum_header_few "colum_header_few.jl"
    @layout html_div() do
        html_h1("DataTable Tooltips"),
        dcc_markdown("""
            DataTable Tooltips allow you to provide additional information about table cells or headers when hovering your mouse over cells.
        """),
        dcc_markdown("""
            These properties can be used to specify DataTable tooltips:

            - `tooltip`: Column based tooltip configuration applied to all rows
            - `tooltip_conditional`: Conditional tooltips overriding tooltip
            - `tooltip_data`: Statically defined tooltip for each row/column combination
            - `tooltip_header`: Statically defined tooltip for each header column and optionally each header row
            - `tooltip_delay`: Table-wide default delay before the tooltip is displayed
            - `tooltip_duration`: Table-wide default duration before the tooltip disappears. Set to None to prevent the tooltip from disappearing.
        """),
        dcc_markdown("""
            See [DataTable Reference](https://dash-julia.plotly.com/dash_data_table/reference) for detailed descriptions.
        """),
        html_h3("Tooltips on Individual Cells"),
        dcc_markdown("""
            Use tooltips on individual cells if your data is abbreviated, cut-off, or if you'd like to display more context about your data.

            This example displays the same data in the cell within the header:
        """),
        source"individual_cells",
        layout"individual_cells",
        dcc_markdown("""
            The shape of the `toolip_data` is a list of dictionaries, where each dictionary's key matches the `column.id` and each dictionary's value is a `Dict` with `value` & `type`. Alternatively, it can be a single value and type will be a string instead of `markdown`.
        """),
        source"individual_cells1",
        layout"individual_cells1",
        dcc_markdown("""
            This example displays different content in each column than what is displayed in the cell.
        """),
        source"individual_cells2",
        layout"individual_cells2",
        html_h3("Tooltips in Column Headers"),
        dcc_markdown("""
        If your column headers are abbreviated or cut-off (See DataTable Width), then place a tooltip in the header with `tooltip_header`.

        We recommend providing some light styling to the header to indicate that it is "hoverable". We use the dotted underline with `text-decoration`. [This isn't supported in IE11](https://caniuse.com/?search=text-decoration-style).

        In this example, the headers are cut-off because they are too long. Our tooltip is the original name of the column.
        """),
        source"tooltip_column_header",
        layout"tooltip_column_header",
        dcc_markdown("""
            Alternatively, you can specify a different name within tooltip_header or specify a subset of columns:
        """),
        source"colum_header_few",
        layout"colum_header_few",
        dcc_markdown("""
            *Note that ellipses aren't displayed in headers. This is a bug, subscribe to [plotly/dash-table#735](https://github.com/plotly/dash-table/issues/735) for details.*

            If your `DataTable` has multiple rows of headers, then use a list as the value of the `tooltip_header` items.

            For merged cells, the values must repeat in each cell.
        """),
        source"tooltip_header_diff",
        layout"tooltip_header_diff",
        html_h3("A Single Tooltip in the Column"),
        dcc_markdown("""
            As an alternative or in addition to column header tooltips, place a tooltip to appear on the entire column with the `tooltip` property.

            This can also be helpful with large tables where the user may lose track of the column headers.

            If the tooltip is specified for both headers and cells, you can use the use_with property instead of specifying a separate `tooltip_header` and tooltip.
        """),
        source"single_tooltip_column",
        layout"single_tooltip_column",
        html_h3("Conditional Tooltips"),
        dcc_markdown("""
            Tooltips can also be customized based on conditions. The `tooltip_conditional` has the same syntax as the style_data_conditional property, see the [conditional formatting](https://dash-julia.plotly.com/dash_data_table/conditional_formatting) chapter for many examples.

            If both `tooltip_conditional` and `tooltip` would display a tooltip for a cell, the conditional tooltip takes priority. If multiple conditions match the data row, the last match has priority.
        """),
        source"conditional_tooltip",
        layout"conditional_tooltip",
        html_h3("Images in Tooltips"),
        dcc_markdown("""
            Markdown supports images with this syntax: !`[alt](src)` where alt refers to the image's alt text and `src` is the path to the image (the src property).

            The `src` can refer to images within your project's `"assets"` folder or absolute URLs. If referring to an image in the assets folder, we recommend using `app.get_relative_path` so that the image URL is correct when working locally and when deploying to Dash Enterprise.
        """),
        source"images_tooltip",
        layout"images_tooltip",
        html_h3("Tables in Tooltips"),
        dcc_markdown("""
            Markdown supports tables with a syntax that looks like this:
        """),
        dcc_markdown("""
            ```
                | City       | Value     | Return     |
                | :------------- | :----------: | -----------: |
                |  Montreal   | 41,531    | 431.245 |
                | Seattle   | 53,153 | 12.431 |
            ```
        """),
        dcc_markdown("""
            This can be specified within a table's value:
        """),
        source"table_tooltips",
        layout"table_tooltips",
        html_h3("Styling Tooltips"),
        dcc_markdown("""
            Tooltips can be styled with the `dash-tooltip` (container) and `dash-table-tooltip` (content) CSS classes. This can be specified within a CSS file inside your `assets/` folder or within the table itself with the css property.
        """),
        source"styling_tooltip",
        layout"styling_tooltip",
        html_h3("Customizing Delay & Duration"),
        dcc_markdown("""
            Set `tooltip_delay` to `0` for the tooltips to appear immediately.

            Set `tooltip_duration` to `nothing` in order for the tooltips to remain visible while you are hovering over them. Otherwise, they will disappear after `tooltip_duration` milliseconds.
        """)
    end
end