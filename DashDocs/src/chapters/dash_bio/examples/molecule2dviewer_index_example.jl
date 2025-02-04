using Dash, DashBio
using StringEncodings, HTTP, JSON

req = HTTP.request("GET", "https://raw.githubusercontent.com/plotly/dash-bio-docs-files/master/mol2d_buckminsterfullerene.json")
data = decode(req.body, "UTF-8")

model_data = JSON.parse(data)


app = dash()


app.layout = dashbio_molecule2dviewer(
  id="my-dashbio-molecule2dviewer",
  modelData=model_data
)

run_server(app, "0.0.0.0", debug=true)