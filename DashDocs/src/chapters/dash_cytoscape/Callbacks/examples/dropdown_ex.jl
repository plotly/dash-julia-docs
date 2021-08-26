using Dash, DashCytoscape
using DashHtmlComponents, DashCoreComponents
app = dash()

app.layout = dcc_dropdown(
    id="dropdown-callbacks-1",
    value="grid",
    clearable=false,
    options=[
        Dict("label" =>  uppercase(name), "value" =>  name)
        for name in ["grid", "random", "circle", "cose", "concentric"]
    ]
)
run_server(app, "0.0.0.0", debug=true)