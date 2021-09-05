#Phylogeny tree inspired from =>  http => //www.bio.miami.edu/dana/106/106F06_10.html
using Dash, DashCytoscape, DashHtmlComponents
app = dash()

# Creating elements
nonterminal_nodes = [
    Dict("data" =>  Dict("id" =>  name, "label" =>  uppercase(name)), "classes" =>  "nonterminal")
    for name in [
        "animalia",
        "eumetazoa",
        "bilateria",
        "deuterostomia"
    ]
]

terminal_nodes = [
    Dict(
        "classes" =>  "terminal",
        "data" =>  Dict(
            "id" =>  name,
            "label" =>  uppercase(name),
            "url" =>  string("https://upload.wikimedia.org/wikipedia/commons/thumb/",
                   url, "/150px-", split(url,"/")[end])
        )
    )
    for (name, url) in [
        ["porifera", "4/45/Spongilla_lacustris.jpg"],
        ["ctenophora", "c/c8/Archaeocydippida_hunsrueckiana.JPG"],
        ["cnidaria", "c/c1/Polyps_of_Cnidaria_colony.jpg"],
        ["acoela", "a/aa/Waminoa_on_Plerogyra.jpg"],
        ["echinodermata", "7/7a/Ochre_sea_star_on_beach%2C_Olympic_National_Park_USA.jpg"],
        ["chordata", "d/d6/White_cockatoo_%28Cacatua_alba%29.jpg"]
    ]
]


edges = [
    Dict("data" =>  Dict("source" =>  source, "target" =>  target))
    for (source, target) in [
        ["animalia", "porifera"],
        ["animalia", "eumetazoa"],
        ["eumetazoa", "ctenophora"],
        ["eumetazoa", "bilateria"],
        ["eumetazoa", "cnidaria"],
        ["bilateria", "acoela"],
        ["bilateria", "deuterostomia"],
        ["deuterostomia", "echinodermata"],
        ["deuterostomia", "chordata"]
    ]
]

# Creating styles
stylesheet = [
    Dict(
        "selector" =>  "node",
        "style" =>  Dict(
            "content" =>  "data(label)"
        )
    ),
    Dict(
        "selector" =>  ".terminal",
        "style" =>  Dict(
            "width" =>  90,
            "height" =>  80,
            "background-fit" =>  "cover",
            "background-image" =>  "data(url)"
        )
    ),
    Dict(
        "selector" =>  ".nonterminal",
        "style" =>  Dict(
            "shape" =>  "rectangle"
        )
    )
]


# Declare app layout
app.layout = html_div([
    cyto_cytoscape(
        id="cytoscape-images",
        layout=Dict("name" =>  "breadthfirst", "roots" =>  ["animalia"]),
        style=Dict("width" =>  "100%", "height" =>  "550px"),
        stylesheet=stylesheet,
        elements=vcat(terminal_nodes, nonterminal_nodes, edges)
    )
])

run_server(app, "0.0.0.0", debug=true)