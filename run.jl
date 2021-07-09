using DashUserGuideComponents
using Dash
using DashDocs
app = DashDocs.make_app()

port = haskey(ENV, "PORT") ? parse(Int64, ENV["PORT"]) : 8050
run_server(app, "0.0.0.0", port)