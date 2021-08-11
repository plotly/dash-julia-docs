@doc_chapter "/datatable/width" begin
    @example default "default.jl"
    @example denser_multi_line "denser_multi_line.jl"
    @example ellipses_tooltips "ellipses_tooltips.jl"
    @example horizontal_scroll_cell_wrap "horizontal_scroll_cell_wrap.jl"
    @example horizontal_scroll_ellipses "horizontal_scroll_ellipses.jl"
    @example horizontal_scroll_fixed_columns "horizontal_scroll_fixed_columns.jl"
    @example horizontal_scroll_fixed_ellipses "horizontal_scroll_fixed_ellipses.jl"
    @example horizontal_scroll "horizontal_scroll.jl"
    @example individual_width "individual_width.jl"
    @example multiple_lines "multiple_lines.jl"
    @example multiple_lines2 "multiple_lines2.jl"
    @example overflowing "overflowing.jl"
    @example override_sing_width "override_sing_width.jl"
    @example percent_width_fixed_layout "percent_width_fixed_layout.jl"
    @example percent_width "percent_width.jl"
    @example percent_width1 "percent_width1.jl"
    @example wrap_multiline "wrap_multiline.jl"
    @layout html_div() do
        html_h1("DataTable Width & Column Width"),
        html_h3("Default Width"),
        dcc_markdown("""
            By default, the table will expand to the width of its container.
            The width of the columns is determined automatically in order to 
            accommodate the content in the cells.
        """),
        source"default",
        layout"default",
        dcc_markdown("""
            The default styles work well for a small number of columns and short 
            text. However, if you are rendering a large number of columns or cells with
            long contents, then you'll need to employ one of the following overflow 
            strategies to keep the table within its container.
        """),
        html_h3("Wrapping onto Multiple Lines"),
        dcc_markdown("""
            If your cells contain contain text with spaces, then you can overflow your content 
            into multiple lines.
        """),
        source"multiple_lines",
        layout"multiple_lines",
        dcc_markdown("""
            `style_cell` updates the styling for the data cells & the header cells. 
            To specify header styles, use `style_header`. To specify data cell styles
            , use `style_data`.

            This example keeps the header on a single line while wrapping the data cells.
        """),
        source"multiple_lines2",
        layout"multiple_lines2",
        html_h3("Denser Multi-Line Cells with Line-Height"),
        dcc_markdown("""
            If you are displaying lots of text in your cells, then you may want 
            to make the text appear a little more dense by shortening up the 
            line-height. By default (as above), it's around 22px. Here, 
            it's 15px.
        """),
        source"denser_multi_line",
        layout"denser_multi_line",
        html_h3("Wrapping onto Multiple Lines while Constraining the Height of Cells"),
        dcc_markdown("""
            If your text is really long, then you can constrain the height of the cells and 
            display a tooltip when hovering over the cell.
        """),
        source"wrap_multiline",
        layout"wrap_multiline",
        dcc_markdown("""
            Hover over the cells to see the tooltip.

            Why the css? Fixed height cells are tricky because, by CSS 2.1 rules, the height of a table cell is "the minimum height required by the content". So, here we are setting the height of the cell indirectly by setting the div within the cell.

            In this example, we display two lines of data by setting the line-height to be 15px and the height of each cell to be 30px. The second sentence is cut off.

            There are a few limitations with this method:

            1. It is not possible to display ellipses with this method.
            1. It is not possible to set a max-height. All of the cells need to be the same height.
            Subscribe to [plotly/dash-table#737](https://github.com/plotly/dash-table/issues/737) for updates or other workarounds on this issue.
        """),
        html_h3("Overflowing Into Ellipses"),
        dcc_markdown("""
            Alternatively, you can keep the content on a single line but display a set of ellipses if the content is too long to fit into the cell.

            Here, `max-width` is set to 0. It could be any number, the only important thing is that it is supplied. The behaviour will be the same whether it is 0 or 50.

            If you want to just hide the content instead of displaying ellipses, then set `textOverflow` to `clip` instead of `ellipsis`.
        """),
        source"overflowing",
        layout"overflowing",
        html_blockquote([
            "In the example above, ellipsis are not displayed for the header. We consider this a bug, subscribe to",
            html_a(html_b("plotly/dash-table#735"), href="https://github.com/plotly/dash-table/issues/735"),
            "for updates."
        ]),
        html_h3("Ellipses & Tooltips"),
        dcc_markdown("""
            If you are display text data that is cut off by ellipses, then you can include tooltips so that the full text appears on hover.

            By setting `tooltip_duration` to None, the tooltip will persist as long as the mouse pointer is above the cell, and it will disappear when the pointer moves away. You can override this by passing in a number in milliseconds (e.g. 2000 if you want it to disappear after two seconds).
        """),
        source"ellipses_tooltips",
        layout"ellipses_tooltips",
        html_h3("Horizontal Scroll"),
        dcc_markdown("""
            Instead of trying to fit all of the content in the container, you could overflow the entire container into a scrollable container.
        """),
        source"horizontal_scroll",
        layout"horizontal_scroll", 
        dcc_markdown("""
            Note how we haven't explicitly set the width of the individual columns yet. The widths of the columns have been computed dynamically 
            depending on the width of the table and the width of 
            the cell's contents. In the example above, by providing a scrollbar, we're effectively giving the table as much width as it needs in order to fit the entire width of the cell contents on a single line.
        """),
        html_h3("Horizontal Scroll with Fixed-Width Columns & Cell Wrapping")    ,
        dcc_markdown("""
            Alternatively, you can fix the width of each column by adding width. In this case, the column's width will be constant, even if its contents are shorter or wider.
        """),
        source"horizontal_scroll_cell_wrap",
        layout"horizontal_scroll_cell_wrap", 
        html_h3("Horizontal Scroll with Fixed-Width & Ellipses"),
        source"horizontal_scroll_fixed_ellipses",
        layout"horizontal_scroll_fixed_ellipses",
        html_h3("Horizontal Scrolling via Fixed Columns"),
        dcc_markdown("""
            You can also add a horizontal scrollbar to your table by fixing the leftmost columns with fixed_columns.
        """),
        source"horizontal_scroll_fixed_columns",
        layout"horizontal_scroll_fixed_columns",
        dcc_markdown("""
            Here is the same example but with *fixed-width cells & ellipses*.
        """),
        html_h3("Setting Column Widths"),
        html_h4("Percentage Based Widths"),
        dcc_markdown("""
            The widths of individual columns can be supplied through the `style_cell_conditional` property. These widths can be specified as percentages or fixed pixels.
        """),
        source"percent_width",
        layout"percent_width",
        dcc_markdown("""
            By default, the column width is the maximum of the percentage given and the width of the content. So, if the content in the column is wide, the column may be wider than the percentage given. This prevents overflow.

            In the example below, note the first column is actually wider than 10%; if it were shorter, the text "New York City" would overflow.
        """),
        source"percent_width1",
        layout"percent_width1",
        dcc_markdown("""
            To force columns to be a certain width (even if that causes overflow) use `style_data` and `table-layout: fixed`.
        """),
        source"percent_width_fixed_layout",
        layout"percent_width_fixed_layout",
        dcc_markdown("""
            Setting consistent percentage-based widths is a good option if you are using `virtualization`, `sorting` (`sort_action`), or `filtering` (`filter_action`). Without fixed column widths, the table will dynamically resize the columns depending on the width of the data that is displayed.

            **Limitations**

            1. Percentage-based widths is not available with fixed_rows & table-layout: fixed. See [plotly/dash-table#745](https://github.com/plotly/dash-table/issues/748)
            1. Percentage-based widths with fixed_rows and without table-layout: fixed has some issues when resizing the window. See [plotly/dash-table#747](https://github.com/plotly/dash-table/issues/747)
        """),
        html_h3("Individual Column Widths with Pixels"),
        dcc_markdown("""
            In this example, we set three columns to have fixed-widths. The remaining two columns will be take up the remaining space.
        """),
        source"individual_width",
        layout"individual_width",
        html_h3("Overriding a Single Column's Widt"),
        dcc_markdown("""
            You can set the width of all of the columns with `style_data` and override a single column with `style_cell_conditional`.
        """),
        source"override_sing_width",
        layout"override_sing_width"
    end
end