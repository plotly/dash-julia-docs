using Dash, DashBio
using StringEncodings, HTTP

req = HTTP.request("GET", "https://raw.githubusercontent.com/plotly/dash-bio-docs-files/master/alignment_viewer_p53.fasta")
data = decode(req.body, "UTF-8")

app = dash()

app.layout = dashbio_alignmentchart(
  data=data,
  showconservation=false,
  showgap=false
)


run_server(app, "0.0.0.0", debug=true)
