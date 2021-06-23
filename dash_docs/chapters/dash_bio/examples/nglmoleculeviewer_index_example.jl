using Dash, DashBio
using StringEncodings, HTTP, JSON

data_path = "https://raw.githubusercontent.com/plotly/dash-bio-docs-files/master"
data = decode(req.body, "UTF-8")

mdata = JSON.parse(data)


app = dash()


app.layout =  dashbio.NglMoleculeViewer(
  id="my-dashbio-nglmoleculeviewer",
  data=[ngl_parser.get_data(data_path=data_path,
  pdb_id='1BNA',
  color='red',
  reset_view=False,
  local=False)]
)

run_server(app, "0.0.0.0", debug=true)