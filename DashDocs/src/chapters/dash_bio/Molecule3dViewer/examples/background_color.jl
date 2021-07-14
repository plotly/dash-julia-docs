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
  backgroundColor="#FF0000",
  backgroundOpacity=0.2
)  

run_server(app, "0.0.0.0", debug=true)