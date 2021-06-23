using Dash, DashBio
using StringEncodings, HTTP, JSON

req = HTTP.request("GET", "https://raw.githubusercontent.com/plotly/dash-bio-docs-files/master/speck_methane.xyz")
data = decode(req.body, "UTF-8")

mdata = JSON.parse(data)


app = dash()


app.layout = dashbio_speck(
  id="my-dashbio-speck",
  view=Dict("resolution" => 600),
  data=data
)

run_server(app, "0.0.0.0", debug=true)