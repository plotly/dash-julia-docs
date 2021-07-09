using Dash, DashHtmlComponents, DashCoreComponents

app = dash()

app.layout = html_div() do
    dcc_markdown("""
    *This text will be italic*
    _This will also be italic_
    **This text will be bold**
    __This will also be bold__
    _You **can** combine them_
    """)

end

run_server(app, "0.0.0.0", debug=true)