using Dash, DashBio, DashBioUtils
using DashHtmlComponents, DashCoreComponents

app = dash()

data_path = "https://raw.githubusercontent.com/plotly/dash-bio-docs-files/master/"


app.layout = html_div([
  dcc_dropdown(id="color-dropdown", value="white",
               options=[Dict("label" => uppercase(s), "value" => s) for s in ["black", "white"]]),
  dcc_dropdown(id="quality-dropdown", value="low",
               options=[Dict("label" => uppercase(s), "value" => s) for s in ["auto", "low", "medium", "high"]]),
  dcc_dropdown(id="camera-dropdown", value="perspective",
                   options=[Dict("label" => uppercase(s), "value" => s)
                            for s in ["perspective", "orthographic"]]),
  dashbio_nglmoleculeviewer(id="stage-ngl"),
])
callback!(app,
    [Output("stage-ngl", "data"),
     Output("stage-ngl", "molStyles"),
     Output("stage-ngl", "stageParameters")],
    [Input("color-dropdown", "value"),
     Input("quality-dropdown", "value"),
     Input("camera-dropdown", "value")]
) do color, quality, camera
    molstyles_dict = Dict(
        "representations" => ["cartoon", "axes+box"],
        "chosenAtomsColor" => "white",
        "chosenAtomsRadius" => 1,
        "molSpacingXaxis" => 100,
    )

    stage_params = Dict(
        "quality" => quality,
        "backgroundColor" => color,
        "cameraType" => camera
    )

    data_list = [DashBioUtils.get_data(data_path, molecule, "red", reset_view=true, loc=false) for molecule in ["1BNA", "PLPR"]]

    return data_list, molstyles_dict, stage_params
end
run_server(app, "0.0.0.0", debug=true)
