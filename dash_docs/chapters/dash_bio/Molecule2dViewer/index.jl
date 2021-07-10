module chapters_dash_bio_molecule2dviewer
using Dash, DashHtmlComponents, DashCoreComponents, Chain, Pkg

include("../../../utils.jl")

export examples

examples_path = joinpath(@__DIR__, "examples")

molecule2dviewer_default = LoadExampleCode(string(examples_path, "/default.jl"))

molecule2dviewer_modeldata = LoadExampleCode(string(examples_path, "/model_data.jl"))

molecule2dviewer_selectedatom = LoadExampleCode(string(examples_path, "/selected_atom.jl"))


examples = [
  molecule2dviewer_default
]

app =  dash()

molecule2dviewer_default.callback!(app)

app.layout = html_div() do

    html_h1("Molecule2dViewer Examples and Reference"),
    html_a(children=[
      html_b("See Molecule2dViewer in action.")
      ], href="http://dash-gallery.plotly.host/dash-molecule-2d-viewer"
    ),

    html_h3("Default Molecule2dViewer"),

    dcc_markdown("""
    An example of a default Molecule2dViewer component without any extra properties.
    """),
    molecule2dviewer_default.source_code,
    molecule2dviewer_default.layout,

    html_h3("Selected Atom Ids"),

    dcc_markdown("""
    Highlight specific atoms in the molecule.
    """),
    molecule2dviewer_selectedatom.source_code,
    molecule2dviewer_selectedatom.layout,

    html_h3("Model Data"),

    dcc_markdown("""
    Change the bonds and atoms in the molecule.
    """),
    molecule2dviewer_modeldata.source_code,
    molecule2dviewer_modeldata.layout,

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
    dcc_markdown("""
    `id` (String; optional): The ID used to identify this component in callbacks.

    `height` (Number; default 500): The height of the SVG element.

    `modelData` (dict; default Dict( nodes: [], links: [],)): Description of the molecule to display.

    `modelData` is a dict with keys:

    * `links` (list of dicts; optional)
    `links` is a list of dicts with keys:
    
        * `bond` (Number; optional)

        * `distance` (Number; optional)

        * `id` (Number; optional)

        * `source` (optional)

        * `strength` (Number; optional)

        * `target` (optional)

    * `nodes` (list of dicts; optional)
    `nodes` is a list of dicts with keys:
        * `atom` (String; optional)

        * `id` (Number; optional)

    `selectedAtomIds` (list of Numbers; optional): The selected atom IDs.

    `width` (Number; default `500`): The width of the SVG element.
    """)

end

end
