using Dash, DashBio

app = dash()
sequences = [Dict(
  "sequence" => "AUGGGCCCGGGCCCAAUGGGCCCGGGCCCA",
  "structure" => ".((((((())))))).((((((()))))))"
)]

app.layout = dashbio_fornacontainer(
  sequences=sequences,
  nodeFillColor="pink"
)
run_server(app, "0.0.0.0", debug=true)