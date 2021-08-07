@doc_chapter "/dash_vtk/other_components" begin 

@example othercomponents_vtk_source "vtk_source.jl";
@example othercomponents_vtk_reader "vtk_reader.jl";

@layout html_div() do 
    
    html_h1("Other Dash VTK Components"),

    html_h3("Mesh"),
    
    dcc_markdown("""
    The `vtk_mesh` element expects a single state property that is internally split into 2 elements to represent the geometry and the field that you want to optionally attach to your mesh. The structure should be defined as follows:
    * `state`
        * `vtk_mesh`: (Contains the properties of `vtk_polydata`)
            * points=[]
            * verts=[]
            * lines=[]
            * polys=[]
            * strips=[]
            * connectivity=manual # manual, points, triangles, strips

    * `field`: (Contains the properties of `vtk_dataarray`)
                * location: `vtk_pointdata`/`vtk_celldata`
                * name: Name of the field (optional)
                * values: Array of values for the field
                * numberOfComponents: Number of components per unit/cell
                * type: Name of TypedArray to use (Unit8Array, Int8Array, Float32Array, Float64Array...)
    """),

    html_h3("Volume"),

    dcc_markdown("""
    The `vtk_volume` element expects a single `state` property that is internally split into 2 elements to represent the field that you want to optionally attatch to your mesh. The structure could be defined as follows:
    * `state`
        * image: (Contains the properties of `vtk_imagedata`)
        * dimensions
        * spacing
        * origin
                        
    * `field`: (Contains the properties of `vtk_dataarray`)
        * values: Array of values for the field
        * numbeOfComponents: Number of components per point/cell
        * type: Name of TypedArray to use (Uint8Array, Int8Array, Float32Array, Float64Array...)
    """),

    html_h3("Algorithm"),

    dcc_markdown("""
    This element, `vtk_algorithm` allows you to create and configure a vtk.js class. This element expect only 2 properties:
    * `vtkClass`: The name of the `vtkClass` to instantiate.
    * `state`: The set of properties to apply on the given `vtkClass`.

    The current list of classes available to instantiate are:

    * `vtkClass`:
        * vtkConcentricCylinderSource
        * vtkConeSource
        * vtkCubeSource
        * vtkCylinderSource
        * vtkLineSource
        * vtkPlaneSource
        * vtkPointSource
        * vtkSphereSource
        * vtkWarpScalar

    * `state`: See the references above for the properties available for each `vtkClass`.

    The following example uses a vtk source in vtk.js to generate a mesh:
    """),

    source"othercomponents_vtk_source",
    layout"othercomponents_vtk_source",

    html_h3("Reader"),

    dcc_markdown("""
    This element is similar to the *Algorithm* except that it focuses on vtk.js readers by allowing you to leverage their custom API. Like `Algorithm`, a reader expects a `vtkClass` among those [listed below](https://github.com/Kitware/react-vtk-js/blob/master/src/AvailableClasses.js#L17-L24).
    * `vtkClass`
        * vtkPLYReader
        * vtkSTLReader
        * vtkElevationReader
        * vtkOBJReader
        * vtkPDBReader
        * vtkXMLImageDataReader
        * vtkXMLPolyDataReader

    Then use one of the properties below to feed the reader some data:
    * `url`: set of url to fetch data from (on the JS side)
    * `parseAsText`: set the text content to process
    * `parseAsArrayBuffer`: set binary data to process from base64 string

    Since the data loading is going to be asynchronous we've enabled some automatic callback to either trigger a render or a resetCamera once the data became available. To enable those callback, just set the following set of properties to your licking:
    * `renderOnUpdate`: true(default)
    * `resetCameraOnUpdate`: true(default) 
    """),

    source"othercomponents_vtk_reader",
    layout"othercomponents_vtk_reader"
    
    end
    
end