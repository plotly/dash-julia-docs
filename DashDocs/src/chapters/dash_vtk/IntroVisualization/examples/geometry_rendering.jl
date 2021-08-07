using Dash, DashHtmlComponents
using DashVtk

app = dash()

content = vtk_view([
    vtk_geometryrepresentation([
        vtk_mesh(
            spacing=[1, 1, 1],
            dimensions=[10, 10, 10],
            origin=[0, 0, 0],
        )
    ]),
])

app.layout = html_div() do
    html_div(
    style = Dict(
          "width" => "100%",
          "height" => "400px"
          ),
    children = [content],
    )
end

run_server(app, "0.0.0.0", debug = true)