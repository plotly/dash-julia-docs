using Dash, DashVtk, DashHtmlComponents

app = dash()

content = vtk_view([
        vtk_volumerepresentation([
        # GUI to control Volume Rendering
        # + Setup good default at startup
        vtk_volumecontroller(),
        # Actual Imagedata
        vtk_imagedata(
            dimensions = [5, 5, 5],
            origin = [-2, -2, -2],
            spacing = [1, 1, 1],
            children = [
                    vtk_pointdata([
                        vtk_dataarray(
                        registration="setScalars",
                        values= collect(0:124),
                    )
                ])
            ],
        ),
    ]),
])

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
