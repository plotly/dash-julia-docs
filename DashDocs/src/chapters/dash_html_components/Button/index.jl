@doc_chapter "/dash_html_components/button" begin

    @example button_basic "button_basic.jl"
    @example button_ctx "button_ctx.jl"
    
    
    @layout html_div() do

    html_h1("Button Examples and Reference"),

    html_h3("Button Basic Example"),

    dcc_markdown("""
    An example of a default button without any extra properties
     and `n_clicks` in the callback. `n_clicks` is an integer that
      represents that number of times the button has been clicked.
       Note that the original value is `None`.
    """),

    source"button_basic",
    layout"button_basic",

    html_h3("Determining which Button Changed with callback_context"),

    dcc_markdown("""
    This example utilizes the `callback_context` property,
    to determine which input was changed.
    """),
    source"button_ctx",
    layout"button_ctx",

    html_h3("Reference & Documentation"),

    dcc_markdown(
        """
        Access this documentation in your Julia REPL with:
        ```    
            help? html_button
        ```
        Our recommended IDE for writing Dash apps is Dash Enterprise's 
        [Data Science Workspaces](https://plotly.com/dash/workspaces/),
        which has typeahead support for Dash Component Properties. Find out
        if your company is using [Dash Enterprise](https://go.plotly.com/company-lookup).
        """
    ),    
    dcc_markdown(string(@doc html_button))
end

end
