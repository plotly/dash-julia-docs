using Dash, DashBio
using StringEncodings, HTTP, JSON

app = dash()

model_data = HTTP.request("GET", "https://raw.githubusercontent.com/plotly/dash-bio-docs-files/master/mol3d/model_data.js")
styles_data  = HTTP.request("GET", "https://raw.githubusercontent.com/plotly/dash-bio-docs-files/master/mol3d/styles_data.js")

model_data = JSON.parse(decode(model_data.body, "UTF-8"))
styles_data = JSON.parse(decode(styles_data.body, "UTF-8"))

cube_data = HTTP.request("GET", "https://raw.githubusercontent.com/plotly/dash-bio-docs-files/master/mol3d/benzene-homo.cube")
cube_data = decode(cube_data.body, "UTF-8")

app.layout = dashbio_molecule3dviewer(
  styles=styles_data,
  modelData=model_data,
  selectionType="atom",
  orbital=Dict(
    "cube_file" => cube_data,
    "iso_val" => 0.1,
    "opacity" => 1.0,
    "positiveVolumetricColor" => "red",
    "negativeVolumetricColor" => "blue",
  )
)  

run_server(app, "0.0.0.0", debug=true)