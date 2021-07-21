using Dash, DashBio, DashBioUtils
using StringEncodings, HTTP, JSON

data = "https://raw.githubusercontent.com/plotly/dash-bio-docs-files/master/speck_methane.xyz"

data = DashBioUtils.read_xyz(data, is_datafile=false)

app = dash()

app.layout = dashbio_speck(
  data=data,
  view=Dict(
      "resolution" =>  400,
      "ao" =>  0.1,
      "outline" =>  1,
      "atomScale" =>  0.25,
      "relativeAtomScale" =>  0.33,
      "bonds" =>  true
  )
)  

run_server(app, "0.0.0.0", debug=true)