@doc_chapter "/dash-bio/molecule2dviewer" begin

@example molecule2dviewer_default "default.jl"
@example molecule2dviewer_modeldata "model_data.jl"
@example molecule2dviewer_selectedatom "selected_atom.jl"

@layout html_div() do

    html_h1("Molecule2dViewer Examples and Reference"),
    html_a(children=[
      html_b("See Molecule2dViewer in action.")
      ], href="http://dash-gallery.plotly.host/dash-molecule-2d-viewer"
    ),

    html_h3("Default Molecule2dViewer"),

    dcc_markdown("""
    An example of a default Molecule2dViewer component without any extra properties.
    """),
    source"molecule2dviewer_default",
    layout"molecule2dviewer_default",

    html_h3("Selected Atom Ids"),

    dcc_markdown("""
    Highlight specific atoms in the molecule.
    """),
    source"molecule2dviewer_selectedatom",
    layout"molecule2dviewer_selectedatom",

    html_h3("Model Data"),

    dcc_markdown("""
    Change the bonds and atoms in the molecule.
    """),
    source"molecule2dviewer_modeldata",
    layout"molecule2dviewer_modeldata",

    html_h3("Molecule 2D Viewer Properties"),
    dcc_markdown("""
    Access this documentation in your Julia REPL with:
    ```julia    
    ?help dashbio_molecule2dviewer
    ```
    Our recommended IDE for writing Dash apps is Dash
      Enterprise's [Data Science Workspaces](https://plotly.com/dash/workspaces/),
       which has typeahead support for Dash Component Properties. [Find out if your company is using Dash Enterprise](https://go.plotly.com/company-lookup).
    """),
    dcc_markdown(string(@doc dashbio_molecule2dviewer))

end

end
