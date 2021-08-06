@doc_chapter "/dash_bio/ngl_molecule_viewer" begin

@example nglmoleculeviewer_default "default.jl"
@example nglmoleculeviewer_heightwidth "height_width.jl"
@example nglmoleculeviewer_moleculestyle "molecule_style.jl"
@example nglmoleculeviewer_multiplemolecules "multiple_molecules.jl"
@example nglmoleculeviewer_savingimage "saving_image.jl"
@example nglmoleculeviewer_selectchainatom "select_chain_atom.jl"
@example nglmoleculeviewer_stage "stage.jl"

@layout html_div() do

    html_h1("NglMoleculeViewer Examples and Reference"),
    html_a(children=[
      html_b("See NglMoleculeViewer in action.")
      ], href="http://dash-gallery.plotly.host/dash-ngl-molecule-viewer"
    ),

    html_h3("Default NglMoleculeViewer"),

    dcc_markdown("""
    An example of a default NglMoleculeViewer component without any extra properties.
    """),
    source"nglmoleculeviewer_default",
    layout"nglmoleculeviewer_default",

    html_h3("Molecule Styles"),

    dcc_markdown("""
    Molecule styles and representations can be styled with the `molStyles` property which accepts a `Dict` of arguments. Molecule representations can be combined and stacked together by setting a `list` of representations. The following representations are available:

    * Molecules Styles: `backbone`, `ball+stick`, `cartoon`, `hyperball`, `licorice`, `line`, `ribbon`, `rope`, `spacefill`, `surface`, `trace`, `tube`
    * Additional Representations: `axes`, `axes+box`, `helixorient`, `unitcell`
    With the `sideByside` key, we can choose whether multiple molecules should be represented side-by-side or intertwined. Note that in `sideByside` mode, the molecules cannot be independently rotated or panned.
    """),
    source"nglmoleculeviewer_moleculestyle",
    layout"nglmoleculeviewer_moleculestyle",

    html_h3("Multiple Molecules"),

    dcc_markdown("""
    Multiple molecules can be visualized by adding entries
     to the data list. In the example below, we use multiple
      dropdown selections to add molecules to the stage. Each
      molecule can have its own set of atoms and residues
       highlighted. Individual molecules can be interacted with
        by holding down the `CTRL` key. If adding or removing
         molecules from the stage, make sure the `resetView` prop is set to false.
    """),
    source"nglmoleculeviewer_multiplemolecules",
    layout"nglmoleculeviewer_multiplemolecules",

    html_h3("Height and Width"),

    dcc_markdown("""
    The Height and Width (in px or as a number) of the container in which the molecules will be displayed.
    """),
    source"nglmoleculeviewer_heightwidth",
    layout"nglmoleculeviewer_heightwidth",

    html_h3("Stage"),

    dcc_markdown("""
    Similar to the molecular styles, the stage parameters
     can also be set. The background color, quality of the
      render, and the camera perspective are part of the
       `stageParameters` prop, and can be passed as keys of a
        `Dict`.
    """),
    source"nglmoleculeviewer_stage",
    layout"nglmoleculeviewer_stage",

    html_h3("Saving an Image"),

    dcc_markdown("""
    An image with the selected parameters can be saved as a
     `.PNG` by flagging the `downloadImage` property. With the
      `imageParameters` optional dict, we can specify whether 
      to enable `antialias`, `transparency`, or `trim`, and set the 
      `filename` for the saved image.
    """),
    source"nglmoleculeviewer_savingimage",
    layout"nglmoleculeviewer_savingimage",

    html_h3("Selecting Molecule Chains and Atoms"),

    dcc_markdown("""
    The molecule data must be entered in a specific format to define how many molecules should be shown and/or which chains on those molecules are shown. Specific ranges of amino acids and atoms on the molecule can be highlighted as well. To see which filtering options are available to use with a particular molecule, it may be helpful to view the PDB file entries for a range of atoms which specify the atom names, the residues they belong to, and a one-letter code for the chain.

    The following format needs to be used:
    ```
    pdbID1.chain:start-end@atom1,atom2
    ```
    * . indicates that only one chain should be shown
    * : indicates that a specific amino acids range should be shown (e.g. 1-50)
    * @ indicates that chosen atoms should be highlighted (e.g. @50,100,150)
    
    The `ngl_parser` helper function can help simplify this process by generating the appropriate data format based on the string provided in the above format as the `pdb_id` argument. It will return a dictionary with the contents of the PDB file, selected residues and ranges, and atoms highlighted in the color selected. Specify whether the data path is locally or remotely hosted with the local boolean argument.

    The color and radius of chosen atoms can be set through the `molStyles` property with the "chosenAtomsColor" and "chosenAtomsRadius" keys.
    """),
    source"nglmoleculeviewer_selectchainatom",
    layout"nglmoleculeviewer_selectchainatom",

    html_h3("Ngl Molecule Viewer Properties"),
    dcc_markdown("""
    Access this documentation in your Julia REPL with:
    ```julia    
    ?help dashbio_nglmoleculeviewer
    ```
    Our recommended IDE for writing Dash apps is Dash
      Enterprise's [Data Science Workspaces](https://plotly.com/dash/workspaces/),
       which has typeahead support for Dash Component Properties. [Find out if your company is using Dash Enterprise](https://go.plotly.com/company-lookup).
    """),
    dcc_markdown(string(@doc dashbio_nglmoleculeviewer))

end

end
