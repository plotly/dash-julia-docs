@doc_chapter "/dash_vtk/representation_components" begin 

@layout html_div() do 
    
    html_h1("Representation Components"),

    html_h3("GeometryRepresentation"),
    dcc_markdown("""
    The properties available on the `vtk_geometryrepresentation` let you tune the way you want to render your geometry. 
    In *VTK* a representation is coposed of an `actor`, a `mapper`, and a `property`. Each of those objects can be configured using the `actor`, `mapper`, and `property` arguments of the `vtk_geometryrepresentation`. 
    The list below shows the default values for each argument:
    * `actor`:
        * origin = (0, 0, 0)
        * position = (0, 0, 0)
        * scale = (1, 1, 1)
        * visibility = 1
        * pickable = 1
        * dragable = 1
        * orientation = (0, 0, 0)

    * `property`:
        * `lighting` = true
        * `interpolation` = [Interpolation.GOURAUD](https://github.com/Kitware/vtk-js/blob/master/Sources/Rendering/Core/Property/Constants.js#L1-L5)
        * `ambient` = 0
        * `diffuse` = 1
        * `specular` = 0
        * `specularPower` = 1
        * `opacity` = 1
        * `edgeVisibility` = false
        * `lineWidth` = 1
        * `pointSize` = 1
        * `backfaceCulling` = false
        * `frontfaceCulling` = false
        * `representation` = [Representation.SURFACE](https://github.com/Kitware/vtk-js/blob/master/Sources/Rendering/Core/Property/Constants.js#L7-L11)
        * `color` = (1, 1, 1) #white
        * `ambientColor` = (1, 1, 1)
        * `specularColor` = (1, 1, 1)
        * `diffuseColor` = (1, 1, 1)
        * `edgeColor` = (0, 0, 0) #Black

    * `mapper`:
        * `static` = false
        * `scalarVisibility` = true
        * `scalarRange` = 0, 1
        * `useLookupTableScalarRange` = false
        * `colorMode` = 0 [Available values](https://github.com/Kitware/vtk-js/blob/master/Sources/Rendering/Core/Mapper/Constants.js#L1-L5)
        * `scalarMode` = 0 [Available values](https://github.com/Kitware/vtk-js/blob/master/Sources/Rendering/Core/Mapper/Constants.js#L7-L14)
        * `arrayAccessMode` = 1 [Available values](https://github.com/Kitware/vtk-js/blob/master/Sources/Rendering/Core/Mapper/Constants.js#L16-L19)
        * `colorByArrayName`= "
        * `interpolateScalarBeforeMapping` = false
        * `useInvertibleColors` = false
        * `fieldDataTupleID` = -1  
        * `viewSpecificProperties` = None
        * `customShaderAttributes` = []
            
    On top of those previous settings we provide additional properties to configure a lookup table using one of oue available [colorMapPreset](https://github.com/Kitware/vtk-js/blob/master/Sources/Rendering/Core/ColorTransferFunction/ColorMaps.json) convinient *colorDataRange* to rescale to color map to your area of focus.

    With the `vtk_geometryrepresentation` you also have the option to turn on the *CubeAxes* using the `showCubeAxes=true` along with additional configuration parameters that can be provided via the `cubeAxesStyle` property. The content of the object for *cubeAxesStyle* can be found in the source code of vtk.js from the [default section here](https://github.com/Kitware/vtk-js/blob/HEAD/Sources/Rendering/Core/CubeAxesActor/index.js#L703-L719)
    """),
    
    html_h3("GlyphRepresentation"),
    dcc_markdown("""
    `vtk_glyphrepresentation` lets you use a source as a Glyph which will then be cloned and positioned at every point of another source. The properties available on the `vtk_glyphrepresentation` let you tune the way you want to render your geometry. 
    In Vtk a representation is composed of an `actor`, `mapper`, and a `property`. Each of those objects can be configured using the `actor`, `mapper`, and `property` arguments of the `vtk_glyphrpresentation`.

    The list below shows the default value for each argument:

    * `actor`:
        * `origin` = (0,0,0)
        * `position` = (0,0,0)
        * `scale` = (1,1,1)
        * `visibility` = 1
        * `pickable` = 1
        * `dragable` = 1
        * `orientation` = (0,0,0)

    * `property`:
        * `lighting` = true
        * `interpolation` = [Interpolation.GOURAUD](https://github.com/Kitware/vtk-js/blob/master/Sources/Rendering/Core/Property/Constants.js#L1-L5)
        * `ambient` = 0
        * `diffuse` = 1
        * `specular` = 0
        * `specularPower` = 1
        * `opacity` = 1
        * `edgeVisibility` = false
        * `lineWidth` = 1
        * `pointSize` = 1
        * `backfaceCulling` = false
        * `frontfaceCulling` = false
        * `representation` = [Representation.SURFACE](https://github.com/Kitware/vtk-js/blob/master/Sources/Rendering/Core/Property/Constants.js#L7-L11)
        * `color` = (1, 1, 1) #white
        * `ambientColor` = (1, 1, 1)
        * `specularColor` = (1, 1, 1)
        * `diffuseColor` = (1, 1, 1)
        * `edgeColor` = (0, 0, 0) #Black

    * `mapper`:
        * `orient` = true
        * `orientationMode` = 0 [Available values](https://github.com/Kitware/vtk-js/blob/master/Sources/Rendering/Core/Glyph3DMapper/Constants.js#L1-L5)
        * `orientationArray` = null
        * `scaling` = true
        * `scaleFactor` = 1.0
        * `scaleMode` = 1 [Available values](https://github.com/Kitware/vtk-js/blob/master/Sources/Rendering/Core/Glyph3DMapper/Constants.js#L7-L11)
        * `scaleArray` = null
        * `static` = false
        * `scalarVisibility` = true
        * `scalarRange` = 0, 1
        * `useLookupTableScalarRange` = false
        * `colorMode` = 0 [Available values](https://github.com/Kitware/vtk-js/blob/master/Sources/Rendering/Core/Mapper/Constants.js#L1-L5)
        * `scalarMode` = 0 [Available values](https://github.com/Kitware/vtk-js/blob/master/Sources/Rendering/Core/Mapper/Constants.js#L7-L14)
        * `arrayAccessMode` = 1 [Available values](https://github.com/Kitware/vtk-js/blob/master/Sources/Rendering/Core/Mapper/Constants.js#L16-L19)
        * `colorByArrayName` = ''
        * `interpolateScalarsBeforeMapping` = false
        * `useInvertibleColors` = false
        * `fieldDataTupleId` = -1
        * `viewSpecificProperties` = None
        * `customShaderAttributes` = []
            
    On top of those previous settings we provide additional properties to configure a lookup table using one of our available [colorMapPreset](https://github.com/Kitware/vtk-js/blob/master/Sources/Rendering/Core/ColorTransferFunction/ColorMaps.json) and a convinient `colorDataRange` to rescale to color map to your area of focus.

    An example of the `vtk_glyphrepresentation` could be creating a spiky sphere by positioning cones normal to the sphere.

    ```julia
    function example() 
        return vtk_view(
            children=[
                vtk_glyphrepresentation(
                    mapper=Dict("orientationArray" => "Normal")
                    children=[
                        vtk_algorithm(
                            port=0,
                            vtkClass="vtkSphereSource",
                            state=Dict(
                                "phiResolution" => 10,
                                "thetaResolution" => 20,
                            ),
                        ),
                        vtk_algorithm(
                            port=1,
                            vtkClass="vtkConeSource",
                            state=Dict(
                                "resolution" => 30,
                                "height" => 0.25,
                                "radius" => 0.08,
                            ),
                        ),
                    ] 
                )
            ]
        )
    end        
    ```
    """),

    html_h3("VolumeRepresentation"),
    dcc_markdown("""
    The properties available on the `vtk_volumerepresentation` let you tune the way you want to render your volume.

    In VTK a representation is composed of an `volume`, a `mapper` and a `property`. Each of those objects can be configured using the `actor`, `mapper` and `property` arguments of the `vtk_gometryrepresentation`.
            
    The list below shows the default values for each argument:

    * `volume`:
        * `origin` = (0,0,0)
        * `position` = (0,0,0)
        * `scale` = (1,1,1)
        * `visibility` = 1
        * `pickable` = 1
        * `dragable` = 1
        * `orientation` = (0,0,0)

    * `property`:
        * `independentComponents` = true
        * `interpolationType` = [InterpolationType.FAST_LINEAR](https://github.com/Kitware/vtk-js/blob/master/Sources/Rendering/Core/VolumeProperty/Constants.js#L1-L5)
        * `shade` = 0
        * `ambient` = 0.1
        * `diffuse` = 0.7
        * `specular` = 0.2
        * `specularPower` = 10.0
        * `useLabelOutline` = false
        * `labelOutlineThickness` = 1
        * `useGradientOpacity` = idx, value
        * `scalarOpacityUnitDistance` = idx, value
        * `gradientOpacityMinimumValue` = idx, value
        * `gradientOpacityMinimumOpacity` = idx, value
        * `gradientOpacityMaximumValue` = idx, value
        * `gradientOpacityMaximumOpacity` = idx, value
        * `opacityMode` = [idx, [value](https://github.com/Kitware/vtk-js/blob/master/Sources/Rendering/Core/VolumeProperty/Constants.js#L7-L10)]

    * `mapper`:
        * `sampleDistance` = 1.0
        * `imageSampleDistance` = 1.0
        * `maximumSamplesPerRay` = 1000
        * `autoAdjustSampleDistances` = true
        * `blendMode` = [BlendMode.COMPOSITE_BLEND](https://github.com/Kitware/vtk-js/blob/master/Sources/Rendering/Core/VolumeMapper/Constants.js#L1-L6)
        * `averageIPScalarRange` = -1000000.0, 1000000.0
        
    On top of those previous settings we provide additional properties to configure a lookup table using one of our available [colorMapPreset](https://github.com/Kitware/vtk-js/blob/master/Sources/Rendering/Core/ColorTransferFunction/ColorMaps.json) and a convinient *colorDataRange* to rescale to color map to your area of focus.

    Because it can be cumbersome and difficult to properly configure your volume rendering properties, it is convenient to add as first child to that representation a `vtk_volumecontroller` which will give you a UI to drive some of those parameters while also providing better defaults for your `vtk_imagedata`.                
    """),

    html_h3("VolumeController"),
    dcc_markdown("""
    The `vtk_volumecontroller` provide a convenient UI element to control your Volume Rendering settings and can be tuned with the following set of properties:
    * `size`: width, height in pixel for the controller UI
    * `rescaleColorMap`: true/false to use the opacity piecewise function to dynamically rescale the color map or keep the full data range as color range.
    """),

    html_h3("SliceRepresentation"),
    dcc_markdown("""
    The `vtk_slicerepresentation` lets you see a slice within a 3D image. That slice can be along i,j,k or x,y,z if your volume contains an orientation matrix.

    The following set of properties lets you pick which slice you want to see. Only one of those properties can be used at a time.

    * `iSlice`, `jSlice`, `kSlice`: Index based slicing
    * `xSlice`, `ySlice`, `zSlice`: World coordinate slicing

    Then we have the standard representation set or properties with their defaults:
    * `actor`:
        * `origin` = (0,0,0)
        * `position` = (0,0,0)
        * `scale` = (1,1,1)
        * `visibility` = 1
        * `pickable` = 1
        * `dragable` = 1
        * `orientation` = (0,0,0)

    * `property`:
        * `independentComponents` = false
        * `interpolationType` = [InterpolationType.LINEAR](https://github.com/Kitware/vtk-js/blob/master/Sources/Rendering/Core/ImageProperty/Constants.js#L1-L4)
        * `colorWindow` = 255
        * `colorLevel` = 127.5
        * `ambient` = 1.0
        * `diffuse` = 0.0
        * `opacity` = 1.0
             
    * `mapper`:
        * `customDisplayExtent`: 0, 0, 0, 0
        * useCustomExtents: false
        * slice: 0
        * slicingMode: [SlicingMode.NONE](https://github.com/Kitware/vtk-js/blob/master/Sources/Rendering/Core/ImageMapper/Constants.js#L1-L9)
        * closestIJKAxis: { ijkMode: [SlicingMode.NONE](https://github.com/Kitware/vtk-js/blob/master/Sources/Rendering/Core/ImageMapper/Constants.js#L1-L9), flip: false }
        * renderToRectangle: false
        * sliceAtFocalPoint: false  
    """),

    html_h3("PointCloudRepresentation"),
    dcc_markdown("""
    The `vtk_pointcloudrepresentation` is just a helper using the following structure to streamline rendering a point cloud dataset. The code snippet below is not complete but it should provide you with some understanding of the kind of simplification that is happening under the hood.

    ```julia
    function vtk_pointcloudrepresentation(; kwargs...) 
        return vtk_geometryrepresentation(
            id=kwargs[:id],
            colorMapPreset=kwargs[:colorMapPreset],
            colorDataRange=kwargs[:colorDataRange],
            property=kwargs[:property],
            children=[
                vtk_polydata(
                    points=kwargs[:xyz],
                    connectivity="points",
                    children=[
                        vtk_pointdata([
                            vtk_dataarray(
                                registration="setScalars",
                                values{kwargs[:scalars]]}
                            )
                        ])
                    ],
                )
            ],
        )
    end    
    ```

    The set of convenient properties are as follows:
    * xyz = list of xyz of each point inside a flat array
    * `colorMapPreset` = color preset name to use
    * `colorDataRange` = rescale color map to provided that range
    * `property` = {} # Same as GeometryRepresentation/property
    * `rgb / rgba / scalars` = `[...]` let you define the field you want to color your point cloud with. The rgb(a) expects numbers up to 255 for each component: Red Green Blue (Alpha).
    """),

    html_h3("VolumeDataRepresentation"),
    dcc_markdown("""
    The `vtk_volumedatarepresentation` is just a helper using the following structure to streamline rendering a volume. The code snippet below is not complete but it should provide you with some understanding of the kind of simplification that is happening under the hood.

    ```julia
    function vtk_volumedatarepresentation(; kwargs...) 
        return vtk_volumerepresentation(
            id=kwargs[:id].get("id"),
            colorMapPreset=kwargs[:colorMapPreset],
            colorDataRange=kwargs[:colorDataRange],
            property=kwargs[:property],
            mapper=kwargs[:mapper],
            volume=kwargs[:volume],
            children=[
                vtk_volumecontroller(
                    rescaleColorMap=kwargs[:rescaleColorMap],
                    size=kwargs[:size],
                ),
                vtk_imagedata(
                    dimensions=kwargs[:dimensions],
                    origin=kwargs[:origin],
                    spacing=kwargs[:spacing],
                    children=[
                        vtk_pointdata([
                            vtk_dataarray(
                                registration="setScalars",
                                values=kwargs[:scalars],
                            )
                        ])
                    ],
                ),
            ],
        )
    end
    ```

    The set of the convenient properties are as follows:
    * `dimensions`: Number of points along x, y, z
        * `spacing`: Spacing along x, y, z between points in world
        * `origin`: World coordinate of the lower left corner of your vtkImageData (i=0, j=0, k=0).
        * `rgb`: Use RGB values to attach to the points/vertex
        * `rgba`: Use RGBA values to attach to the points/vertex
        * `scalars`: Field values to attach to the points
        * `scalarsType`: Types of numbers provided in scalars (i.e. Float32Array, Uint8Array, ...)
        * `mapper`: Properties to set to the mapper
        * `volume`: Properties to set to the volume
        * `property`: Properties to set to the volume.property
        * `colorMapPreset`: Preset name for the lookup table color map
        * `volumeController`: Show volumeController
        * `controllerSize`: Controller size in pixels
        * `rescaleColorMap`: Use opacity range to rescale color map    
    """)
    end
end