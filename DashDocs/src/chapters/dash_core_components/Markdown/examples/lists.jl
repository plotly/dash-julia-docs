using Dash, DashHtmlComponents, DashCoreComponents

app = dash()

app.layout = html_div() do
    dcc_markdown("""
    * Item 1
    * Item 2
      * Item 2a
      * Item 2b
    """)

end

run_server(app, "0.0.0.0", debug=true)