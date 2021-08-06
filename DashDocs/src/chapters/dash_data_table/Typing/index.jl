@doc_chapter "/dash_data_table/typing" begin
    # @example template_formating "template_formating.jl"
    @layout html_div() do
        html_h1("DataTable - Typing"),
        dcc_markdown("""
            This section will provide an overview of the DataTable's capabilities for typing, formatting, presentation and user input processing.
        """),
        html_h3("Typing"),
        dcc_markdown("""
            The DataTable provides support for per-column typing and allows for data validation and coercion behaviors to be configured on a per-column basis, so as to fit the needs of various usage scenarios.

            The following types are currently supported:
            
            - `numeric`: includes both integers and floats
            - `text`: string, sequence of characters
            - `datetime`: string in the form `'YYYY-MM-DD HH:MM:SS.ssssss'` or some truncation thereof
            - `any`: any type of data
            Additional types and specialized sub-types will be added in the future.
            
            By default, the column type is `any`.
        """),
        html_h3("Presentation"),
        dcc_markdown("""
            The DataTable provides multiple presentation schemes that can vary depending on the column's type.

            The following schemes are supported by all types:

            - `input`: a text input field
            - `dropdown`: see [DataTable Dropdowns](https://dash-julia.plotly.com/dash_data_table/dropdown) for more details
        """),
        html_h3("Markdown"),
        dcc_markdown("""
            The `markdown` presentation scheme allows for the raw value of each cell to be rendered as Markdown. This includes features of Markdown such as links, images, headers, lists, quotes, code blocks, and (yes, even) tables.

            The `markdown` scheme is only supported by text-type columns, and sorting and filtering behaviour occurs based on the raw value entered into the dataframe, instead of what gets rendered.
            
            e.g., if cell x has the raw value dash, and cell y has the raw value `[plotly](http://plotly.com)`, cell `y` will actually come before cell `x` when the table is sorted in ascending order, despite the fact that the displayed value of cell `y` is [plotly](https://plotly.com/).
            
            Markdown cells also support syntax highlighting. For more details, please see ["Syntax Highlighting With Markdown"](https://dash-julia.plotly.com/getting-started).
            
            By default, the column presentation is input.
        """),        
        html_h3("User Input Processing"),
        dcc_markdown("""
            The DataTable provides a configurable input processing system that can accept, reject or apply a default value when an input is provided. It can be configured to validate or coerce the input to make it fit with the expected data type. Specific validation cases can be configured on a per-column basis.

            See the table's reference on_change.action, on_change.failure and validation column nested properties for details.
        """),        
        html_h3("Formatting"),
        dcc_markdown("""
            The DataTable provides a configurable data formatting system that modifies how the data is presented to the user.

            The formatting can be configured by:

            * explicitly writing the column format nested property
            * using preconfigured `Format` Templates
            * using the general purpose `Format` object
            At the moment, only `type='numeric'` formatting can be configured.
        """),         
        html_h3("DataTable with template formatting"),
        dcc_markdown("""        
            This table contains two columns formatted by templates. The Variation `(%)` column is further configured by changing the sign behavior so that both the `"+"` and `"-"` sign are visible. Additional configuration changes can be chained after a `Format(...)` and a `FormatTemplate.<template>(...)` calls.
        """)

    end
end