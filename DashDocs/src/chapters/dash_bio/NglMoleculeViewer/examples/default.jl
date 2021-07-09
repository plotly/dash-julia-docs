using Dash, DashBio, DashBioUtils
using DashHtmlComponents, DashCoreComponents
using JSON

external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]
app = dash(external_stylesheets=external_stylesheets)

data_path = "https://raw.githubusercontent.com/plotly/dash-bio-docs-files/master/"

# PDB examples
dropdown_options = [
    Dict("label" => "1BNA", "value" => "1BNA"),
    Dict("label" => "MPRO", "value" => "MPRO"),
    Dict("label" => "PLPR", "value" => "PLPR"),
    Dict("label" => "5L73", "value" => "5L73"),
    Dict("label" => "NSP2", "value" => "NSP2")
]
app.layout = html_div([
  dcc_markdown("""
    ### NglMoleculeViewer Controls

    * Rotate Stage: Left-click on the viewer and move the mouse to rotate the stage.
    * Zoom: Use the mouse scroll-wheel to zoom in and out of the viewer.
    * Pan: Right click on the viewer to pan the stage.
    * Individual Molecule Interaction: Left click on the molecule to interact with, then hold the 
    `CTRL` key and use right and left click mouse buttons to rotate and pan individual molecules.
  """),
  dashbio_nglmoleculeviewer(
    id="default-ngl"
  ),
  dcc_dropdown(id="default-dropdown", options=dropdown_options, placeholder="Select a molecule", value = "1BNA")
]);

callback!(app,
    [Output("default-ngl", "data"),
    Output("default-ngl", "molStyles")],
    Input("default-dropdown", "value")
) do value
    if (value isa Nothing)
        throw(PreventUpdate())
    end 
    molStyles  = Dict(
        "representations" => ["cartoon", "axes+box"],
        "chosenAtomsColor" => "white",
        "chosenAtomsRadius" => 1,
        "molSpacingXaxis" => 100,
    )
    data = DashBioUtils.get_data(data_path, value, "red", reset_view=true, loc=false);
    return data, molStyles
end;
run_server(app, "0.0.0.0", debug=true)

