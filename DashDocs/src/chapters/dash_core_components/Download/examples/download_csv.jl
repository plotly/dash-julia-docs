using Dash, DashHtmlComponents, DashCoreComponents
using DataFrames, CSV

app = dash(prevent_initial_callbacks=true)

app.layout = html_div(
    [
      html_button("Download CSV", id="btn_csv"), 
      dcc_download(id="download-dataframe-csv")
    ]
)

df = DataFrame(A = [1, 2, 3, 4], B = [2, 1, 5, 6], C = ["x", "x", "y", "y"])

callback!(
  app, Output("download-dataframe-csv", "data"), 
  Input("btn_csv", "n_clicks")) do n_clicks
    if n_clicks isa Nothing
      throw(PreventUpdate())
    else
      return download(CSV.write("mydf.csv", df))
    end
end

run_server(app, "0.0.0.0", debug=true)