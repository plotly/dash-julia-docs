using Dash, DashBio

app = dash()


app.layout = dashbio_ideogram(
  id="my-dashbio-ideogram",
  chrHeight=250
)

run_server(app, "0.0.0.0", debug=true)