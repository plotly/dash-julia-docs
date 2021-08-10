using Dash, DashHtmlComponents
using DashVtk
using JSON2

path_to_file = joinpath(@__DIR__, "cow-nonormals.obj")
txt_content = read(path_to_file, String)

view = vtk_view(
    id="click-info-view",
    pickingModes=["click"],
    children=[
        vtk_geometryrepresentation(id="cow-geometry", children=[
            vtk_reader(
                vtkClass="vtkOBJReader",
                parseAsText=txt_content,
            ),
        ]),
    ],
)

#Dash Setup
app = dash()

app.layout = html_div() do 
    html_div(
        view, style = Dict(
            "width" => "100%",
            "height" => "300px",
        ),
    ),
    html_b("
    Output of clickInfo (try clicking on the object above):
    "),
    html_pre(
         id="click-info-output",
         style = Dict(
             "overflowX" => "scroll"
         )
    )
end

callback!(
    app, 
    Output("click-info-output", "children"), 
    Input("click-info-view", "clickInfo")) do click_info  
end
#do click_info 
 # return 
#end

run_server(app, "0.0.0.0", debug = true)