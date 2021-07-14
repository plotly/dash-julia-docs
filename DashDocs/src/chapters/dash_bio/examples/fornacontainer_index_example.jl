using Dash, DashBio

app = dash()

sequences = [Dict(
        "sequence" => "AUGGGCCCGGGCCCAAUGGGCCCGGGCCCA",
        "structure" => ".((((((())))))).((((((()))))))",
        "options" => Dict(
            "applyForce" => true,
            "circularizeExternal" => true,
            "avoidOthers" => true,
            "labelInterval" => 5,
            "name" => "PDB_01019"
        )
)]

app.layout = dashbio_fornacontainer(
  id="my-dashbio-fornacontainer",
  sequences=sequences
)

run_server(app, "0.0.0.0", debug=true)