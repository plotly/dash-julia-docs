module chapters_dash_bio_nglmoleculeviewer
using Dash, DashHtmlComponents, DashCoreComponents, Chain, Pkg

include("../../../utils.jl")

export examples

examples_path = joinpath(@__DIR__, "examples")

nglmoleculeviewer_default = LoadExampleCode(string(examples_path, "/default.jl"))

nglmoleculeviewer_heightwidth = LoadExampleCode(string(examples_path, "/height_width.jl"))

nglmoleculeviewer_moleculestyle = LoadExampleCode(string(examples_path, "/molecule_style.jl"))

nglmoleculeviewer_multiplemolecules = LoadExampleCode(string(examples_path, "/multiple_molecules.jl"))

nglmoleculeviewer_savingimage = LoadExampleCode(string(examples_path, "/saving_image.jl"))

nglmoleculeviewer_selectchainatom = LoadExampleCode(string(examples_path, "/select_chain_atom.jl"))

nglmoleculeviewer_stage = LoadExampleCode(string(examples_path, "/stage.jl"))


examples = [
  nglmoleculeviewer_default, 
  nglmoleculeviewer_heightwidth,
  nglmoleculeviewer_moleculestyle, nglmoleculeviewer_multiplemolecules,
  nglmoleculeviewer_savingimage, nglmoleculeviewer_selectchainatom,
  nglmoleculeviewer_stage
]

app =  dash()

nglmoleculeviewer_default.callback!(app)

app.layout = html_div() do

    html_h1("NglMoleculeViewer Examples and Reference"),
    html_a(children=[
      html_b("See NglMoleculeViewer in action.")
      ], href="http://dash-gallery.plotly.host/dash-ngl-molecule-viewer"
    ),

    html_h3("Default NglMoleculeViewer"),

    dcc_markdown("""
    An example of a default NglMoleculeViewer component without any extra properties.
    """),
    nglmoleculeviewer_default.source_code,
    nglmoleculeviewer_default.layout,

    html_h3("Molecule Styles"),

    dcc_markdown("""
    Molecule styles and representations can be styled with the `molStyles` property which accepts a `Dict` of arguments. Molecule representations can be combined and stacked together by setting a `list` of representations. The following representations are available:

    * Molecules Styles: `backbone`, `ball+stick`, `cartoon`, `hyperball`, `licorice`, `line`, `ribbon`, `rope`, `spacefill`, `surface`, `trace`, `tube`
    * Additional Representations: `axes`, `axes+box`, `helixorient`, `unitcell`
    With the `sideByside` key, we can choose whether multiple molecules should be represented side-by-side or intertwined. Note that in `sideByside` mode, the molecules cannot be independently rotated or panned.
    """),
    nglmoleculeviewer_moleculestyle.source_code,
    nglmoleculeviewer_moleculestyle.layout,

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
    nglmoleculeviewer_multiplemolecules.source_code,
    nglmoleculeviewer_multiplemolecules.layout,

    html_h3("Height and Width"),

    dcc_markdown("""
    The Height and Width (in px or as a number) of the container in which the molecules will be displayed.
    """),
    nglmoleculeviewer_heightwidth.source_code,
    nglmoleculeviewer_heightwidth.layout,

    html_h3("Stage"),

    dcc_markdown("""
    Similar to the molecular styles, the stage parameters
     can also be set. The background color, quality of the
      render, and the camera perspective are part of the
       `stageParameters` prop, and can be passed as keys of a
        `Dict`.
    """),
    nglmoleculeviewer_stage.source_code,
    nglmoleculeviewer_stage.layout,

    html_h3("Saving an Image"),

    dcc_markdown("""
    An image with the selected parameters can be saved as a
     `.PNG` by flagging the `downloadImage` property. With the
      `imageParameters` optional dict, we can specify whether 
      to enable `antialias`, `transparency`, or `trim`, and set the 
      `filename` for the saved image.
    """),
    nglmoleculeviewer_savingimage.source_code,
    nglmoleculeviewer_savingimage.layout,

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
    nglmoleculeviewer_selectchainatom.source_code,
    nglmoleculeviewer_selectchainatom.layout,

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
    dcc_markdown("""
    `id` (String; optional): The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.

    `data` (list of Dicts; default [ Dict( filename: 'placeholder', ext: '', selectedValue: 'placeholder', chain: 'ALL', aaRange: 'ALL', chosen: Dict( chosenAtoms: '', chosenResidues: '', ), color: 'red', config: Dict( input: '', type: 'text/plain', ), uploaded: False, resetView: False, ),]): The data (in JSON format) that will be used to display the molecule filename: name of the used pdb/cif file ext: file extensions (pdb or cif) selectedValue: pdbString chain: ALL if the whole molecule shoud be displayed, e.g. A for showing only chain A aaRange: ALL if the whole molecule should be displayed, e.g. 1:50 for showing only 50 atoms color: chain color chosen.atoms: String of the chosen Atoms, e.g. 50,100,150 --> chosen eatoms changed to colored 'ball' chosen.residues: String of the chosen residues, e.g. 50,100,150 --> C alpha of chosen residue changed to colored 'ball' config.input: content of the pdb file config.type: format of config.input uploaded: bool if file from local storage (False) or uploaded by user (True) resetView: bool if the selection did not change but the view should be resettet (True).

    `data` is a list of Dicts with keys:

    * `aaRange` (String; required)
    
    * `chain` (String; required)

    * `chosen` (Dict; optional)
    
    * `chosen` is a Dict with keys:
    
        * `atoms` (String; required)

        * `residues` (String; required)
    
    * `color` (String; required)
    
    * `config` (Dict; optional)
    
    * `config` is a Dict with keys:
    
        * `input` (String; required)

        * `type` (String; required)
    
    * `ext` (String; optional)
    
    * `filename` (String; required)
    
    * `resetView` (Bool; required)
    
    * `selectedValue` (String; required)
    
    * `uploaded` (Bool; required)

    `downloadImage` (Bool; default False): flag if download image was selected.

    `height` (String | Number; default '600px'): The height (in px or as a Number) of the container in which the molecules will be displayed.

    `imageParameters` (Dict; default `Dict( antialias: True, transparent: True, trim: True, defaultFilename: 'dash-bio_ngl_output',)`): Parameters (in JSON format) for exporting the image.

    `imageParameters` is a Dict with keys:

    `antialias` (Bool; optional)

    `defaultFilename` (String; optional)

    `transparent` (Bool; optional)

    `trim` (Bool; optional)

    `molStyles` (Dict; default `Dict( representations: ['cartoon', 'axes+box'], chosenAtomsColor: '#ffffff', chosenAtomsRadius: 1, molSpacingXaxis: 100, sideByside: False,)`): The data (in JSON format) that will be used to style the displayed molecule representations: one or multiple selected molecule representation - Possible molecule styles: 'backbone,'ball+stick','cartoon', 'hyperball','licorice','line', 'ribbon',''rope','spacefill','surface','trace','tube' - Possible additional representations: 'axes','axes+box','helixorient','unitcell' chosenAtomsColor: color of the 'ball+stick' representation of the chosen atoms chosenAtomsRadius: radius of the 'ball+stick' representation of the chosen atoms molSpacingXaxis: distance on the xAxis between each molecule.

    `molStyles` is a Dict with keys:

    `chosenAtomsColor` (String; required)

    `chosenAtomsRadius` (Number; required)

    `molSpacingXaxis` (Number; required)

    `representations` (list of Strings; optional)

    `sideByside` (Bool; required)

    `pdbString` (String; optional): Variable which defines how many molecules should be shown and/or which chain The following format needs to be used: pdbID1.chain:start-end@atom1,atom2pdbID2.chain:start-end . indicates that only one chain should be shown : indicates that a specific amino acids range should be shown (e.g. 1-50) @ indicates that chosen atoms should be highlighted (e.g. @50,100,150) indicates that more than one protein should be shown.

    `stageParameters` (Dict; default `Dict( quality: 'medium', backgroundColor: 'white', cameraType: 'perspective',)`): Parameters (in JSON format) for the stage object of ngl. Currently implemented are render quality, background color and camera type quality: auto, low, medium, high (default: auto) backgroundColor: white / black (default: white) cameraType: perspective / orthographic (default: perspective).

    `stageParameters` is a Dict with keys:

    `backgroundColor` (String; optional)

    `cameraType` (String; optional)

    `quality` (String; optional)

    `width` (String | Number; default '600px'): The width (in px or as a Number) of the container in which the molecules will be displayed.
    """)

end

end
