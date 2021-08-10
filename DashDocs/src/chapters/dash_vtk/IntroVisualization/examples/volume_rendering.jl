using Dash, DashVtk, DashHtmlComponents
using Random

Random.seed!(42)

app = dash()

volume_view = vtk_view(
   children=vtk_volumedatarepresentation(
     spacing=[1, 1, 1],
     dimensions=[10, 10, 10],
     origin=[0, 0, 0],
     scalars = [rand() for _ in 1:1000],
     rescaleColorMap=false,
   )
)

app.layout = html_div() do
    html_div(
    style = Dict(
          "height" => "calc(100vh - 16px)",
          ),
   children = [html_div(
          children=volume_view,
          style = Dict(
          "height" => "100%",
          "width" =>  "100%",
        ),
      )]
    )
end

run_server(app, "0.0.0.0", debug = true)