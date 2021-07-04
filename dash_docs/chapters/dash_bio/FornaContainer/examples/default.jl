using Dash, DashBio, DashHtmlComponents, DashCoreComponents

external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]

app = dash(external_stylesheets=external_stylesheets)


sequences = Dict(
    "PDB_01019" => Dict(
        "sequence" => "AUGGGCCCGGGCCCAAUGGGCCCGGGCCCA",
        "structure" => ".((((((())))))).((((((()))))))"
    ),
    "PDB_00598" => Dict(
        "sequence" => "GGAGAUGACgucATCTcc",
        "structure" => "((((((((()))))))))"
    )
)

app.layout = html_div([
  dashbio_fornacontainer(
      id="forna"
  ),
  html_hr(),
  html_p("Select the sequences to display below."),
  dcc_dropdown(
      id="forna-sequence-display",
      options= [Dict("label" => name, "value" => name) for name in keys(sequences)],
      multi=true,
      value=["PDB_01019"]
  )
])

callback!(app,
    Output("forna", "sequences"),
    [Input("forna-sequence-display", "value")]
) do value
    if value isa Nothing
        throw(PreventUpdate())
    end
    return [sequences[selected_sequence] for selected_sequence in value]
end
run_server(app, "0.0.0.0", debug=true)