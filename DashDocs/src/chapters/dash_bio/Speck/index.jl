@doc_chapter "/dash_bio/speck" begin

@example speck_default "default.jl"
@example speck_renderingstyle "rendering_style.jl"
@example speck_scrollzoom "scroll_zoom.jl"

@layout html_div() do

    html_h1("Speck Examples and Reference"),
    html_a(children=[
      html_b("See Speck in action.")
      ], href="http://dash-gallery.plotly.host/dash-speck"
    ),

    html_h3("Default Speck"),

    dcc_markdown("""
    An example of a default Speck component without any extra properties.
    """),
    source"speck_default",
    layout"speck_default",

    html_h3("Molecule Rendering Styles"),

    dcc_markdown("""
    Change the level of atom outlines, ambient occlusion, and more with the "view" parameter.
    """),
    source"speck_renderingstyle",
    layout"speck_renderingstyle",

    html_h3("Scroll To Zoom"),

    dcc_markdown("""
    Allow for the scroll wheel to control zoom for the molecule.
    """),
    source"speck_scrollzoom",
    layout"speck_scrollzoom",

    html_h3("Speck Properties"),
    dcc_markdown("""
    Access this documentation in your Julia REPL with:
    ```julia    
    ?help dashbio_speck
    ```
    Our recommended IDE for writing Dash apps is Dash
      Enterprise's [Data Science Workspaces](https://plotly.com/dash/workspaces/),
       which has typeahead support for Dash Component Properties. [Find out if your company is using Dash Enterprise](https://go.plotly.com/company-lookup).
    """),
    dcc_markdown("""
    `id` (String; optional): The ID used to identify this component in Dash callbacks.

    `data` (list of Dicts; optional): The xyz file data; a list of atoms such that each atom has a Dictionary defining the x, y, and z coordinates along with the atom's symbol.

    `data` is a list of Dicts with keys:

    * symbol (String; optional)
    
    * x (Number; optional)
    
    * y (Number; optional)
    
    * z (Number; optional)

    `presetView` (a value equal to: 'default', 'stickball', 'toon', 'licorice'; optional): One of several pre-loaded views: default, stick-ball, toon, and licorice.

    `scrollZoom` (Bool; optional): The option of whether or not to allow scrolling to control the zoom.

    `view` (Dict; default speckView.new()): An object that determines and controls various parameters related to how the molecule is displayed.

    `view` is a Dict with keys:

    * `ao` (Number; optional)
    
    * `aoRes` (Number; optional)
    
    * `aspect` (Number; optional)
    
    * `atomScale` (Number; optional)
    
    * `atomShade` (Number; optional)
    
    * `bondScale` (Number; optional)
    
    * `bondShade` (Number; optional)
    
    * `bondThreshold` (Number; optional)
    
    * `bonds` (Bool; optional)
    
    * `brightness` (Number; optional)
    
    * `dofPosition` (Number; optional)
    
    * `dofStrength` (Number; optional)
    
    * `fxaa` (Number; optional)
    
    * `outline` (Number; optional)
    
    * `relativeAtomScale` (Number; optional)
    
    * `resolution` (Number; optional)
    
    * `rotation` (Dict; optional)
      `rotation` is a Dict with keys:
    
    * `spf` (Number; optional)
    
    * `translation` (Dict; optional)
    `translation` is a Dict with keys:
    
        * `x` (Number; optional)

        * `y` (Number; optional)
    
    * `zoom` (Number; optional)
  """)

end

end
