@doc_chapter "dash_vtk/reference" begin 

@layout html_div() do 
       html_h1("Dash VTK Reference"),

       html_h3("Algorithm"),

       dcc_markdown("
           An Algorithm component exposes a source or filter to a downstream filter. It takes the following set of properties:
           - vtkClass: vtkClassName

           - state: {}

           Keyword arguments:
           - `children` (Array of a list of or a singular dash component, string or numbers | a list of or a singular dash component, string or number; optional)

           - `id` (String; optional): The ID used to identify this component.

           - `port` (Real; optional): downstream connection port

           - `state` (Dict; optional): set of property values for vtkClass

           - `vtkClass` (String; optional): vtkClass name
       "),

       html_h3("Calculator"),

       dcc_markdown("
           A Calculator component exposes a source or filter to a downstream filter. It takes the following set of properties:
           - name: 'scalars'    // name of the generated field

           - location: 'POINT'  // POINT/CELL

           - arrays: []         // Name of array to have access in formula

           - formula: fn

           Keyword arguments:

           - `children` (Array of a list of or a singular dash component, string or numbers | a list of or a singular dash component, string or number; optional)

           - `id` (String; optional): The ID used to identify this component.

           - `arrays` (Array of Strings; optional): List of fields you want available for your formula

           - `location` (String; optional): Field location [POINT, CELL, COORDINATE, SCALARS, ]

           - `name` (String; optional): Field name

           - `port` (Real; optional): downstream connection port
       "),

       html_h3("CellData"),

       dcc_markdown("
           A CellData component exposes a vtkCellData to a downstream element.
           Keyword arguments:
           - `children` (Array of a list of or a singular dash component, string or numbers | a list of or a singular dash component, string or number; optional)
       "),

       html_h3("DataArray"),

       dcc_markdown("
           A DataArray component creates a vtkDataArray for the container fields.
           It takes the following set of properties:
              - type: 'Float32Array', 'Float64Array', 'Uint16Array', ...

              - values: [number, number, ...]

              - numberOfComponents: 1,

              - registration: 'addArray', 'setScalars', ...

           Keyword arguments:
            - `id` (String; optional): The ID used to identify this component.

            - `name` (String; optional): Field name

            - `numberOfComponents` (Real; optional): Number of components / Tuple size

            - `registration` (String; optional): Name of the method to call on the fieldData (addArray, setScalars, setVectors...)

            - `type` (String; optional): Typed array name

            - `values` (Array of Reals; optional): Actual values to use inside our array
       "),

       html_h3("FieldData"),

       dcc_markdown("
           A FieldData component exposes a FieldData to a downstream element
           Keyword arguments:
           - `children` (Array of a list of or a singular dash component, string or numbers | a list of or a singular dash component, string or number; optional)
       "),

       html_h3("GeometryRepresentation"),

       dcc_markdown("
           A `vtk_geometryrepresentation` component is responsible to convert a vtkPolyData into rendering.
           It takes the following set of properties:
             - actor: Properties to assign to the  vtkActor
             - mapper: Properties to assign to the vtkMapper
             - property: Properties to assign to the vtkProperty (actor.getProperty())
             - colorMapPreset: Name of the preset to use for controlling the color mapping
             - colorDataRange: Range to use for the color scale
           Keyword arguments:
           - `children` (Array of a list of or a singular dash component, string or numbers | a list of or a singular dash component, string or number; optional)
           - `id` (String; optional): The ID used to identify this component.
           - `actor` (Dict; optional): Properties to set to the actor
           - `colorDataRange` (Array of Reals; optional): Data range use for the colorMap
           - `colorMapPreset` (String; optional): Preset name for the lookup table color map
           - `cubeAxesStyle` (Dict; optional): Configure cube Axes style by overriding the set of properties defined
           https://github.com/Kitware/vtk-js/blob/HEAD/Sources/Rendering/Core/CubeAxesActor/index.js#L703-L719
           - `mapper` (Dict; optional): Properties to set to the actor
           - `property` (Dict; optional): Properties to set to the actor.property
           - `showCubeAxes` (Bool; optional): Show/Hide Cube Axes for the given representation
       ")
  end
end