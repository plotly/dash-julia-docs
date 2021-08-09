@doc_chapter "/datatable/height" begin
  @example pagination "pagination.jl"
  @example vertical_scroll_fixed_header "vertical_scroll_fixed_header.jl"
  @example vertical_scroll_pagination "vertical_scroll_pagination.jl"
  @example vertical_scroll_virtualization "vertical_scroll_virtualization.jl"
  @example vertical_scroll "vertical_scroll.jl"
  @example wide_header_limitation "wide_header_limitation.jl"
  @example wide_header_limitation_fix1 "wide_header_limitation_fix1.jl"
  @example wide_header_limitation_fix2 "wide_header_limitation_fix2.jl"
  @layout html_div() do
  
      html_h1("DataTable Height"),
      dcc_markdown("""
        By default, the table's height will expand in order to render up to 250 rows. After 250 rows, the table will display a pagination UI which enables viewing of up to 250 rows at a time.
        """),

        html_h3("Setting Table Height with Pagination"),
        dcc_markdown("""
        If you are using pagination, you can control the 
        height by displaying fewer rows at a time. Instead of
        250 rows, you could display 10 rows at a time. By
          default and without wrapping, each row takes up 30px.
          So 10 rows with one header would set the table to be
            330px tall. The pagination UI itself is around 60px
            tall.
      """),
      html_h3("Setting Table Height with Pagination"),
      dcc_markdown("""
        If you are using pagination, you can control the height by displaying
        fewer rows at a time. Instead of 250 rows, you could display 10 rows at
        a time. By default and without wrapping, each row takes up 30px. So 10
        rows with one header would set the table to be 330px tall. The pagination
        UI itself is around 60px tall.
      """),
      source"pagination",
      layout"pagination",
      html_blockquote(["
        In this example, the pagination is done natively in the browser:
        all of the data are sent up front to the browser and Dash renders
        new pages as you click on the buttons. You can also do pagination
        in the backend so that only 10 rows are sent to the browser at a time
        (lowering network costs and memory). This is a good strategy if you 
        have more than 10,000-50,000 rows.", html_a([html_b("Learn about backend pagination.")], 
        href="https://dash-julia.plotly.com/basic-callbacks")] 
      ),
      html_h3("Setting Table Height with Vertical Scroll"),
      dcc_markdown("""
        If the table contains less than roughly 1000 rows, one option is to remove pagination,
        constrain the height, and display a vertical scrollbar.
      """),
      source"vertical_scroll",
      layout"vertical_scroll",
      html_h5("Limitations"),
      dcc_markdown("""
        If you have more than 1000 rows, then the browser will slow down when trying to render the
        table. With more than 1000 rows, we recommend switching to browser or server
        pagination (as above) or virtualization (as below).
      """),
      html_h3("Vertical Scroll With Pagination"),
      dcc_markdown("""
        If you have more than ~1000 rows, then you could keep pagination at the bottom of the
        table, constrain the height, and display a vertical scrollbar.
      """),
      source"vertical_scroll_pagination",
      layout"vertical_scroll_pagination",
      html_h3("Vertical Scroll With Fixed Headers"),
      dcc_markdown("""
        You can also fix headers so that the table content scrolls but the headers remain visible.
      """),
      source"vertical_scroll_fixed_header",
      layout"vertical_scroll_fixed_header",
      html_h5("Limitations"),
      dcc_markdown("""
        1. Percentage-based column widths is not available with fixed_rows & table-layout: fixed. See [plotly/dash-table#745](https://github.com/plotly/dash-table/issues/748)
        1. Percentage-based widths with fixed_rows and without table-layout: fixed has some issues when resizing the window. See [plotly/dash-table#747](https://github.com/plotly/dash-table/issues/747)
        1. If filtering is enabled, then horizontal scroll does not work with wide tables. [plotly/dash-table#746](https://github.com/plotly/dash-table/issues/746)
        1. If a column header is wider than the data within that column and the table's container isn't wide enough to display the headers, then the column will be as wide as the data and the header text will either be truncated (most browsers) or overflow onto the next column (Firefox). This is a bug ([plotly/dash-table#432](https://github.com/plotly/dash-table/issues/432). The current workaround is to hide the overflow or [fix the width of the columns in pixels](https://dash-julia.plotly.com/dash_data_table/column_width). When using this workaround, you may run into a few of these issues:
            1. In those scenarios where the header is cut off, it is not possible to set ellipses within the header. For updates, see [plotly/dash-table#735](https://github.com/plotly/dash-table/issues/735)
            1. When the text is truncated, it is useful to display tooltips displaying the entire text. It is not yet possible to add tooltips to headers. For updates, see [plotly/dash-table#295](https://github.com/plotly/dash-table/issues/295)
            2. If the header text is truncated, then the header overflow is visible. The current workaround is to hide the overflow with `overflow: 'hidden'`.
      """),
      html_h5("Example of the wide-header limitation"),
      dcc_markdown("""
        If the headers are wider than the cells and the table's container isn't wide enough to display all of the headers, then the column headers will be truncated on most browsers or will overflow on Firefox.
      """),
      source"wide_header_limitation",
      layout"wide_header_limitation",
      html_h5("Workaround Option 1: Hiding the header overflow for Firefox users"),
      dcc_markdown("""
        (If you are not on Firefox, then this example will look the same as above)
      """),
      source"wide_header_limitation_fix1",
      layout"wide_header_limitation_fix1",
      html_h5("Workaround Option 2: Fixing the width of the columns"),
      source"wide_header_limitation_fix2",
      layout"wide_header_limitation_fix2",
      html_h3("Vertical Scroll with Virtualization"),
      dcc_markdown("""
        As mentioned above, the browser has difficulty rendering thousands of rows 
        in a table. By rendering rows on the fly as you scroll, virtualization works
        around rendering performance issues inherent with the web browser.

        All of the data for your table will still be sent over the network to the
        browser, so if you are displaying more than 10,000-100,000 rows you may
        consider using [backend pagination](https://dash-julia.plotly.com/basic-callbacks) to reduce the volume of data that is 
        transferred over the network and associated memory usage.
      """),
      source"vertical_scroll_virtualization",
      layout"vertical_scroll_virtualization",
      html_h5("Limitations"),
      dcc_markdown("""
        1. With virtualization, the browser doesn't know the width of the columns in advance; it can only determine the width of the columns when they are rendered. So, your columns may change size as you scroll unless you [fix the column widths](https://dash-julia.plotly.com/dash_data_table/column_width).
        1. Since, with virtualization, we're rendering rows on the fly as we scroll, the rendering performance will be slower than the browser-optimized native vertical scrolling. If you scroll quickly, you may notice that table appears momentarily blank until rendering has completed.
        1. The same `fixed_rows` limitations exist as mentioned above.
      """)



  end
  
  end