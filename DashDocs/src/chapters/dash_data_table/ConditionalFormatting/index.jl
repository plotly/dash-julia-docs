@doc_chapter "/dash_data_table/conditional_formatting" begin
    @example default "default.jl"
    @example alternative "alternative.jl"
    @example databar_wo_text "databar_wo_text.jl"
    @example display_data_bar "display_data_bar.jl"
    # @example display_special_nan "display_special_nan.jl"
    @example display_special_nan1 "display_special_nan1.jl"
    @example diverging_databars "diverging_databars.jl"
    @example filtering_max "filtering_max.jl"
    @example filtering_min "filtering_min.jl"
    @example highlight_bottom_10 "highlight_bottom_10.jl"
    @example highlight_color_scale "highlight_color_scale.jl"
    @example highlight_colorscale_single "highlight_colorscale_single.jl"
    # @example highlight_dates "highlight_dates.jl"
    @example highlight_empty "highlight_empty.jl"
    @example highlight_max_val "highlight_max_val.jl"
    @example highlight_range "highlight_range.jl"
    @example highlight_range1 "highlight_range1.jl"
    @example highlight_text_equals "highlight_text_equals.jl"
    @example highlight_text "highlight_text.jl"
    @example highlight_three "highlight_three.jl"
    @example highlight_top_10 "highlight_top_10.jl"
    @example higlight_above_below_avg "higlight_above_below_avg.jl"
    @example higlight_above_below_avgtbl "higlight_above_below_avgtbl.jl"
    @example max_row_val "max_row_val.jl"
    @example special "special.jl"
    @example top_two_row "top_two_row.jl"
    @layout html_div() do
        html_h1("Conditional Formatting"),
        dcc_markdown("""
            Conditional formatting is provided through the `style_data_conditional` property. The if keyword provides a set of conditional formatting statements and the rest of the keywords are camelCased CSS properties.

            The if syntax supports several operators, `row_index`, `column_id`, `filter_query`, `column_type`, `column_editable`, and `state`.

            `filter_query` is the most flexible option when dealing with data.

            Here is an example of all operators:
        """),
        source"default",
        layout"default",
        dcc_markdown("""
            Notes:

            * filter_query supports different operators depending on the data type of the column:
                * `=, >, >=, <, <=,` and `contains` are supported by all data types (`numeric`, `text`, `datetime`, and `any`)
                * With `contains`, the right-hand-side needs to be a string, so `{Date} contains "01"` will work but `{Date} contains 1` will not.
                * `datestartswith` is supported by `datetime`
                * `is nil` is supported by all data types
                * `is blank` is supported by all data types
            * A column's default data type is `any`
            * column_type refers to the data type of the column (`numeric`, `text`, `datetime`, and `any`)
            * `column_editable` can be equal to True or False (new in Dash 1.12.0)
            * `state` can be equal to `'active'` or `'selected'` (new in Dash 1.12.0). Use this to change the default pink background and border colors for selected and active cells.
            * `row_index` is absolute - if you filter or sort your table, the 5th row will remain highlighted. Try sorting the columns and notice how "San Francisco" remains highlighted but "London" does not.
            * `column_id`, `row_index`, and `header_index` can be equal to a scalar (as above) or a list of values. For example, 'column_id': `['Region', 'Pressure']` is valid (new in Dash 1.12.0). DataTable filtering & conditional formatting performs faster when specified a list of values vs a list of separate if blocks.
            * Note `'filter_query': '{Delivery} > {Date}'`: Filter queries can compare columns to each other!
            * `id` is a special hidden column that can be used as an alternative to `row_index` for highlighting data by index. Since each row has a unique id, the conditional formatting associated with this id will remain associated with that data after sorting and filtering.
            * `RebeccaPurple`, `hotpink`, `DodgerBlue`... These are named CSS colors. We recommend avoiding the common color names like red, blue, green as they look very outdated. For other color suggestions, see [http://clrs.cc/](http://clrs.cc/).
            * To highlight a row, omit `column_id`. To highlight a particular cell, include `column_id`.
            * `style_cell_conditional` (all cells, including headers), `style_header_conditional` (header cells), `style_filter_conditional` (filter input boxes) are alternative keywords that can be used for filtering other parts of the table.
            * Limitation - If the table is editable, then the maximum value could change if the user edits the table. Since this example hard codes the maximum value in the filter expression, the highlighting value would no longer be highlighted. As a workaround, you could update `style_data_conditional` via a callback whenever `derived_virtual_data` changes. This limitation applies for any conditional formatting with hardcoded numbers computed from an expression in Python (including many of the examples below!). See [plotly/dash-table#755](https://github.com/plotly/dash-table/issues/755) for updates.
        """),
        html_h3("Alternative Highlighting Styles"),
        dcc_markdown("""
            Instead of highlighting the background cell, you can change the color of the text, bold the text, add underlines, or style it using any other css property.
        """),
        source"alternative",
        layout"alternative",
        html_h3("Special characters like emoji, stars, checkmarks, circles"),
        dcc_markdown("""
            You can copy and paste emoji unicode characters directly into your code. We recommend copying values from emojipedia, e.g. [https://emojipedia.org/star/](https://emojipedia.org/star/).

            New unicode emoji characters are released every year and may not be available in the character sets of your audience's machines. The appearance of these icons differs on most operating systems.

            You may need to place `# -*- coding: utf-8 -*-` at the top of your code.
        """),
        source"special",
        layout"special",
        html_h3("Filtering & Conditional Formatting Recipes"),
        html_h4("Highlighting the max value in a column"),
        source"filtering_max",
        layout"filtering_max",
        html_h4("Highlighting a row with the min value"),
        source"filtering_min",
        layout"filtering_min",
        html_h4("Highlighting the top three or bottom three values in a column"),
        source"highlight_three",
        layout"highlight_three",
        html_h4("Highlighting the max value in every row"),
        source"max_row_val",
        layout"max_row_val",
        html_h4("Highlighting the top two values in a row"),
        source"top_two_row",
        layout"top_two_row",
        html_h4("Highlighting the maximum value in the table"),
        source"highlight_max_val",
        layout"highlight_max_val",
        html_h4("Highlighting a range of values"),
        source"highlight_range",
        layout"highlight_range",
        source"highlight_range1",
        layout"highlight_range1",
        dcc_markdown("""
            Let's break down {{{col}}}. We want the final expression to look something like {2017} > 5 & {2017} < 10 where 2017 is the name of the column. Since we're using .format(), we need to escape the brackets, so {2017} would be {{2017}}. Then, we need to replace 2017 with {col} for the find-and-replace, so {{2017}} becomes {{{col}}}.format(col=col)
        """),
        html_h4("Highlighting top 10% or bottom 10% of values by column"),
        source"highlight_top_10",
        layout"highlight_top_10",
        source"highlight_bottom_10",
        layout"highlight_bottom_10",
        html_h4("Highlighting values above average and below average"),
        dcc_markdown("""
        Here, the highlighting is done per column
        """),
        source"higlight_above_below_avg",
        layout"higlight_above_below_avg",
        dcc_markdown("""
            Here, the highlighting is done per table
        """),
        source"higlight_above_below_avgtbl",
        layout"higlight_above_below_avgtbl",
        html_h4("Highlighting None, NaN, or empty string values"),
        dcc_markdown("""
            Three filter queries help with empty or blank values:

                * {my_column} is nil will match nothing values
                * {my_column} is blank will match None values and empty strings
                * {my_column} = "" will match empty strings
        """)
        source"highlight_empty",
        layout"highlight_empty",
        # html_h4("Displaying special values for NaN or None values"),
        # source"display_special_nan",
        # layout"display_special_nan",
        dcc_markdown("""
        An alternative method would be to fill in e.g. 'N/A' in the data before rendering:
        """),
        source"display_special_nan1",
        layout"display_special_nan1",
        dcc_markdown("""
            Limitation: If your table is editable, then if a user deletes the contents of a cell, 'N/A' will no longer be displayed. This is unlike the example with Format where the DataTable will automatically display N/A for any empty cells, even after editing.
        """),
        html_h4("Highlighting text that contains a value"),
        source"highlight_text",
        layout"highlight_text",
        html_h4("Highlighting text that equals a value"),
        source"highlight_text_equals",
        layout"highlight_text_equals",
        html_h4("Highlighting cells by value with a colorscale like a heatmap"),
        dcc_markdown("""
        This recipe shades cells with style_data_conditional and creates a legend with HTML components. You'll need to Pkg.add("Color") to get the colorscales.
        """)
        source"highlight_color_scale",
        layout"highlight_color_scale",
        html_h4("Highlighting with a colorscale on a single column"),
        source"highlight_colorscale_single",
        layout"highlight_colorscale_single",
        html_h4("Displaying data bars"),
        dcc_markdown("""
            These recipes display a creative use of background linear-gradient colors to display horizontal bar charts within the table. Your mileage may vary! Feel free to modify these recipes for your own use.
        """),
        source"display_data_bar",
        layout"display_data_bar",
        html_h4("Data bars without text"),
        dcc_markdown("""
        Display the data bars without text by creating a new column and making the text transparent.
        """),
        source"databar_wo_text",
        layout"databar_wo_text",
        html_h4("Diverging data bars"),
        dcc_markdown("""
            The `data_bars_diverging` function splits up the data into two quadrants by the midpoint. Alternative representations of data bars may split up the data by positive and negative numbers or by the average values. Your mileage may vary! Feel free to modify the data_bars_diverging function to your own visualization needs. If you create something new, please share your work on the [Dash Community Forum](https://community.plotly.com/tag/show-and-tell).
        """),
        source"diverging_databars",
        layout"diverging_databars"
        # html_h4("Highlighting dates"),
        # source"highlight_dates",
        # layout"highlight_dates"
    end
end