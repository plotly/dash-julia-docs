using Dash, DashBio, DashBioUtils


data = "https://raw.githubusercontent.com/plotly/dash-bio-docs-files/master/speck_methane.xyz"

data = DashBioUtils.read_xyz(data, is_datafile=false)
app = dash()
app.layout = dashbio_speck(
  id="my-dashbio-speck",
  view=Dict("resolution" => 600),
  data=data
)

run_server(app, "0.0.0.0", debug=true)