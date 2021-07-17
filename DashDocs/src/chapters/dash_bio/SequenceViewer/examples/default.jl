using Dash, DashBio, DashBioUtils, DashHtmlComponents
using StringEncodings, HTTP, JSON

external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]

app = dash(external_stylesheets=external_stylesheets)

fasta_str  ="https://raw.githubusercontent.com/plotly/dash-bio-docs-files/master/sequence_viewer_P01308.fasta"

seq  = DashBioUtils.read_fasta(fasta_str , is_datafile = false)[1]["sequence"]

app.layout =  html_div([
  dashbio_sequenceviewer(
      id="my-sequence-viewer",
      sequence=seq
  ),
  html_div(id="sequence-viewer-output")
])

callback!(app,
    Output("sequence-viewer-output", "children"),
    [Input("my-sequence-viewer", "mouseSelection")]
) do value
    if value isa Nothing || length(value) == 0
        return "There is no mouse selection."
    end
    
    return "The mouse selection is $(value.selection)."
end

run_server(app, "0.0.0.0", debug=true)