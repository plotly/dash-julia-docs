using Dash, DashBio

app = dash()


app.layout = dashbio_ideogram(
  id="ideogram-orientation",
  orientation="horizontal"
)  

run_server(app, "0.0.0.0", debug=true)