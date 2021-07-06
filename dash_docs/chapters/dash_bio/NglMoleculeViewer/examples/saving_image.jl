using Dash, DashBio, DashBioUtils
using DashHtmlComponents, DashCoreComponents

app = dash()

data_path = "https://raw.githubusercontent.com/plotly/dash-bio-docs-files/master/"


app.layout = html_div([
  html_button(id="save-ngl", n_clicks=0, children="Download Image"),
  dcc_input(id="file-ngl", placeholder="Enter filename"),
  dashbio_nglmoleculeviewer(id="download-ngl")
]) 
callback!(app,
    [Output("download-ngl", "data"),
     Output("download-ngl", "molStyles"),
     Output("download-ngl", "downloadImage"),
     Output("download-ngl", "imageParameters")],
    [Input("save-ngl", "n_clicks")],
    [State("file-ngl", "value")]) do n_clicks, filename

      molstyles_dict = Dict(
        "representations" => ["cartoon", "axes+box"],
        "chosenAtomsColor" => "red",
        "chosenAtomsRadius" => 1,
        "molSpacingXaxis" => 100,
    )
    data_list = [DashBioUtils.get_data(data_path, "1BNA", "red",
                                     reset_view=true, loc=false)]
    imageParameters = Dict(
      "antialias" => true,
      "transparent" => true,
      "trim" => true,
      "defaultFilename" => filename
    )

    downloadImage  = false
    if n_clicks > 0
      downloadImage  = true
    end
    data_list = [DashBioUtils.get_data(data_path, "1BNA", "red", reset_view=true, loc=false)]
    return data_list, molstyles_dict, downloadImage, imageParameters
end
run_server(app, "0.0.0.0", debug=true)