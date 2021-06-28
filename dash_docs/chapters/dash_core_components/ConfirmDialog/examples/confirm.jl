using Dash, DashCoreComponents, DashHtmlComponents

external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]

app = dash(external_stylesheets=external_stylesheets)
app.layout = html_div([
  dcc_confirmdialog(
      id="confirm",
      message="Danger danger! Are you sure you want to continue?",
  ),

  dcc_dropdown(
      options=[
          Dict("label" => i, "value" => i)
          for i in ["Safe", "Danger!!"]
      ],
      id="dropdown"
  ),
  html_div(id="output-confirm")
])


callback!(app, Output("confirm", "displayed"),
              Input("dropdown", "value")) do value
    if value == "Danger!!"
        return true
    end
    return false
end

callback!(app, Output("output-confirm", "children"),
              Input("confirm", "submit_n_clicks")) do submit_n_clicks
    if !(submit_n_clicks isa Nothing)
        return "It wasnt easy but we did it $(submit_n_clicks)"
    end
end

run_server(app, "0.0.0.0", debug=true)

