using Dash, DashBio, DashBioUtils
using DashHtmlComponents, DashCoreComponents
using JSON

external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]
app = dash(external_stylesheets=external_stylesheets)

data_path = "https://raw.githubusercontent.com/plotly/dash-bio-docs-files/master/"

# PDB examples
representation_options = [
    Dict("label" => "backbone", "value" => "backbone"),
    Dict("label" => "ball+stick", "value" => "ball+stick"),
    Dict("label" => "cartoon", "value" => "cartoon"),
    Dict("label" => "hyperball", "value" => "hyperball"),
    Dict("label" => "licorice", "value" => "licorice"),
    Dict("label" => "axes+box", "value" => "axes+box"),
    Dict("label" => "helixorient", "value" => "helixorient")
]

app.layout = html_div([
  dcc_dropdown(id="molstyle-dropdown", options=representation_options,
               multi=true, value=["cartoon", "axes+box"]),
  dcc_radioitems(
      id="molstyle-radio",
      options=[
          Dict("label" => "sideByside", "value" => "True"),
          Dict("label" => "Independent", "value" => "False"),
      ],
      value="False"
  ),
  dashbio_nglmoleculeviewer(id="molstyle-ngl"),
])

callback!(app,
    [Output("molstyle-ngl", "data"),
     Output("molstyle-ngl", "molStyles")],
    [Input("molstyle-dropdown", "value"),
     Input("molstyle-radio", "value")]
) do style, sidebyside

    sidebyside_bool = sidebyside == "True"

    molstyles_dict = Dict(
        "representations" => style,
        "chosenAtomsColor" => "red",
        "chosenAtomsRadius" => 1,
        "molSpacingXaxis" => 100,
        "sideByside" => sidebyside_bool
    )

    data_list = [DashBioUtils.get_data(data_path, molecule, "red", reset_view=true, loc=false)
                 for molecule in ["NSP2", "NSP4"]]

    return data_list, molstyles_dict
end
run_server(app, "0.0.0.0", debug=true)

