using Dash, DashVtk, DashHtmlComponents

app = dash()

content = vtk_view([
          vtk_geometryrepresentation(
          children = [
          vtk_polydata(
          points = [
             0, 0, 0,
             1, 0, 0,
             0, 1, 0,
             1, 1, 0,
          ],
          lines = [3, 1, 3, 2],
          polys = [3, 0, 1, 2],
          children = [
                 vtk_pointdata([
                     vtk_dataarray(
                        #registration='setScalars', # To activate field
                        name="onPoints",
                        values = [0, 0.33, 0.66, 1],

                     )
                 ]),
                 vtk_celldata([
                     vtk_dataarray(
                         # registration='setScalars', # To activate field
                         name="onCells",
                         values=[0, 1],
                     )
                 ])
              ],
            ),
         ],
      ),
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
