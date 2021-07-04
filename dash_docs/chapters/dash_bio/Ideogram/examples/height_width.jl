using Dash, DashBio

app = dash()


app.layout = dashbio_ideogram(
  id="ideogram-size",
  chrHeight=800,
  chrWidth=100
)  

run_server(app, "0.0.0.0", debug=true)