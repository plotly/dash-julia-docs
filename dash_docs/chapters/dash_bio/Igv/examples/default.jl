using Dash, DashBio, DashCoreComponents, DashCoreComponents

external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]
app = dash(external_stylesheets=external_stylesheets)

HOSTED_GENOME_DICT = [
    Dict("value" => "mm10", "label" => "Mouse (GRCm38/mm10)"),
    Dict("value" => "rn6", "label" => "Rat (RGCS 6.0/rn6)"),
    Dict("value" => "gorGor4", "label" => "Gorilla (gorGor4.1/gorGor4)"),
    Dict("value" => "panTro4", "label" => "Chimp (SAC 2.1.4/panTro4)"),
    Dict("value" => "panPan2", "label" => "Bonobo (MPI-EVA panpan1.1/panPan2)"),
    Dict("value" => "canFam3", "label" => "Dog (Broad CanFam3.1/canFam3)"),
    Dict("value" => "ce11", "label" => "C. elegans (ce11)")
]

app.layout = html_div([
  dcc_loading(
      id="igv-container"
  ),
  html_hr(),
  html_p("Select the genome to display below."),
  dcc_dropdown(
      id="igv-genome-select",
      options=HOSTED_GENOME_DICT,
      value="ce11"
  )
])
# Return the IGV component with the selected genome.
callback!(app,
    Output("igv-container", "children"),
    Input("igv-genome-select", "value")
) do genome
    return (
        html_div([
            dashbio_igv(
                id="default-igv",
                genome=genome,
                minimumBases=100,
            )
        ])
    )
end
run_server(app, "0.0.0.0", debug=true)