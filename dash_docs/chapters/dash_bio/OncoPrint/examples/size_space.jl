using Dash, DashBio
using StringEncodings, HTTP, JSON

req = HTTP.request("GET", "https://raw.githubusercontent.com/plotly/dash-bio-docs-files/master/oncoprint_dataset3.json")
data = decode(req.body, "UTF-8")

data = JSON.parse(data)


app = dash()


app.layout = dashbio_oncoprint(
  data=data,
  height=800,
  width=500,
  padding=0.25
)  

run_server(app, "0.0.0.0", debug=true)