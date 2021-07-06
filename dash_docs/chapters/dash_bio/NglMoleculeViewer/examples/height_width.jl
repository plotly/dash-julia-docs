using Dash, DashBio, DashBioUtils
using DashHtmlComponents, DashCoreComponents

app = dash()

data_path = "https://raw.githubusercontent.com/plotly/dash-bio-docs-files/master/"


app.layout = html_div([
  dcc_slider(id="height-ngl", min=300, max=800, value=600,
                  step=100, marks=Dict(300 => "300px",800 => "800px")),
  dcc_slider(id="width-ngl", min=300, max=800, value=600,
                  step=100, marks=Dict(300 => "300px", 800 => "800px")),
  dashbio_nglmoleculeviewer(id="dimensions-ngl"),
]) 
callback!(app,
    [Output("dimensions-ngl", "data"),
     Output("dimensions-ngl", "molStyles"),
     Output("dimensions-ngl", "height"),
     Output("dimensions-ngl", "width")],
    [Input("height-ngl", "value"),
     Input("width-ngl", "value")]) do height, width

      molstyles_dict = Dict(
        "representations" => ["cartoon", "axes+box"],
        "chosenAtomsColor" => "red",
        "chosenAtomsRadius" => 1,
        "molSpacingXaxis" => 100,
    )
    data_list = [DashBioUtils.get_data(data_path, "1BNA", "red", reset_view=true, loc=false)]
    return data_list, molstyles_dict, height, width
end
run_server(app, "0.0.0.0", debug=true)
