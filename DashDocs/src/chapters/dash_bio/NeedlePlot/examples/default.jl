using Dash, DashBio, DashHtmlComponents, DashCoreComponents
using StringEncodings, HTTP, JSON

external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]
app = dash(external_stylesheets=external_stylesheets)

req = HTTP.request("GET", "https://raw.githubusercontent.com/plotly/dash-bio-docs-files/master/needle_PIK3CA.json")
data = decode(req.body, "UTF-8")

mdata = JSON.parse(data)

app.layout = html_div([
  "Show or hide range slider",
  dcc_dropdown(
      id="needleplot-rangeslider",
      options=[
          Dict("label" => "Show", "value" => 1),
          Dict("label" => "Hide", "value" => 0)
      ],
      clearable=false,
      multi=false,
      value=1,
      style=Dict("width" => "400px")
  ),
  dashbio_needleplot(
      id="my-dashbio-needleplot",
      mutationData=mdata
  )
])

callback!(app,
    Output("my-dashbio-needleplot", "rangeSlider"),
    [Input("needleplot-rangeslider", "value")]
) do show_rangeslider 
    return (show_rangeslider == 1) ? true : false
end

run_server(app, "0.0.0.0", debug=true)