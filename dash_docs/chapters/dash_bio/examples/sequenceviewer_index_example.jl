using Dash, DashBio, DashBioUtils

data ="https://raw.githubusercontent.com/plotly/dash-bio-docs-files/master/sequence_viewer_P01308.fasta"

seq  = DashBioUtils.read_fasta(data, is_datafile = false)[1]["sequence"]

app = dash()


app.layout =  dashbio_sequenceviewer(
  id="my-dashbio-sequenceviewer",
  sequence=seq
)

run_server(app, "0.0.0.0", debug=true)