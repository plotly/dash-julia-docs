using Dash, DashBio, DashHtmlComponents
using StringEncodings, HTTP, JSON

external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]
app = dash(external_stylesheets=external_stylesheets)

model_data = HTTP.request("GET", "https://raw.githubusercontent.com/plotly/dash-bio-docs-files/master/mol3d/model_data.js")
styles_data  = HTTP.request("GET", "https://raw.githubusercontent.com/plotly/dash-bio-docs-files/master/mol3d/styles_data.js")

model_data = JSON.parse(decode(model_data.body, "UTF-8"))
styles_data = JSON.parse(decode(styles_data.body, "UTF-8"))


app.layout = html_div([
  dashbio_molecule3dviewer(
      id="my-dashbio-molecule3d",
      styles=styles_data,
      modelData=model_data
  ),
  "Selection data",
  html_hr(),
  html_div(id="molecule3d-output")
])

callback!(app,
    Output("molecule3d-output", "children"),
    [Input("my-dashbio-molecule3d", "selectedAtomIds")]
) do atom_ids
    if atom_ids isa Nothing || length(atom_ids) == 0
        return "No atom has been selected. Click somewhere on the molecular or structure to select an atom."
    end
    return [html_div([
        html_div("Element: $(model_data["atoms"][atm]["element"])"),
        html_div("Chain: $(model_data["atoms"][atm]["chain"])"),
        html_div("Residue name: $(model_data["atoms"][atm]["residue_name"])"),
        html_br()
    ]) for atm in atom_ids]
end

run_server(app, "0.0.0.0", debug=true)