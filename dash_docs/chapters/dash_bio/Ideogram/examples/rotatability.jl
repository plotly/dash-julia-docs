using Dash, DashBio

app = dash()


app.layout = dashbio_ideogram(
  id="ideogram-rotate",
  rotatable=false
)  

run_server(app, "0.0.0.0", debug=true)