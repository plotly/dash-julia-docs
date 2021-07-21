using Dash, DashBio, DashHtmlComponents
using StringEncodings, HTTP, JSON

external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]

req = HTTP.request("GET", "https://raw.githubusercontent.com/plotly/dash-bio-docs-files/master/oncoprint_dataset3.json")
data = decode(req.body, "UTF-8")

data = JSON.parse(data)


app = dash(external_stylesheets=external_stylesheets)


app.layout = html_div([
  dashbio_oncoprint(
      id="my-dashbio-oncoprint",
      data=data
  ),
  html_div(id="oncoprint-output")
])

callback!(app,
    Output("oncoprint-output", "children"),
    [Input("my-dashbio-oncoprint", "eventDatum")]
) do event_data
    if event_data isa Nothing || length(event_data) == 0
        return "There are no event data. Hover over or click on a part of the graph to generate event data."
    end
    event_data = JSON.parse(event_data)
    
    return [
      html_div(
        "$key, 
        $(replace(string(event_data[key]), "<br>" => "\n"))")
         for key in keys(event_data)
    ]
    
end

run_server(app, "0.0.0.0", debug=true)