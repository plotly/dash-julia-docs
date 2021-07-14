using Dash, DashBio

app = dash()
sequences = [Dict(
  "sequence" => "AUGGGCCCGGGCCCAAUGGGCCCGGGCCCA",
  "structure" => ".((((((())))))).((((((()))))))"
)]

app.layout = dashbio_fornacontainer(
  sequences=sequences,
  height=300,
  width=500
)
run_server(app, "0.0.0.0", debug=true)