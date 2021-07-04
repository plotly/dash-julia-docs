using Dash, DashBio, DashHtmlComponents
using StringEncodings, HTTP

req = HTTP.request("GET", "https://raw.githubusercontent.com/plotly/dash-bio-docs-files/master/alignment_viewer_p53.fasta")
data = decode(req.body, "UTF-8")

app = dash()

app.layout = html_div([
  dashbio_alignmentchart(
      id="my-alignment-viewer",
      data=data
  ),
  html_div(id="alignment-viewer-output")
])

callback!(app,
    Output("alignment-viewer-output", "children"),
    [Input("my-alignment-viewer", "eventDatum")]
) do value
    if value isa Nothing
        return "No data."
    end
    return string(value)
end

run_server(app, "0.0.0.0", debug=true)
