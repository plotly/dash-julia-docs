using Dash, DashBio, DashHtmlComponents
using StringEncodings, HTTP, JSON

req = HTTP.request("GET", "https://raw.githubusercontent.com/plotly/dash-bio-docs-files/master/mol2d_buckminsterfullerene.json")
data = decode(req.body, "UTF-8")

model_data = JSON.parse(data)

external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]

app = dash(external_stylesheets=external_stylesheets)


app.layout = html_div([
  dashbio_molecule2dviewer(
      id="my-dashbio-molecule2d",
      modelData=model_data
  ),
  html_hr(),
  html_div(id="molecule2d-output")
])

callback!(app,
    Output("molecule2d-output", "children"),
    [Input("my-dashbio-molecule2d", "selectedAtomIds")]
) do ids
    if ids isa Nothing || length(ids) == 0
        return "No atom has been selected. Select atoms by clicking on them."
    end
    return "Selected atom IDs: $(join([string(i) for i in ids],","))"
end
run_server(app, "0.0.0.0", debug=true)