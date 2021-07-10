using Dash, DashBio, DashBioUtils
using StringEncodings, HTTP, JSON

data = "https://raw.githubusercontent.com/plotly/dash-bio-docs-files/master/speck_methane.xyz"

data = DashBioUtils.read_xyz(data, is_datafile=false)

app = dash()

app.layout = dashbio_speck(
  data=data,
  scrollZoom=true
)  

run_server(app, "0.0.0.0", debug=true)