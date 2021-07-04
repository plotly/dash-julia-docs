using Dash, DashBio

app = dash()


app.layout = dashbio_ideogram(
  id="ideogram-brush",
  chromosomes=["X"],
  orientation="horizontal",
  brush="chrX:1-10000000"
)  
run_server(app, "0.0.0.0", debug=true)