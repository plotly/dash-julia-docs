@doc_chapter "/dash_vtk/structure_datasets" begin 

@example structuredatasets_image_data "image_data.jl"
@example structuredatasets_poly_data "poly_data.jl"

@layout html_div() do 
    
html_h1("Structure of Datasets"),
dcc_markdown("""
In `vtk.js` because we mostly focus on Rendering we only have two types of data structures. We have a `vtk_polydata` that can be used for Geometry Rendering and `vtk_imagedata` that can be used for volume rendering. In proper `VTK` we have more types of DataSets and we have several filters that help you convert from one type to another. 

Here we explain some of the foundation of those data structures so you could create them by hand if you wanted to. 
"""),

html_h3("Image Data"),
dcc_markdown("""
An Image Data is an implicit grid that is axis aligned as shown in the picture below.

![ImageData](/assets/images/vtk/imagedata.jpg)

The set of properties that can be given to `vtk_imagedata` are as follows:
* `origin`: location of the bottom left corner of the grid in the 3D world
* `dimensions`: how many points we have along each axes
* `spacing`: what is the uniform spacing along each axis between the points

A concrete example would be a grid of 5 points or 4 cells along each axes which will go from `[-2, 2]` along each axis.

```julia
vtk_imagedata(
            dimension = [5, 5, 5],
            origin = [-2, -2, -2],
            spacing = [1, 1, 1],
    )
```
"""),

source"structuredatasets_image_data",
layout"structuredatasets_image_data",

html_h3("Poly Data"),
dcc_markdown("""
A Poly Data is a surface mesh composed of `points` and `cells`. The cells can be:
* `verts`: Vertex or points to show as a tiny square on the screen
* `lines`: Lines that connect points into a one segment or multi segment line
* `polys`: Polygons which are convex surfaces such as triangles, rectangles, circles.
* `strips`: Triangle strips efficiently combine triangles together with no repeated points just for connectivity

The way cells are defined is via an index-based array that maps to a given point index. For example let's pretend you want to create a line with 2 segments, you will need at least 3 points defined in the `points` array. If those points are defined first in your `points` array, then the `lines` array should be filled as follows:

```julia
nb_points = 3
lines = [nb_points, 0, 1, 2]
```

To create 2 lines independent of each other, you can do it as follows:

```julia
lines = [
           3, 0, 1, 2,        # First line of 2 segments / 3 points
           2, 3, 4,           # Second line of 1 segment / 2 points
           4, 10, 11, 12, 14  # Third line of 3 segments / 4 points
        ]        
```

You can see a concrete example in the image below:

![PolyData](/assets/images/vtk/polydata.jpg)
"""),

source"structuredatasets_poly_data",
layout"structuredatasets_poly_data",

html_h3("Fields"),
dcc_markdown("""
Having a grid is a good start, but mosst likely you would want to attach a field to a given mesh so you can start looking at it in a 3D context.

Fields are arrays that map to either *Points* or *Cells*. They couls be scalars or vectors of different size. 

The diagram below tries to difference between fields located on points vs cells in term of rendering, but it also truly has a different meaning based on the type of data that you have.

![Fields](/assets/images/vtk/fields.jpg)

The example below shows how to attach fields to a dataset (`vtk_polydata` and/or `vtk_imagedata`).

Caution: By convention we always attach data to points in `vtk_imagedata` for doind `vtk_volumerendering` and the array must be registered as scalars. 

```julia
vtk_imagedata(
            dimensions = [5, 5, 5],
            origin = [-2, -2, -2],
            spacing = [1, 1, 1],
            children = [
                vtk_pointdata([
                    vtk_dataarray(
                        registration="setScalars",
                        values=collect(0:124),
                    )
                ])
            ],
        )

        vtk_polydata(
            points=[
                0, 0, 0,
                1, 0, 0,
                0, 1, 0,
                1, 1, 0,
            ],
            lines = [3, 1, 3, 2],
            polys = [3, 0, 1, 2],
            children=[
                vtk_pointdata([
                    vtk_dataarray(
                        name="onPoints",
                        values=[0, 0.33, 0.66, 1]
                    )
                ]),
                vtk_celldata([
                    vtk_dataarray(
                        name="onCells",
                        values=[0, 1],
                    )
                ])
            ],
        )
```
""")

    end
end