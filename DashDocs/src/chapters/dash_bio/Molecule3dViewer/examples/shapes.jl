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
  shapes = [
      Dict(
          "type" => "Sphere",
          "center" => Dict("x" =>0,"y" =>0,"z" =>0),
          "radius" => 3.0,
          "color" => "blue",
          "opacity" => 1
      ),
      Dict(
          "type" => "Arrow",
          "start" => Dict("x" =>40, "y" =>20.0, "z" =>0.0),
          "end" => Dict("x" =>20.0, "y" =>10.0, "z" =>0.0),
          "radius" => 1.0,
          "radiusRadio" =>0.5,
          "mid" =>1.0,
          "color" => "red",
          "opacity" => 1
      ),
      Dict(
          "type" => "Cylinder",
          "start" => Dict("x" => 10.0, "y" => -30.0, "z" => 0.0),
          "end" => Dict("x" => 20.0, "y" => -50.0, "z" => 0.0),
          "radius" => 1.0,
          "fromCap" => 1,
          "toCap" => 2,
          "color" => "green",
          "opacity" => 1
      )
  ],
)  

run_server(app, "0.0.0.0", debug=true)