using Dash, DashHtmlComponents, DashCoreComponents

app = dash()

app.layout = html_div() do
    dcc_markdown("""
    # This is an <h1> tag

    ## This is an <h2> tag
    
    ###### This is an <h6> tag
    """)

end

run_server(app, "0.0.0.0", debug=true)
