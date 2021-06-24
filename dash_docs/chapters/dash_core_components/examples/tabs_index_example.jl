using Dash, DashHtmlComponents, DashCoreComponents
external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]

app = dash(external_stylesheets=external_stylesheets)

app.layout = html_div([
    dcc_tabs(id="tabs", value="tab-1", children=[
        dcc_tab(label="Tab one", value="tab-1"),
        dcc_tab(label="Tab two", value="tab-2"),
    ]),
    html_div(id="tabs-content")
])

callback!(
  app, Output("tabs-content", "children"), 
  Input("tabs", "value")) do tab
    if tab == "tab-1"
      return html_div([
        html_h3("Tab content 1")
      ])
    else
      return html_div([
        html_h3("Tab content 2")
      ])
    end
end

run_server(app, "0.0.0.0", debug=true)