using Dash, DashBio
using StringEncodings, HTTP, JSON

app = dash()

model_data = HTTP.request("GET", "https://raw.githubusercontent.com/plotly/dash-bio-docs-files/master/mol3d/model_data.js")
styles_data  = HTTP.request("GET", "https://raw.githubusercontent.com/plotly/dash-bio-docs-files/master/mol3d/styles_data.js")

model_data = JSON.parse(decode(model_data.body, "UTF-8"))
styles_data = JSON.parse(decode(styles_data.body, "UTF-8"))


app.layout = dashbio_molecule3dviewer(
  styles=styles_data,
  modelData=model_data,
  labels = [
          Dict("text" => "Residue Name: GLY1", "fontColor" => "red", "font" => "Courier New, monospace"),
          Dict("text" => "Residue Chain: A", "position" => Dict("x" =>15.407, "y" => -8.432, "z" => 6.573))
      ],
)

run_server(app, "0.0.0.0", debug=true)