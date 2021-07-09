using Dash, DashBio, DashBioUtils
using DashHtmlComponents, DashCoreComponents

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
  dcc_dropdown(id="multi-dropdown", options=dropdown_options, value=["1BNA", "MPRO"],
               multi=true),
  dashbio_nglmoleculeviewer(id="multiple-ngl"),
])

callback!(app,
    [Output("multiple-ngl", "data"),
     Output("multiple-ngl", "molStyles")],
    [Input("multi-dropdown", "value")]
) do value
    if (value isa Nothing)
        throw(PreventUpdate())
    end

    molstyles_dict = Dict(
        "representations" => ["cartoon", "axes+box"],
        "chosenAtomsColor" => "white",
        "chosenAtomsRadius" => 1,
        "molSpacingXaxis" => 100,
    )
    data_list = [DashBioUtils.get_data(data_path, molecule, "red", reset_view=true, loc=false)
                 for molecule in value]

    return data_list, molstyles_dict
end
run_server(app, "0.0.0.0", debug=true)

