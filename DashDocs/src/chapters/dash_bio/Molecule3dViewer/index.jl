@doc_chapter "/dash_bio/molecule3dviewer" begin

@example molecule3dviewer_default "default.jl"
@example molecule3dviewer_backgroundcolor "background_color.jl"
@example molecule3dviewer_isosurfaces "isosurfaces.jl"
@example molecule3dviewer_labels "labels.jl"
@example molecule3dviewer_selectiontype "selection_type.jl"
@example molecule3dviewer_shapes "shapes.jl"

@layout html_div() do

    html_h1("Molecule3dViewer Examples and Reference"),
    html_a(children=[
      html_b("See Molecule3dViewer in action.")
      ], href="http://dash-gallery.plotly.host/dash-molecule-3d-viewer"
    ),

    html_h3("Default Molecule3dViewer"),

    dcc_markdown("""
    An example of a default Molecule3dViewer component without any extra properties.
    """),
    source"molecule3dviewer_default",
    layout"molecule3dviewer_default",

    html_h3("Selection Type"),

    dcc_markdown("""
    Choose what gets highlighted with the same color upon selection.
    """),
    source"molecule3dviewer_selectiontype",
    layout"molecule3dviewer_selectiontype",

    html_h3("Background Color/Opacity"),

    dcc_markdown("""
    Change the background color and opacity of the canvas on which Mol3D is rendered.
    """),
    source"molecule3dviewer_backgroundcolor",
    layout"molecule3dviewer_backgroundcolor",

    html_h3("Labels"),

    dcc_markdown("""
    Add labels corresponding to the atom of the molecule. Label styles can be set with additional parameters. For styling keys, see [https://3dmol.csb.pitt.edu/doc/types.html#LabelSpec](https://3dmol.csb.pitt.edu/doc/types.html#LabelSpec)
    """),
    source"molecule3dviewer_labels",
    layout"molecule3dviewer_labels",

    html_h3("Shapes"),

    dcc_markdown("""
    Add predefined renderable shapes to the molecule. Supported shape types are Arrow, Sphere, and Cylinder.
    """),
    source"molecule3dviewer_shapes",
    layout"molecule3dviewer_shapes",

    html_h3("Isosurfaces"),

    dcc_markdown("""
    Render a 3D isosurface. Volumetric orbital data must be provided in the `cube` file format.
    """),
    source"molecule3dviewer_isosurfaces",
    layout"molecule3dviewer_isosurfaces",

    html_h3("Molecule 3D Viewer Properties"),
    dcc_markdown("""
    Access this documentation in your Julia REPL with:
    ```julia    
    ?help dashbio_molecule3dviewer
    ```
    Our recommended IDE for writing Dash apps is Dash
      Enterprise's [Data Science Workspaces](https://plotly.com/dash/workspaces/),
       which has typeahead support for Dash Component Properties. [Find out if your company is using Dash Enterprise](https://go.plotly.com/company-lookup).
    """),
    dcc_markdown(string(@doc dashbio_molecule3dviewer))

end

end
