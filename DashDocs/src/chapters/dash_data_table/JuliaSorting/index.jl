@doc_chapter "/dash_data_table/julia_filtering" begin
    @example backend_multicol_sorting "backend_multicol_sorting.jl"
    @example backend_paging_filtering "backend_paging_filtering.jl"
    @example backend_paging_graph "backend_paging_graph.jl"
    @example backend_paging_multi_coilumn "backend_paging_multi_coilumn.jl"
    @example backend_paging "backend_paging.jl"
    @example paging_page_number "paging_page_number.jl"
    @example paging_sorting "paging_sorting.jl"
    @layout html_div() do
        html_h1("DataTable - Julia Callbacks"),
        html_h3("Backend Paging"),
        dcc_markdown("""
            With backend paging, we can load data into our table progressively. Instead of loading all of the data at once, we'll only load data as the user requests it when they click on the "previous" and "next" buttons.

            Since backend paging integrates directly with your Dash callbacks, you can load your data from any Python data source.
        """),
        source"backend_paging",
        layout"backend_paging",
        dcc_markdown("""
            With backend paging, we can have front-end sorting and filtering but it will only filter and sort the data that exists on the page.

            This should be avoided. Your users will expect that sorting and filtering is happening on the entire dataset and, with large pages, might not be aware that this is only occurring on the current page.

            Instead, we recommend implementing sorting and filtering on the backend as well. That is, on the entire underlying dataset.

            **Note for returning users - changed property names:**

            - Sorted fields are now in `sort_by`, not `sorting_settings`
            - The filter string is now in `filter`, not `filtering_settings`
        """),
        html_h3("Backend Paging and Page Numbers"),
        dcc_markdown("""
            The pagination menu includes the number of the current page and the total page count. With native (i.e., frontend) pagination, the page count is calculated by the table. However, when using backend pagination, the data are served to the table through a callback; this makes it impossible for the table to calculate the total page count. As a consequence, the last-page navigation button is disabled (although all of the other buttons, as well as the direct navigation, are still functional).

            To get around this, supply a value to the page_count parameter of the table. This will serve as the "last page", which will re-enable the last-page navigation button and be displayed in the pagination menu. *Please note that you will not be able to use the pagination menu to navigate to a page that comes after the last page specified by pagecount!*
        """),
        source"paging_page_number",
        layout"paging_page_number",
        html_h3("Backend Paging with Sorting"),
        source"paging_sorting",
        layout"paging_sorting",
        html_h3("Backend Paging with Multi Column Sorting"),
        dcc_markdown("""
            Multi-column sort allows you to sort by multiple columns. This is useful when you have categorical columns with repeated values and you're interested in seeing the sorted values for each category.

            In this example, try sorting by continent and then any other column.
        """),
        source"backend_multicol_sorting",
        layout"backend_multicol_sorting",
        html_h3("Backend Paging with Filtering"),
        dcc_markdown("""
            DataTable's front-end filtering has its own filtering expression language.

            Currently, backend filtering must parse the same filtering language. If you write an expression that is not "valid" under the filtering language, then it will not be passed to the backend.

            This limitation will be removed in the future to allow you to write your own expression query language.

            In this example, we've written a Pandas backend for the filtering language. It supports `eq`, `<`, and `>`. For example, try:

            - Enter `eq Asia` in the "continent" column
            - Enter `> 5000` in the "gdpPercap" column
            - Enter `< 8`0 in the lifeExp column
        """),
        html_blockquote([
            dcc_markdown("""
                Note that unlike the front-end filtering, our backend filtering expression language doesn't require or support `num()` or wrapping items in double quotes `(")`. We will improve this syntax in the future, follow [dash-table#169](https://github.com/plotly/dash-table/issues/169) for more.
            """)
        ]),
        source"backend_paging_filtering",
        layout"backend_paging_filtering",
        html_h3("Backend Paging with Filtering and Multi-Column Sorting"),
        source"backend_paging_multi_coilumn",
        layout"backend_paging_multi_coilumn",
        html_h3("Connecting Backend Paging with a Graph"),
        dcc_markdown("""
            This final example ties it all together: the graph component displays the current page of the `data`.
        """),
        source"backend_paging_graph",
        layout"backend_paging_graph"
    end
end