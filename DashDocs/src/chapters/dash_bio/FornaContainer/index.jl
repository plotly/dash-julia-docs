module chapters_dash_bio_fornacontainer
using Dash, DashHtmlComponents, DashCoreComponents, Chain, Pkg

include("../../../utils.jl")

export examples

examples_path = joinpath(@__DIR__, "examples")

fornacontainer_default = LoadExampleCode(string(examples_path, "/default.jl"))

fornacontainer_colorscheme = LoadExampleCode(string(examples_path, "/color_scheme.jl"))

fornacontainer_customcolor = LoadExampleCode(string(examples_path, "/custom_color.jl"))

fornacontainer_diasblezoompzn = LoadExampleCode(string(examples_path, "/diasble_zoom_pzn.jl"))

fornacontainer_filcolor = LoadExampleCode(string(examples_path, "/fil_color.jl"))

fornacontainer_heightwidth = LoadExampleCode(string(examples_path, "/height_width.jl"))

fornacontainer_lableinterval = LoadExampleCode(string(examples_path, "/lable_interval.jl"))

examples = [
  fornacontainer_default
]

app =  dash()

fornacontainer_default.callback!(app)

app.layout = html_div() do

    html_h1("FornaContainer Examples and Reference"),

    html_h3("Default FornaContainer"),

    dcc_markdown("""
    An example of a default FornaContainer component without any extra properties.
    """),
    fornacontainer_default.source_code,
    fornacontainer_default.layout,

    html_h3("Height/Width"),

    dcc_markdown("""
    Change the size of the canvas component that holds the container.
    """),
    fornacontainer_heightwidth.source_code,
    fornacontainer_heightwidth.layout,

    html_h3("Disable Zoom And Pan"),

    dcc_markdown("""
    Specify whether zoom and pan interactions should be disabled.
    """),
    fornacontainer_diasblezoompzn.source_code,
    fornacontainer_diasblezoompzn.layout,

    html_h3("Label Interval"),

    dcc_markdown("""
    Specify the interval at which the sequence positions should be labelled.
    """),
    fornacontainer_lableinterval.source_code,
    fornacontainer_lableinterval.layout,

    html_h3("Fill Color For All Nodes"),

    dcc_markdown("""
    Change the color of all of the nucleotides in all sequences shown.
    """),
    fornacontainer_filcolor.source_code,
    fornacontainer_filcolor.layout,

    html_h3("Color Scheme"),

    dcc_markdown("""
    Change the parameter according to which the structure is colored.
    """),
    fornacontainer_colorscheme.source_code,
    fornacontainer_colorscheme.layout,

    html_h3("Custom Color Schemes For Different Sequences"),

    dcc_markdown("""
    Specify color schemes to be applied to all sequences in the container, or sequence-specific color schemes.
    """),
    fornacontainer_customcolor.source_code,
    fornacontainer_customcolor.layout,

    html_h3("Forna Container Properties"),
    dcc_markdown("""
    Access this documentation in your Julia REPL with:
    ```julia    
    ?help dashbio_fornacontainer
    ```
    Our recommended IDE for writing Dash apps is Dash
      Enterprise's [Data Science Workspaces](https://plotly.com/dash/workspaces/),
       which has typeahead support for Dash Component Properties. [Find out if your company is using Dash Enterprise](https://go.plotly.com/company-lookup).
    """),
    dcc_markdown("""
    `id` (String; optional): The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.

    `allowPanningAndZooming` (Bool; default True): Allow users to zoom in and pan the display. If this is enabled, then pressing the 'c' key on the keyboard will center the view.

    `colorScheme` (a value equal to: 'sequence', 'structure', 'positions', 'custom'; default 'sequence'): The color scheme that is used to color the nodes.

    `customColors` (Dict; optional): The custom colors used to color the nodes if the 'custom' option is chosen for the colorScheme prop. For example, if the domain is [0, 20], the range is ['yellow', 'red'], and the Dictionary specified in 'colorValues' that corresponds to a molecule is {'6': 10}, the sixth nucleotide in that molecule will have a color that is perfectly in between yellow and red (i.e., orange), since 10 is perfectly in between 0 and 20.

    `customColors` is a Dict with keys:

    * `colorValues` (Dict with Strings as keys and values of type Dict with Strings as keys and values of type String | Number; optional): A Dictionary which contains keys, each of which are either an empty String ('') or the name of a molecule that has been defined in the name prop in the options for a sequence in the sequences property. The value corresponding to the key that is an empty String (if that key exists) is a "default" color scheme that will be applied first, and can be overridden by the color schemes defined for molecule-specific keys. The aforementioned color schemes each take the form of a Dictionary in which the keys are the nucleotide positions and the values are either a) Numbers to be normalized with respect to the scale defined in domain (so that their color will be calculated), or b) direct String representations of colors.
    
    * `domain` (list of Numbers; optional): The limits for the color scale. This is used with the range specified in range to calculate the color of a given nucleotide, based on the Number that it is assigned.
    
    * `range` (list of Strings; optional): The range of colors that will be used in conjunction with the domain prop.

    `height` (Number; default 500): The height (in px) of the container in which the molecules will be displayed.

    `nodeFillColor` (String; optional): The fill color for all of the nodes. This will override any color scheme defined in colorScheme.

    `sequences` (list of Dicts; optional): The molecules that will be displayed.

    `sequences` is a list of Dicts with keys:

    * `options` (Dict; optional): Additional options to be applied to the rendering of the RNA molecule. options is a Dict with keys:
    
        * `applyForce` (Bool; optional): Indicate whether the force-directed layout will be applied to the displayed molecule. Enabling this option allows users to change the layout of the molecule by selecting and dragging the individual nucleotide nodes. True by default.

        * `avoidOthers` (Bool; optional): Whether or not this molecule should "avoid" other molecules in the map.

        * `circularizeExternal` (Bool; optional): This only makes sense in connection with the applyForce argument. If it's True, the external loops will be arranged in a nice circle. If False, they will be allowed to flop around as the force layout Dictates. True by default.

        * `labelInterval` (Number; optional): Change how often nucleotide Numbers are labelled with their Number. 10 by default.

        * `name` (String; optional): The molecule name; this is used in custom color scales.

    `sequence` (String; required): A String representing the RNA nucleotide sequence of the RNA molecule.

    `structure` (String; required): A dot-bracket String ([https://software.broadinstitute.org/software/igv/RNAsecStructure](https://software.broadinstitute.org/software/igv/RNAsecStructure)) that specifies the secondary structure of the RNA molecule.

    `width` (Number; default 300): The width (in px) of the container in which the molecules will be displayed.
    """)

end

end
