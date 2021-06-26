using Dash, DashBio, DashBioUtils

data_path = "https://raw.githubusercontent.com/plotly/dash-bio-docs-files/master/"


app = dash()
app.layout = dashbio_nglmoleculeviewer(
  id="nglmoleculeviewer",
  data=[DashBioUtils.get_data(data_path, "1BNA", "red", reset_view=true, loc=false)]
)

run_server(app, "0.0.0.0", debug=true)