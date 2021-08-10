@doc_chapter "/dash_vtk/api_part" begin 

@layout html_div() do 

    html_h1("Dash VTK Reference"),

    html_h3("Algorithm"),
    dcc_markdown("""
    An Algorithm component exposes a source or filter to a downstream filter. It takes the following set of properties:
    * vtkClass: vtkClassName
        * state: {}

    Keyword arguments:
    * `children` (Array of a list of or a singular dash component, string or numbers | a list of or a singular dash component, string or number; optional)
    * `id` (String; optional): The ID used to identify this component.
    * `port` (Real; optional): downstream connection port
    * `state` (Dict; optional): set of property values for vtkClass
    * `vtkClass` (String; optional): vtkClass name
    """),

    html_h3("Calculator"),
    dcc_markdown("""
    A Calculator component exposes a source or filter to a downstream filter. It takes the following set of properties:
    * name: 'scalars'    // name of the generated field
    * location: 'POINT'  // POINT/CELL
    * arrays: []         // Name of array to have access in formula
    * formula: fn

    Keyword arguments:

    * `children` (Array of a list of or a singular dash component, string or numbers | a list of or a singular dash component, string or number; optional)
    * `id` (String; optional): The ID used to identify this component.
    * `arrays` (Array of Strings; optional): List of fields you want available for your formula
    * `location` (String; optional): Field location [POINT, CELL, COORDINATE, SCALARS, ]
    * `name` (String; optional): Field name
    * `port` (Real; optional): downstream connection port
    """),

    html_h3("CellData"),
    dcc_markdown("""
    A CellData component exposes a vtkCellData to a downstream element.

    Keyword arguments:
    * `children` (Array of a list of or a singular dash component, string or numbers | a list of or a singular dash component, string or number; optional)
    """),

    html_h3("DataArray"),
    dcc_markdown("""
    A DataArray component creates a vtkDataArray for the container fields.
    It takes the following set of properties:
    * type: 'Float32Array', 'Float64Array', 'Uint16Array', ...
    * values: [number, number, ...]
    * numberOfComponents: 1,
    * registration: 'addArray', 'setScalars', ...

    Keyword arguments:
    * `id` (String; optional): The ID used to identify this component.
    * `name` (String; optional): Field name
    * `numberOfComponents` (Real; optional): Number of components / Tuple size
    * `registration` (String; optional): Name of the method to call on the fieldData (addArray, setScalars, setVectors...)
    * `type` (String; optional): Typed array name
    * `values` (Array of Reals; optional): Actual values to use inside our array
    """),

    html_h3("FieldData"),
    dcc_markdown("""
    A FieldData component exposes a FieldData to a downstream element

    Keyword arguments:
    * `children` (Array of a list of or a singular dash component, string or numbers | a list of or a singular dash component, string or number; optional)
    """),

    html_h3("GeometryRepresentation"),
    dcc_markdown("""
    A `vtk_geometryrepresentation` component is responsible to convert a vtkPolyData into rendering.
    It takes the following set of properties:
    * actor: Properties to assign to the  vtkActor
    * mapper: Properties to assign to the vtkMapper
    * property: Properties to assign to the vtkProperty (actor.getProperty())
    * colorMapPreset: Name of the preset to use for controlling the color mapping
    * colorDataRange: Range to use for the color scale

    Keyword arguments:
    * `children` (Array of a list of or a singular dash component, string or numbers | a list of or a singular dash component, string or number; optional)
    * `id` (String; optional): The ID used to identify this component.
    * `actor` (Dict; optional): Properties to set to the actor
    * `colorDataRange` (Array of Reals; optional): Data range use for the colorMap
    * `colorMapPreset` (String; optional): Preset name for the lookup table color map
    * `cubeAxesStyle` (Dict; optional): Configure cube Axes style by overriding the set of properties defined
    * `mapper` (Dict; optional): Properties to set to the actor
    * `property` (Dict; optional): Properties to set to the actor.property
    * `showCubeAxes` (Bool; optional): Show/Hide Cube Axes for the given representation
    """),

    html_h3("ImageData"),
    dcc_markdown("""
    A `vtk_imagedata` component exposes a vtkImageData to a downstream filter
    It takes the following set of properties:
    * dimensions: [nx, ny, nz],
    * origin: [0, 0, 0]
    * spacing: [1, 1, 1]
    * direction: [
            1, 0, 0,
            0, 1, 0,
            0, 0, 1
        ]

    Keyword arguments:
    * `children` (Array of a list of or a singular dash component, string or numbers | a list of or a singular dash component, string or number; optional)
    * `id` (String; optional): The ID used to identify this component.
    * `dimensions` (Array of Reals; optional): Number of points along x, y, z
    * `direction` (Array of Reals; optional): 3x3 matrix use to orient the image data
    * `origin` (Array of Reals; optional): World coordinate of the lower left corner of your vtkImageData (i=0, j=0, k=0).
    * `port` (Real; optional): downstream connection port
    * `spacing` (Array of Reals; optional): Spacing along x, y, z between points in world coordinates
    """),

    html_h3("Mesh"),
    dcc_markdown("""
    A `vtk_meshdata` component exposes a vtkPolyData to a downstream filter.
    It takes the following set of properties:
    * state: { mesh: { ...polydata-props }, field: { ...dataArray } }

    Keyword arguments:
    * `id` (String; optional): The ID used to identify this component.
    * `port` (Real; optional): downstream connection port
    * `state` (Dict; optional): State of the mesh
    """),

    html_h3("PointCloudRepresentation"),
    dcc_markdown("""
    A `vtk_pointcloudrepresentation` component expects the following set of properties.
    * xyz: [x0, y0, z0, x1, ..., zn]
    * rgb: [...]
    * rgba: [...]
    * scalars: [...]

    Keyword arguments:
    * `colorDataRange` (Array of Reals; optional): Data range use for the colorMap
    * `colorMapPreset` (String; optional): Preset name for the lookup table color map
    * `property` (Dict; optional): Properties to set to the actor.property
    * `rgb` (Array of Reals; optional): Use RGB values to attach to the points/vertex
    * `rgba` (Array of Reals; optional): Use RGBA values to attach to the points/vertex
    * `scalars` (Array of Reals; optional): Field values to attach to the points
    * `xyz` (Array of Reals; optional): Points coordinates 
    """),

    html_h3("PointData"),
    dcc_markdown("""
    A `vtk_pointdata` component exposes a vtkPointData to a downstream element.

    Keyword arguments:
    * `children` (Array of a list of or a singular dash component, string or numbers | a list of or a singular dash component, string or number; optional)
    """),

    html_h3("PolyData"),
    dcc_markdown("""
    A `vtk_polydata` component exposes a vtkPolyData to a downstream filter.
    It takes the following set of properties:
    * points: [x, y, z, x, y, z, ...],
    * verts: [cellSize, pointId0, pointId1, ..., cellSize, pointId0, ...]
    * lines: [cellSize, pointId0, pointId1, ..., cellSize, pointId0, ...]
    * polys: [cellSize, pointId0, pointId1, ..., cellSize, pointId0, ...]
    * strips: [cellSize, pointId0, pointId1, ..., cellSize, pointId0, ...]
    Cell connectivity helper property:
    * connectivity: 'manual', // [manual, points, triangles, strips]

    Keyword arguments:
    * `children` (Array of a list of or a singular dash component, string or numbers | a list of or a singular dash component, string or number; optional)
    * `id` (String; optional): The ID used to identify this component.
    * `connectivity` (String; optional): Type of connectivity `manual` or implicit such as `points`, `triangles`, `strips`
    * `lines` (Array of Reals; optional): lines cells
    * `points` (Array of Reals; optional): xyz coordinates
    * `polys` (Array of Reals; optional): polys cells
    * `port` (Real; optional): downstream connection port
    * `strips` (Array of Reals; optional): strips cells
    * `verts` (Array of Reals; optional): verts cells
    """),

    html_h3("Reader"),
    dcc_markdown("""
    A `vtk_reader` component exposes a reader to a downstream filter.
    It takes the following set of properties:
    * vtkClass: vtk.js reader class name
    * url: string
    * parseAsText: string
    * parseAsArrayBuffer: base64String

    Keyword arguments:
    * `children` (Array of a list of or a singular dash component, string or numbers | a list of or a singular dash component, string or number; optional)
    * `id` (String; optional): The ID used to identify this component.
    * `parseAsArrayBuffer` (String; optional): set binary data to process from base64 string
    * `parseAsText` (String; optional): set text data to process
    * `port` (Real; optional): downstream connection port
    * `renderOnUpdate` (Bool; optional): Automatically render on data loaded
    * `resetCameraOnUpdate` (Bool; optional): Automatically reset camera on data loaded
    * `url` (String; optional): set of url to fetch data from
    * `vtkClass` (String; optional): vtkClass name
    """),

    html_h3("ShareDataSet"),
    dcc_markdown("""
    A `vtk_sharedataset` component captures a dataset or a source and allow it to use it in another
    pipeline or representation.

    Keyword arguments:
    * `children` (Array of a list of or a singular dash component, string or numbers | a list of or a singular dash component, string or number; optional)
    * `id` (String; optional): The ID used to identify this component.
    * `name` (String; optional): Unique dataset name to cross reference
    * `port` (Real; optional): downstream connection port
    """),

    html_h3("SliceRepresentation"),
    dcc_markdown("""
    A `vtk_slicerepresentation` commponent is responsible to convert a vtkPolyData into rendering.
    It takes the following set of properties:
    * colorBy: ['POINTS', ''],
    * pointSize: 1,
    * color: [1,1,1],

    Keyword arguments:
    * `children` (Array of a list of or a singular dash component, string or numbers | a list of or a singular dash component, string or number; optional)
    * `id` (String; optional): The ID used to identify this component.
    * `actor` (Dict; optional): Properties to set to the slice/actor
    * `colorDataRange` (Array of Reals | String; optional): Data range use for the colorMap
    * `colorMapPreset` (String; optional): Preset name for the lookup table color map
    * `iSlice` (Real; optional): index of the slice along i
    * `jSlice` (Real; optional): index of the slice along j
    * `kSlice` (Real; optional): index of the slice along k
    * `mapper` (Dict; optional): Properties to set to the mapper
    * `property` (Dict; optional): Properties to set to the volume.property
    * `xSlice` (Real; optional): index of the slice along x
    * `ySlice` (Real; optional): index of the slice along y
    * `zSlice` (Real; optional): index of the slice along z
    """),

    html_h3("View"),
    dcc_markdown("""
    A `vtk_view` component is responsible to render vtk.js data.
    It takes the following set of properties:
    * `background`: [0.2, 0.3, 0.4]
    * `cameraPosition`: [0, 0, 1]
    * `cameraViewUp`: [0, 1, 0]
    * `cameraParallelProjection`: false

    Keyword arguments:
    * `children` (Array of a list of or a singular dash component, string or numbers | a list of or a singular dash component, string or number; optional): List of representation to show
    * `id` (String; optional): The ID used to identify this component.
    * `background` (Array; optional): The color of the view background using 3 floating numbers
       between 0-1 of Red, Green, Blue component.
    * `cameraParallelProjection` (Bool; optional): Use parallel projection (default: false)
    * `cameraPosition` (Array; optional): Initial camera position from an object in [0,0,0]
    * `cameraViewUp` (Array; optional): Initial camera position from an object in [0,0,0]
    * `className` (String; optional): Allow user to provide custom className associated to root element
    * `clickInfo` (Dict; optional): Read-only prop. To use this, make sure that `pickingModes` contains `click`.

    This prop is updated when an element in the map is clicked. This contains the picking info describing the object being clicked on.

    * `hoverInfo` (Dict; optional): Read-only prop. To use this, make sure that `pickingModes` contains `hover`.

    This prop is updated when an element in the map is hovered. This contains the picking info describing the object being hovered.

    * `interactorSettings` (Array; optional): Configure the interactions
    * `pickingModes` (Array of Strings; optional): List of picking listeners to bind. The supported values are `click` and        `hover`. By default it is disabled (empty array).
    * `style` (Dict; optional): Allow user to override the default View style { width: '100%', height: '100%' }
    * `triggerRender` (Real; optional): Property use to trigger a render when changing.
    * `triggerResetCamera` (Real; optional): Property use to trigger a resetCamera when changing.
    """),

    html_h3("Volume"),
    dcc_markdown("""
    A `vtk_volume` component exposes a vtkImageData to a downstream filter.
    It takes the following set of properties:
    * state: { image: { ...imagedata-props }, field: { ...dataArray } }

    Keyword arguments:
    * `id` (String; optional): The ID used to identify this component.
    * `port` (Real; optional): downstream connection port
    * `state` (Dict; optional): State of the volume
    """),

    html_h3("Volume Controller"),
    dcc_markdown("""
    A `vtk_volumecontroller` component is a GUI to control the piecewise function.

    Keyword arguments:
    * `id` (String; optional): The ID used to identify this component.
    * `rescaleColorMap` (Bool; optional): Use opacity range to rescale color map
    * `size` (Array of Reals; optional): Controller size in pixels 
    """),

    html_h3("VolumeDataRepresentation"),
    dcc_markdown("""
    A `vtk_volumedatarepresentation` component expects the following set of properties:
    * dimensions: [10, 20, 5]
    * spacing: [1, 1, 1]
    * origin: [0, 0, 0]
    * rgb: [...]
    * rgba: [...]
    * scalars: [...]
    * scalarsType: Float32Array

    Keyword arguments:
    * `id` (String; optional): The ID used to identify this component.
    * `colorDataRange` (Array of Reals | String; optional): Data range use for the colorMap
    * `colorMapPreset` (String; optional): Preset name for the lookup table color map
    * `controllerSize` (Array of Reals; optional): Controller size in pixels
    * `dimensions` (Array of Reals; optional): Number of points along x, y, z
    * `mapper` (Dict; optional): Properties to set to the mapper
    * `origin` (Array of Reals; optional): World coordinate of the lower left corner of your vtkImageData (i=0, j=0, k=0).
    * `property` (Dict; optional): Properties to set to the volume.property
    * `rescaleColorMap` (Bool; optional): Use opacity range to rescale color map
    * `rgb` (Array of Reals; optional): Use RGB values to attach to the points/vertex
    * `rgba` (Array of Reals; optional): Use RGBA values to attach to the points/vertex
    * `scalars` (Array of Reals; optional): Field values to attach to the points
    * `scalarsType` (String; optional): Types of numbers provided in scalars
    * `spacing` (Array of Reals; optional): Spacing along x, y, z between points in world coordinates
    * `volume` (Dict; optional): Properties to set to the volume
    * `volumeController` (Bool; optional): Show volumeController
    """),

    html_h3("VolumeRepresentation"),
    dcc_markdown("""
    A `vtk_volumerepresentation` component is responsible to convert a vtkPolyData into rendering.
    It takes the following set of properties:
    * colorBy: ['POINTS', ''],
    * pointSize: 1,
    * color: [1,1,1],
    
    Keyword arguments:
    * `children` (Array of a list of or a singular dash component, string or numbers | a list of or a singular dash component, string or number; optional)
    * `id` (String; optional): The ID used to identify this component.
    * `colorDataRange` (Array of Reals | String; optional): Data range use for the colorMap
    * `colorMapPreset` (String; optional): Preset name for the lookup table color map
    * `mapper` (Dict; optional): Properties to set to the mapper
    * `property` (Dict; optional): Properties to set to the volume.property
    * `volume` (Dict; optional): Properties to set to the volume
    """)
    end
end