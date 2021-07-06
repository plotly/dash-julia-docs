using Dash, DashBio

app = dash()

app.layout = dashbio_igv(
  id="bases-igv",
  genome="ce11",
  minimumBases="10"
)  

run_server(app, "0.0.0.0", debug=true)