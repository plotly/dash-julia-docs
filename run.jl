using DashUserGuideComponents
using Dash
@time using DashDocs
@time app = DashDocs.make_app()

port = haskey(ENV, "PORT") ? parse(Int64, ENV["PORT"]) : 8050
run_server(app, "0.0.0.0", port)