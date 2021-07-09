using Dash, DashHtmlComponents

app = dash()

app.layout = html_ul(
  [
    html_li(id = "li1", html_a("hii")),
    html_li(id = "li2", value = "hi")
  ]
)
run_server(app, "0.0.0.0", debug=true)