@doc_chapter "/datatable/filtering" begin
    @example advanced_filter "advanced_filter.jl"
    @example backend_filtering "backend_filtering.jl"
    @example column_datatype "column_datatype.jl"
    @example default "default.jl"
    @layout html_div() do
        html_h1("DataTable Filtering"),
        dcc_markdown("""
            As discussed in the [interactivity chapter](https://dash-julia.plotly.com/dash_data_table/interactivity), `DataTable` includes filtering capabilities. Set `filter_action='native'` for clientside (front-end) filtering or `filter_action='custom'` to perform your own filtering in Python.

            `filter_action='native'` will work well up to `10,000-100,000` rows. After which, you may want to use `filter_action='custom'` so that your app sends less data over the network into the browser.
        """),
        source"default",
        layout"default",
        dcc_markdown("""
            Notes:

            - As above, we recommend fixing column widths with filtering. Otherwise, the column widths will grow or shrink depending on how wide the data is within the columns.
            - There is a bug with `fixed_rows` that prevents horizontal scroll when no filter results are returned. Until this bug is fixed, we recommend avoiding `fixed_rows`. For updates, see [plotly/dash-table#746](https://github.com/plotly/dash-table/issues/746)
            - The default filtering behavior will depend on the data type of the column (see below). Data types are not inferred, so you have to set them manually.
            The example below **determines the datatype of the column automatically with DataFrame**:
        """),
        source"column_datatype",
        layout"column_datatype",
        html_h3("Filtering Operators"),
        dcc_markdown("""
            The filtering syntax is data-type specific. Data types are not inferred, they must be set manually. If a type is not specified, then we assume it is a string (text).

            **Text & String Filtering**

            * `United`
            * `= United`
            * `United States`
            * `"United States"`
            * `= United States`
            * `= "United States"`
            * `contains United`
            * `> United`
            * `>= United`
            * `< United`
            * `<= United`
            By default, the columns with the `"text"` type use the contains operator. So, searching United is the same as `contains United`

            For legacy purposes, eq can also be substituted for `=`.

            `>, >=, <, and <=` compare strings in dictionary order, with numbers and most symbols coming before letters, and uppercase coming before lowercase.

            If you have quotes in the string, you can use a different quote, or escape the quote character. So `eq 'Say "Yes!"' and ="Say \"Yes!\""` are the same.

            **Numeric Filtering**

            * `43.828`
            * `= 43.828`
            * `> 43.828`
            * `>= 43.828`
            * `< 43.828`
            * `<= 43.828`

            By default, columns with the `numeric` type use the `=` operator. So, searching `43.828` is the same as `= 43.828`.

            **Datetime Filtering**

            * `2020`
            * `2020-01`
            * `2020-01-01`
            * `2020-01-01 04:01`
            * `2020-01-01 04:01:10`
            * `datestartswith 2020`
            * `datestartswith 2020-01`
            * `datestartswith 2020-01-01`
            * `datestartswith 2020-01-01 04:01`
            * `datestartswith 2020-01-01 04:01:10`
            * `> 2020-01`
            * `> 2020-01-20`
            * `>= 2020-01`
            * `>= 2020-01-20`
            * `< 2020-01`
            * `< 2020-01-20`
            * `<= 2020-01`
            * `<= 2020-01-20`
        """),
        html_h3("Operators"),
        dcc_markdown("""
        Many operators have two forms: a symbol `(=)` and a word `(eq)` that can be used interchangeably.
        """),
        html_table([
            html_tr([
                html_td([
                    dcc_markdown("""
                        ** = eq **

                        Default operator for number columns
                    """)
                ]),
                html_td([
                    dcc_markdown("""
                        Are the two numbers equal? Regardless of type, will first try to convert both sides to numbers and compare the numbers. If either cannot be converted to a number, looks for an exact match.
                    """)
                ])
            ]),
            html_tr([
                html_td([
                    dcc_markdown("""
                        **contains**

                        Default operator for `text` and any columns
                    """)
                ]),
                html_td([
                    dcc_markdown("""
                    Does the text value contain the requested substring? May match the beginning, end, or anywhere in the middle. The match is case-sensitive and exact.
                    """)
                ])
            ]),
            html_tr([
                html_td([
                    dcc_markdown("""
                        **datestartswith**

                        Default operator for `DateTime` columns
                    """)
                ]),
                html_td([
                    dcc_markdown("""
                    Does the datetime start with the given parts? Enter a partial datetime, this will match any date that has at least as much precision and starts with the same pieces. For example, `datestartswith` `'2018-03-01'` will match `'2018-03-01 12:59'` but not `'2018-03'` even though we interpret `'2018-03-01'` and `'2018-03'` both to mean the first instant of March, 2018.
                    """)
                ])
            ]),
            html_tr([
                html_td([
                    dcc_markdown("""
                        ** > gt   < lt **
                        ** >= ge   <= le **
                        ** != ne **
                    """)
                ]),
                html_td([
                    dcc_markdown("""
                    Comparison: greater than, less than, greater or equal, less or equal, and not equal. Two strings compare by their dictionary order, with numbers and most symbols coming before letters, and uppercase coming before lowercase.
                    """)
                ])
            ])
        ]),
        html_h3("Back-end Filtering"),
        dcc_markdown("""
            For large dataframes, you can perform the filtering in Julia instead of the default clientside filtering. You can find more information on performing operations in Julia in the [Julia Callbacks chapter](https://dash-julia.plotly.com/basic-callbacks).

            The syntax is (now) the same as front-end filtering, but it's up to the developer to implement the logic to apply these filters on the Python side. In the future we may accept any filter strings, to allow you to write your own expression query language.
        """),
        source"backend_filtering",
        layout"backend_filtering",
        html_h3("Advanced filter usage"),
        dcc_markdown("""
            Filter queries can be as simple or as complicated as you want them to be. When something is typed into a column filter, it is automatically converted to a filter query on that column only.
        """),
        source"advanced_filter",
        layout"advanced_filter",
        dcc_markdown("""
            The `filter_query` property is written to when the user filters the data by using the column filters. For example, if a user types ge `100000000` in the pop column filter, and Asia in the `continent` column filter, `filter_query` will look like this:
        """),
        html_blockquote([
            dcc_markdown("""
             ```
             {pop} ge 100000000 && {continent} contains "Asia"
             ```
            """)
        ]),
        dcc_markdown("""
            Try typing those values into the column filters in the app above, and ensure that the `"Read filter_query"` option is selected.

            The `filter_query` property can also be written to. This might be useful when performing more complex filtering, like if you want to filter a column based on two (or more) conditions. For instance, say that we want countries with a population greater than 100 million, but less than 500 million. Then our `filter_query` would be as follows:
        """),
        html_blockquote([
            dcc_markdown("""
             ```
             {pop} ge 100000000 and {pop} le 500000000
             ```
            """)
        ]),
        dcc_markdown("""
            Select the "Write to filter_query" option in the app above, and try it out by copying and pasting the filter query above into the input box.

            Say that we now want to get a bit more advanced, and cross-filter between columns; for instance, we only want the results that are located in Asia. Now, our filter query becomes:
        """),
        html_blockquote([
            dcc_markdown("""
             ```
             {pop} ge 100000000 and {pop} le 500000000 and {continent} eq "Asia"
             ```
            """)
        ]),
        dcc_markdown("""
            We can make the expression even more complex. For example, let's say we want all of those countries with the populations that fall within our boundaries and that are in Asia, but for some reason we also want to include Singapore. This results in a filter query that is a little more long-winded:
        """),
        html_blockquote([
            dcc_markdown("""
             ```
             (({pop} ge 100000000 and {pop} le 500000000) or {country} eq "Singapore") and {continent} eq "Asia"
             ```
            """)
        ]),
        dcc_markdown("""
            Note that we've grouped expressions together using parentheses. This is part of the filtering syntax. Just as is true in mathematical expressions, the expressions in the innermost parentheses are evaluated first.
        """),
        html_h3("Symbol-based versus letter-based operators"),
        dcc_markdown("""
            An important thing to notice is that the two types of relational operators that can be used in the column filters (symbol-based, like `>=`, and letter-based, like ge) are not converted into one another when `filter_query` is being constructed from the values in the column filters. Therefore, if using `filter_query` to implement backend filtering, it's necessary to take both of these forms of the `"greater-than-or-equal-to"` operator into account when parsing the query string (or ensure that the user only uses the ones that the backend can parse).

            However, in the case of the logical operator `and/&&`, when the table is constructing the query string, the symbol-based representation will always be used.
        """),
        html_h3("Derived filter query structure"),
        dcc_markdown("""
            The `derived_filter_query_structure` prop is a dictionary representation of the query syntax tree. You can use the value of this property to implement backend filtering.

            For a query that describes a relationship between two values, there are three components: the operation, the left-hand side, and the right-hand side. For instance, take the following query:
        """),
        html_blockquote([
            dcc_markdown("""
             ```
             {pop} ge 100000000
             ```
            """)
        ]),
        dcc_markdown("""
            The operation here is ge (i.e., `>=`), the left-hand side is the field pop (corresponding to the column pop), and the right-hand side is the `value` `100000000`. As the queries become increasingly complex, so do the query structures. Try it out by expanding the "Derived filter query structure" in the example app above.

            Note that for all operators, there are two keys `subType` and `value` that correspond to, respectively, the symbol-based representation and the originally inputted representation of the operator. So, in the case of the query above, `subType` will be `>=` and value will be ge; if our query string were `{pop} >= 100000000` instead, both `subType` and `value` will be `>=`.
        """)

    end
end