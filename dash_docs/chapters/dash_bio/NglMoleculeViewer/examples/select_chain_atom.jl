using Dash, DashBio, DashBioUtils
using DashHtmlComponents, DashCoreComponents

app = dash()

data_path = "https://raw.githubusercontent.com/plotly/dash-bio-docs-files/master/"


app.layout = html_div([
  dcc_input(id="chain-input", placeholder="Eg. 5L73.A:629-819@700,750,800", value="5L73.A:629-819@700,750,800"),
  dcc_dropdown(id="chain-color", value="black", options=[Dict("label" => uppercase(s), "value" => s) for s in ["black", "white","red", "blue"]]),
  dashbio_nglmoleculeviewer(id="chain-ngl"),
])


callback!(app,
  [Output("chain-ngl", "data"),
   Output("chain-ngl", "molStyles")],
  [Input("chain-input", "value"),
   Input("chain-color", "value")]
) do value, color
  if value isa Nothing
      throw(PreventUpdate())
  end

  molstyles_dict = Dict(
      "representations" => ["cartoon", "axes+box"],
      "chosenAtomsColor" => color,
      "chosenAtomsRadius" => 1,
      "molSpacingXaxis" => 100,
  )
  data_list = [DashBioUtils.get_data(data_path, value, "red",
                          reset_view=true, loc=false)]

  return data_list, molstyles_dict
end
run_server(app, "0.0.0.0", debug=true)
