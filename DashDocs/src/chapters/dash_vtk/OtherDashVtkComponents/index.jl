@doc_chapter "/dash_vtk/other_dashVtk_components" begin 

    @layout html_div() do 
    
        html_h1("Other DashVtk Components"),
    
        dcc_markdown("
        ## Mesh

        This element, `vtk_mesh` is a helper on top of `vtk_polydata` which has a Python helper function that goes with it which will help you map a vtkDataSet into a single property of the Mesh element.

        ```
        function vtk_mesh(; kwargs...) 
                 return vtk_polydata(
                     **kwargs.get('state').get('mesh'),
                     children=[
                         DashVtk.[kwargs.get('state').get('field').get('location')]([
                             vtk_dataarray(
                                 **kwargs.get('state').get('field'),
                             )
                         ])
                     ]
                 )
        end
        ```

        Note that we assume that `state.field` exists when we use `kwargs.get('state').get('field').get('location')` in the snippet above. However, `state.field` is optional, so when it is not available the `children` is not created and `kwargs.get('state').get('field').get('location')` would not be needed. 

        The `vtk_mesh` element expects a single state property that is internally split into 2 elements to represent the geometry and the field that you want to optionally attach to your mesh. The structure should be defined as follows:

             - `state`
                        - `vtk_mesh`: (Contains the properties of `vtk_polydata`)
                                       - points=[]
                                       - verts=[]
                                       - lines=[]
                                       - polys=[]
                                       - strips=[]
                                       - connectivity="manual" # manual, points, triangles, strips

                        - `field`: (Contains the properties of `vtk_dataarray`)
                                    - location: `"vtk_pointdata"`/`"vtk_celldata"`
                                    - name: Name of the field (optional)
                                    - values: Array of values for the field
                                    - numberOfComponents: Number of components per unit/cell
                                    - type: Name of TypedArray to use (Unit8Array, Int8Array, Float32Array, Float64Array...)

        
        ## Volume

        This element, `vtk_volume` is a helper on top of `vtk_imagedata` which has a Julia helper function that goes with it which will help you to map a `vtk_imagedata` into a single property of `vtk_volume` element.

        ```
        function vtk_volume(; kwargs...) 
                 return vtk_imagedata(
                     **kwargs.get('state').get('image'),
                     children=[
                         vtk_pointdata([
                             vtk_dataarray(
                                 **kwargs.get('state').get('field'),
                             )
                         ])
                     ]
                 )
        end
        ```

        The `vtk_volume` element expects a single `state` property that is internally split into 2 elements to represent the field that you want to optionally attatch to your mesh. The structure could be defined as follows:

                    - `state`
                               - image: (Contains the properties of `vtk_imagedata`)
                                        - dimensions
                                        - spacing
                                        - origin
                                        
                               - field: (Contains the properties of `vtk_dataarray`)
                                        - values: Array of values for the field
                                        - numbeOfComponents: Number of components per point/cell
                                        - type: Name of TypedArray to use (Uint8Array, Int8Array, Float32Array, Float64Array...)
                                        
                                        

        ## Algorithm

        This element, `vtk_algorithm` allows you to create and configure a vtk.js class. This element expect only 2 properties:

                - `vtkClass`: The name of the `vtkClass` to instantiate.
                - `state`: The set of properties to apply on the given `vtkClass`.

        The current list of classes available to instantiate are:

                - `vtkClass`:
                              - vtkConcentricCylinderSource
                              - vtkConeSource
                              - vtkCubeSource
                              - vtkCylinderSource
                              - vtkLineSource
                              - vtkPlaneSource
                              - vtkPointSource
                              - vtkSphereSource
                              - vtkWarpScalar

                - `state`: See the references above for the properties available for each `vtkClass`.

        The following example uses a vtk source in vtk.js to generate a mesh:

        
        ")
    
    end
    
    end