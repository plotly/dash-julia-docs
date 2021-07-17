using Dash, DashBio, DashBioUtils, DashHtmlComponents
using StringEncodings, HTTP, JSON

external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]

data = "https://raw.githubusercontent.com/plotly/dash-bio-docs-files/master/speck_methane.xyz"

data = DashBioUtils.read_xyz(data, is_datafile=false)

app = dash(external_stylesheets=external_stylesheets)

app.layout = html_div([
  dcc_dropdown(
      id="speck-preset-views",
      options=[
          Dict("label" =>  "Default", "value" =>  "default"),
          Dict("label" =>  "Ball and stick", "value" =>  "stickball")
      ],
      value="default"
  ),
  dashbio_speck(
      id="my-speck",
      data=data
  ),
])


callback!(app,
  Output("my-speck", "presetView"),
  [Input("speck-preset-views", "value")]
) do preset_name
  return preset_name
end

run_server(app, "0.0.0.0", debug=true)