using Dash, DashBio, DashBioUtils
using StringEncodings, HTTP, JSON

app = dash()

fasta_str  ="https://raw.githubusercontent.com/plotly/dash-bio-docs-files/master/sequence_viewer_P01308.fasta"

seq  = DashBioUtils.read_fasta(fasta_str , is_datafile = false)[1]["sequence"]

app.layout =  dashbio_sequenceviewer(
  id="sequence-viewer-lines",
  sequence=seq,
  showLineNumbers=false,
  charsPerLine=20
) 

run_server(app, "0.0.0.0", debug=true)