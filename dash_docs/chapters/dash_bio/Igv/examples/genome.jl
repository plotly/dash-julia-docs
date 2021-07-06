using Dash, DashBio

app = dash()

app.layout = dashbio_igv(
    id="genome-igv",
    genome="ce11"
)  

run_server(app, "0.0.0.0", debug=true)