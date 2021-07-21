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
    dcc_markdown("""
    `id` (String; optional): The ID used to identify this component in callbacks.

    `atomLabelsShown` (Boolean; optional): Property to either show or hide labels.

    `backgroundColor` (String; default '#FFFFFF'): Property to change the background color of the molecule viewer.

    `backgroundOpacity` (Number; default 0): Property to change the background opacity - ranges from 0 to 1.

    `labels` (list of Dicts; optional): Labels corresponding to the atoms of the molecule. Each label has a text field, a String containing the label content, and can have many other styling fields as described in [https://3dmol.csb.pitt.edu/doc/types.html#LabelSpec](https://3dmol.csb.pitt.edu/doc/types.html#LabelSpec).

    `modelData` (Dict; optional): The data that will be used to display the molecule in 3D The data will be in JSON format and should have two main Dictionaries - atoms, bonds.

    `modelData` is a Dict with keys:

    * `atoms` (list; optional)
    
    * `bonds` (list; optional)

    `orbital` (Dict; optional): Add an isosurface from volumetric data provided in the cube_file.

    `orbital` is a Dict with keys:

    * `cube_file` (String; optional): The filepath containing raw volumetric data for vertex coloring.
    
    * `iso_val` (Number; optional): The isovalue to draw the surface at.
    
    * `negativeVolumetricColor` (String; optional): Color for the negative value of the isosurface orbital.
    
    * `opacity` (Number; optional): Transparency of the surface, between 0 and 1.
    
    * `positiveVolumetricColor` (String; optional): Color for the positive value of the isosurface orbital.
    
    `selectedAtomIds` (list; optional): Property that stores a list of all selected atoms.

    `selectionType` (a value equal to: 'atom', 'residue', 'chain'; default 'atom'): The selection type - may be atom, residue or chain.

    `shapes` (list of Dicts; optional): Add a predefined renderable shape objects to the molecule. Valid shape types are Arrow, Sphere, and Cylinder.

    `styles` (list of Dicts; optional): Property that can be used to change the representation of the molecule. Options include sticks, cartoon and sphere.

    `styles` is a list of Dicts with keys:

    * `color` (String; optional)
    
    * `visualization_type` (a value equal to: 'cartoon', 'sphere', 'stick'; optional)
    """)

end

end
