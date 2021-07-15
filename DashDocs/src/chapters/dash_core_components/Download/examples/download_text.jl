using Dash, DashHtmlComponents, DashCoreComponents

app = dash(prevent_initial_callbacks=true)

app.layout = html_div(
    [
      html_button("Download Text", id="btn_txt1"), 
      dcc_download(id="download-text-index1")
    ]
)

callback!(
  app, Output("download-text-index1", "data"), 
  Input("btn_txt1", "n_clicks")) do n_clicks
    if n_clicks isa Nothing
      throw(PreventUpdate())
    else
      return (content = "Hello world!", filename="hello.txt")
    end
end

run_server(app, "0.0.0.0", debug=true)