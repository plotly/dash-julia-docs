using Dash, DashHtmlComponents
using DashVtk

content = vtk_view([
    vtk_geometryrepresentation(
        mapper=Dict(
            "colorByArrayName" => "layer",
            "scalarMode" => 4,
            "interpolateScalarsBeforeMapping" => false,
        ),
        colorMapPreset="jet",
        colorDataRange=[0.2, 0.9],
        children=[
            vtk_algorithm(
                vtkClass="vtkConcentricCylinderSource",
                state=Dict(
                    "height" => 0.25,
                    "radius" => [0.2, 0.3, 0.4, 0.6, 0.7, 0.8, 0.9, 1],
                    "cellFields" => [0, 0.2, 0.4, 0.6, 0.7, 0.8, 0.9, 1],
                    "mask" => [1, 0, 1, 0, 1, 0, 1, 1],
                    "resolution" => 60,
                    "skipInnerFaces" => true,
                    "startThets" => 45,
                    "endTheta" => 315,
                    "center" => [0, 0, 0.5],
                ),
            ),
        ]
    ),
])

# Dash Setup

app = dash()

app.layout = html_div() do
    html_div(
    style = Dict(
          "width" => "100%",
          "height" => "400px",
    ),
    children=[content]
    )
end

run_server(app, "0.0.0.0", debug = true)

