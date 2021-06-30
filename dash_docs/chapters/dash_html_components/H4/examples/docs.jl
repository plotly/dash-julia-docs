using Dash, DashCoreComponents

app = dash()

app.layout = dcc_markdown(
  """
  
  """
)

run_server(app, "0.0.0.0", debug=true)