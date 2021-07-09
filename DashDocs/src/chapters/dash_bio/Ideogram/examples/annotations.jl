using Dash, DashBio

app = dash()


app.layout = dashbio_ideogram(
  id="ideogram-annotations",
  chromosomes=["X", "Y"],
  annotationsPath="https://eweitz.github.io/ideogram/data/annotations/SRR562646.json"
)  

run_server(app, "0.0.0.0", debug=true)