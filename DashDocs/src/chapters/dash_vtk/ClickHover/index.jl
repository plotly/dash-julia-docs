@doc_chapter "/dash_vtk/click_hover" begin 

@example clickhover_click_info "click_info.jl";

@layout html_div() do  

    html_h1("Click and Hover Callbacks"),

    dcc_markdown("
        It is possible to create Callbacks based on user clicks and hovering. First, you need to specify the `pickingModes` prop in `vtk_view` to be a list of modes you want to capture. The following values are accepted:
            - `click` 
            - `hover`

        Afterwards, you need to create callback where inputs and states include one of the following read-only proper of `vtk_view`.
            - `clickInfo`: Called when the user clicks on an object.
            - `hoverInfo`: Called when the user hovers over an object.

       ## Calback Structure
       
       You can notice that the `clickInfo` or `hoverInfo` data will be a dictionary with various keys describing the picked object. The keys include:

            - `displayPosition`: The x,y,z coordinate with on the user's screen.
            - `ray`: A line between two points in 3D space (xyz1, xyz2) that represent the mouse position. It covers the full space under the 2D mouse position.
            - `representationId`: The ID assigned to the `vtk_geometryrepresentation` containing your object.
            - `worldPosition`: The x,y,x coordinates in the 3D environment that you are rendering where the ray hit the object. It corresponds to the 3D coordinate on the surface of the object under your mouse.
        "), 

    html_h3("Output clickInfo to html_pre"),
    
    dcc_markdown("
        The following shows you how to consisely display the output of `clickInfo` inside an `html_pre`:
    "),

    source"clickhover_click_info",
    layout"clickhover_click_info"
  
    end


end