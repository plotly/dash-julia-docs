using Dash, DashHtmlComponents, DashCoreComponents

app = dash()

app.layout = html_div() do
    dcc_markdown("""
    >
    > Block quotes are used to highlight text.
    >
    """)

end

run_server(app, "0.0.0.0", debug=true)
