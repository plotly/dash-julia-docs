using Dash, DashBio

app = dash()

app.layout = dashbio_igv(
  id="locus-igv",
  genome="ce11",
  locus=["chrV", "chrII"]
)  

run_server(app, "0.0.0.0", debug=true)