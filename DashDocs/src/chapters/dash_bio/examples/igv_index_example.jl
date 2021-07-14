using Dash, DashBio

app = dash()


app.layout = dashbio_igv(
  id="my-dashbio-igv",
  genome="ce11",
  minimumBases=100,
  locus="chrV"
)

run_server(app, "0.0.0.0", debug=true)