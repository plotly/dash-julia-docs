using Dash, DashHtmlComponents, DashCoreComponents

app = dash()

app.layout = dcc_input(
  placeholder = "Enter a value...",
  type = "text",
  value = "",
)

run_server(app, "0.0.0.0", debug=true)