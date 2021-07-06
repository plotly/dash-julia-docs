using Dash, DashBio, DashHtmlComponents, DashCoreComponents
using StringEncodings, HTTP, JSON

app = dash()

req = HTTP.request("GET", "https://raw.githubusercontent.com/plotly/dash-bio-docs-files/master/needle_PIK3CA.json")
data = decode(req.body, "UTF-8")

mdata = JSON.parse(data)

app.layout = dashbio_needleplot(
  mutationData=mdata,
  domainStyle=Dict(
      "displayMinorDomains" => true,
      "domainColor" => ["#FFDD00", "#00FFDD", "#0F0F0F", "#D3D3D3"]
  )
)  

run_server(app, "0.0.0.0", debug=true)