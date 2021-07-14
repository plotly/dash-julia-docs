using Dash, DashBio

app = dash()
sequences = [
    Dict(
        "sequence" => "AUGGGCCCGGGCCCAAUGGGCCCGGGCCCA",
        "structure" => ".((((((())))))).((((((()))))))",
        "options" => Dict(
            "name" => "PDB_01019"
        )
    ),
    Dict(
        "sequence" => "GGAGAUGACgucATCTcc",
        "structure" => "((((((((()))))))))",
        "options" => Dict(
            "name" => "PDB_00598"
        )
    )
]

custom_colors = Dict(
    "domain" => [0, 100],
    "range" => ["rgb(175, 0, 255)", "orange"],
    "colorValues" => Dict(
        "" => Dict("1" => 10, "5" => 40),  # default; can be overridden by sequence-specific colorschemes below
        "PDB_01019" => Dict("10" => "rgb(120, 50, 200)", "13" => 50),
        "PDB_00598" => Dict(string(i) => string(i*5) for i in range(4, stop = length(sequences[1]["sequence"])))
    )
)

custom_colors["colorValues"]["PDB_00598"]["1"] = "red"
app.layout = dashbio_fornacontainer(
    sequences=sequences,
    colorScheme="custom",
    customColors=custom_colors
)
run_server(app, "0.0.0.0", debug=true)