using Dash, DashHtmlComponents, DashCoreComponents

external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]

app = dash(external_stylesheets=external_stylesheets)

app.layout = html_div() do
  html_div(dcc_input(id ="input-box", type="text")),
  html_button("Submit", id="button"),
  html_div(id="output-container-button", children="Enter a value and press submit")
end

callback!(
  app, 
  Output("output-container-button", "children"), 
  Input("button", "n_clicks"), State("input-box", "value")) do n_clicks, value
    return "The input value was $(value) and the button has been clicked $n_clicks times"
end

run_server(app, "0.0.0.0", debug=true)