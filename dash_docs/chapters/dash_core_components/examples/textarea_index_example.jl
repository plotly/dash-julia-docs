using Dash, DashHtmlComponents, DashCoreComponents

app = dash()

app.layout = dcc_textarea(
  placeholder = "Enter a value...",
  value="This is a TextArea component",
  style=Dict("width" => "100%")
)

run_server(app, "0.0.0.0", debug=true)