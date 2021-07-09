using Dash, DashBio, DashHtmlComponents, DashCoreComponents
using StringEncodings, HTTP, JSON

app = dash()

req = HTTP.request("GET", "https://raw.githubusercontent.com/plotly/dash-bio-docs-files/master/needle_PIK3CA.json")
data = decode(req.body, "UTF-8")

mdata = JSON.parse(data)

app.layout = dashbio_needleplot(
  mutationData=mdata,
  needleStyle=Dict(
      "stemColor" => "#FF8888",
      "stemThickness" => 2,
      "stemConstHeight" => true,
      "headSize" => 10,
      "headColor" => ["#FFDD00", "#000000"]
  )
)  

run_server(app, "0.0.0.0", debug=true)