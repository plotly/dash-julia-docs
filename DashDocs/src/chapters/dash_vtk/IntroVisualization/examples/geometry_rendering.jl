## Work in Progress

using Dash, DashHtmlComponents
using DashVtk

app = dash()

#content = vtk_view([
#    vtk_geometryrepresentation([
#        vtk_imagedata(
#            dimensions = [5, 5, 5],
#            origin = [-2, -2, -2],
#            spacing = [1, 1, 1],
#    )
#    ]),
#])

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