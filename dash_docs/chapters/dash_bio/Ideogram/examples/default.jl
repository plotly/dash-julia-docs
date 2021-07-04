using Dash, DashBio

external_stylesheets = ["https =>//codepen.io/chriddyp/pen/bWLwgP.css"]
app = dash(external_stylesheets=external_stylesheets)


app.layout = html_div([
  "Select which chromosomes to display on the ideogram below:",
  dcc_dropdown(
      id="displayed-chromosomes",
      options=[Dict("label" => string(i), "value" => string(i)) for i in range(1, length=22)],
      multi=true,
      value=[string(i) for i in range(1, length=22)]
  ),
  dashbio_ideogram(
      id="my-dashbio-ideogram"
  ),
  html_div(id="ideogram-rotated")
])

callback!(app,
    Output("my-dashbio-ideogram", "chromosomes"),
    [Input("displayed-chromosomes", "value")]
) do value
    return value
end

callback!(app,
    Output("ideogram-rotated", "children"),
    [Input("my-dashbio-ideogram", "rotated")]
) do rot
    val = (rot isa Nothing || rot == false) ? "not" : ""
    return "You have $val selected a chromosome."
  end

run_server(app, "0.0.0.0", debug=true)