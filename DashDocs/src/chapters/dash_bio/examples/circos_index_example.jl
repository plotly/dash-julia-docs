using Dash, DashBio
using StringEncodings, HTTP, JSON

req = HTTP.request("GET", "https://raw.githubusercontent.com/plotly/dash-bio-docs-files/master/circos_graph_data.json")
data = decode(req.body, "UTF-8")

circos_graph_data = JSON.parse(data)

app = dash()

app.layout = dashbio_circos(
  id="my-dashbio-circos",
  layout=circos_graph_data["GRCh37"],
  tracks=[
    Dict(
      "type" => "CHORDS",
      "data" => circos_graph_data["chords"],
      "opacity" => 0.7,
      "color" => Dict("name" => "color"),
      "config" => Dict(
          "tooltipContent" => Dict(
          "source" => "source",
          "sourceID" => "id",
          "target" => "target",
          "targetID" => "id",
          "targetEnd" => "end"
        )
      )
    )
  ]
)

run_server(app, "0.0.0.0", debug=true)

