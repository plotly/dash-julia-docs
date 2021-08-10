@doc_chapter "/dash_vtk/intro_visualization" begin 

@example introvisualization_volume_rendering "volume_rendering.jl"

@layout html_div() do 
    
    html_h1("Intro to 3D Visualization (3D Visualization Explained)"),
    dcc_markdown("""
    In VTK, we have 3 main types of objects that are key for understanding its visualization principals. First we have the *View* which is just a container for any *Representation* of DataSource that you want to see.
    """),

    html_h3("View"),
    dcc_markdown("""
    The view is a 3D View that can do Geometry rendering for meshes or Volume rendering for 3D images. The view can be configured to act as a 2D one when using parallel projection and preventing rotation when interacting with it. The *View* component can be configured with the following set of properties.
    
    ```julia
    vtk_view(
        id="vtk_view",
        background=[0, 0, 0],           # RGB array of floating point values between 0 and 1.
        interactorSettings=[],          # Binding of mouse events to camera action (Rotate, Pan, Zoom...)
        cameraPosition=[0, 0, 0],       # Where the camera should be initially placed in 3D world
        cameraViewUp=[0, 0, 0],         # Vector to use as your view up for your initial camera
        cameraParallelProjection=false, # Should we see our 3D work with perspective or flat with no depth perception
        triggerRender=0,                # Timestamp meant to trigger a render when different
        triggerResetCamera=0,           # Timestamp meant to trigger a reset camera when different
        # clickInfo,                    # Read-only property to retrieve picked representation id and picking information
        # hoverInfo                     # Read-only property to retrieve picked representation id and picking information
      )
    ```
    
    For the *interactorSettings* we expect a list of mouse event type linked to an action. The example below is what is used as default:
    
    ```julia
    interactorSettings=[
        (
          "button" => 1,
          "action" => "Rotate",
        ), (
          "button" => 2,
          "action" => "Pan",
        ), (
          "button" => 3,
          "action" => "Zoom",
          "scrollEnabled" => true,
        ), (
          "button" => 1,
          "action" => "Pan",
          "shift" => true,
        ), (
          "button" => 1,
          "action" => "Zoom",
          "alt" => true,
        ), (
          "button" => 1,
          "action" => "ZoomToMouse",
          "control" => true,
        ), (
          "button" => 1,
          "action" => "Roll",
          "alt" => true,
          "shift" => true,
        )
      ]  
    ```
    
    A mouse event can be identified with the following set of properties:
    * `button`: 1/2/3 # Which button should be down
    * `shift`: true/false # Is the `Shift` key down
    * `alt`: true/false # Is the `Alt` key down
    * `control`: true/false # Is the `Ctrl` key down
    * `scrollEnabled`: true/false # Some action could also be triggered by scroll
    * `dragEnabled`: true/false # Mostly used to disable default drag behavior
    
    And the `action` could be one of the following:
    * `Pan`: Will pan the object on the plane normal to the camera
    * `Zoom`: Will zoom closer or further from the object based on the drag direction
    * `Roll`: Will rotate the object around the view direction
    * `ZoomToMouse`: Will zoom while keeping the location that was initially under the mouse at the same spot
    """),

    html_h3("Representation"),
    dcc_markdown("""
    A representation is responsible for converting a *DataSource* into something visual that will be available inside the *View*.
        
    So far we are exposing to `DashVtk` 3 core types of *Representation*:
    
    * GeometryRepresentation: The geometry representation will expect a mesh and will render it as geometry rendering (think triangle sets).
    * VolumeRepresentation: The volume representation will expect a 3D image and will render it using a Volume Rendering technique that will let you see through (foggy object).
    * SliceRepresentation: The slice representation will expect a 3D image and will slice it along a given axis.
    
    Representations should be put inside the children of a *View*.
    """),

    html_h3("DataSource"),
    dcc_markdown("""
    A *DataSource* can be many things but it is mostly something that can produce data. In other words it could be a `dataset` or a `filter` that consume some data and generate new ones or even a `reader` that will read somekind of input (file, url...) and produce some data. Any DataSource can be placed inside the children of another DataSource that will act as a filter or simply passed to a Representation.
    
    In `DashVtk` we have several objects that falls into that category. The list below gives you an overview of those but more details information can be found later.
    
    * Algorithm: Allows you to instantiate a vtk.js algorithm that could either be a filter (vtkWarpScalar) or a source (vtkLineSource, vtkConeSource, vtkPlaneSource, vtkSphereSource, vtkCylinderSource).
    * ImageData: What we've been calling a 3D image so far. This element will let you define each piece that comprises a 3D image.
    * PolyData: A surface mesh (points, triangles...). This element will let you define the various piece of a mesh.
    * Reader: Similar to an Algorithm except that readers have a common API and this element lets you leverage those.
    * ShareDataSet: Allows you to capture any DataSource and make it available in another processing pipeline or representation without duplicating the data that gets sent from the server to the client.
    * Mesh: Similar to PolyData except that it has a Python helper function to help you map a vtkDataSet into a single property of the Mesh.
    * Volume: Similar to ImageData except that it has a Python helper function to help you map a vtkImageData into a single property of the Volume.
    """),

    html_h3("Volume Rendering"),
    dcc_markdown("""
    A 3D image can be represented as a Volume Rendering as follows.
    """),

    source"introvisualization_volume_rendering",
    layout"introvisualization_volume_rendering"
    
  end
    
end
