using Dash, DashBio

app = dash()
sequences = [Dict(
  "sequence" => "AUGGGCCCGGGCCCAAUGGGCCCGGGCCCA",
  "structure" => ".((((((())))))).((((((()))))))"
)]

app.layout = dashbio_fornacontainer(
  sequences=sequences,
  allowPanningAndZooming=false
)
run_server(app, "0.0.0.0", debug=true)