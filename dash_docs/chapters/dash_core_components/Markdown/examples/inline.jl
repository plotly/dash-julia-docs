using Dash, DashHtmlComponents, DashCoreComponents

app = dash()

app.layout = html_div() do
    dcc_markdown("""
    Inline code snippet: `True`

    Block code snippet:
    ```julia
    using Dash, DashHtmlComponents, DashCoreComponents

    app = dash()
    ```
    """)

end

run_server(app, "0.0.0.0", debug=true)
