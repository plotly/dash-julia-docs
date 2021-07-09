using Dash, DashBio

app = dash()
sequences = [Dict(
        "sequence" => "AUGGGCCCGGGCCCAAUGGGCCCGGGCCCA",
        "structure" => ".((((((())))))).((((((()))))))",
        "options" => Dict(
            "labelInterval" => 3
        )
)]


app.layout = dashbio_fornacontainer(
  sequences=sequences
)
run_server(app, "0.0.0.0", debug=true)