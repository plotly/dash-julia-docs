using Dash, DashHtmlComponents
using DashVtk

txt_content = read(download("https://raw.githubusercontent.com/plotly/datasets/master/vtk/cow-nonormals.obj"), String)

content = vtk_view([
    vtk_geometryrepresentation([
        vtk_reader(
            vtkClass="vtkOBJReader",
            parseAsText=txt_content,
        ),
    ]),
])

# Dash Setup
app = dash()

app.layout = html_div() do
    html_div(
    style = Dict(
          "width" => "100%",
          "height" => "400px",
    ),
    children=[content],
    )
end

run_server(app, "0.0.0.0", debug = true)