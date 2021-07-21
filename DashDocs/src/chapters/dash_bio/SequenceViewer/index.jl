@doc_chapter "/dash_bio/sequence_viewer" begin

@example sequenceviewer_default "default.jl"
@example sequenceviewer_lengthnumber "length_number.jl"
@example sequenceviewer_subsequence "subsequence.jl"
@example sequenceviewer_tilebadge "tile_badge.jl"
@example sequenceviewer_toolbar "toolbar.jl"

@layout html_div() do

    html_h1("SequenceViewer Examples and Reference"),
    html_a(children=[
      html_b("See SequenceViewer in action.")
      ], href="http://dash-gallery.plotly.host/dash-sequence-viewer"
    ),

    html_h3("Default SequenceViewer"),

    dcc_markdown("""
    An example of a default SequenceViewer component without any extra properties.
    """),
    source"sequenceviewer_default",
    layout"sequenceviewer_default",

    html_h3("Line Length And Line Numbers"),

    dcc_markdown("""
    Change the characters per line, and toggle the display of line numbers.
    """),
    source"sequenceviewer_lengthnumber",
    layout"sequenceviewer_lengthnumber",

    html_h3("Subsequence Selection"),

    dcc_markdown("""
    Highlight a part of the sequence with a defined color.
    """),
    source"sequenceviewer_subsequence",
    layout"sequenceviewer_subsequence",

    html_h3("Toolbar"),

    dcc_markdown("""
    Display a toolbar to change the line length from the component itself.
    """),
    source"sequenceviewer_toolbar",
    layout"sequenceviewer_toolbar",

    html_h3("Title And Badge"),

    dcc_markdown("""
    Show a title or a badge with the nucleotide or amino acid count of the protein.
    """),
    source"sequenceviewer_tilebadge",
    layout"sequenceviewer_tilebadge",

    html_h3("Sequence Viewer Properties"),
    dcc_markdown("""
    Access this documentation in your Julia REPL with:
    ```julia    
    ?help dashbio_sequenceviewer
    ```
    Our recommended IDE for writing Dash apps is Dash
      Enterprise's [Data Science Workspaces](https://plotly.com/dash/workspaces/),
       which has typeahead support for Dash Component Properties. [Find out if your company is using Dash Enterprise](https://go.plotly.com/company-lookup).
    """),
    dcc_markdown("""
    `id` (String; optional): The ID used to identify this component in Dash callbacks.

    `badge` (Bool; default true): The option of whether or not to display a badge showing the amino acid count at the top of the component beside the title.

    `charsPerLine` (Number; default 40): The Number of amino acids that will display per line.

    `coverage` (list of Dicts; optional): A coverage of the entire sequence; each section of the sequence can have its own text color, background color, tooltip (on hover), and an optional underscore. The props start and end represent the beginning and terminating indices of the section in question. Cannot be used at the same time as selection.

    `coverage` is a list of Dicts with keys:

    * `bgcolor` (String; optional)
    
    * `color` (String; optional)
    
    * `end` (Number; optional)
    
    * `onclick` (optional)
    
    * `start` (Number; optional)
    
    * `tooltip` (String; optional)
    
    * `underscore` (Bool; optional)

    `coverageClicked` (Number; optional): Contains the index of the section that was clicked last in the coverage list supplied.

    `legend` (list of Dicts; optional): A legend corresponding to the color codes above (optionally displayed).

    `legend` is a list of Dicts with keys:

    * `color` (String; optional)
    
    * `name` (String; optional)
    
    * `underscore` (Bool; optional)

    `mouseSelection` (Dict; optional): Contains information about the subsequence selected by the mouse. Start and end refer to the initial and final indices, respectively, of the subsequence, and "selection" contains the String that is selected.

    `mouseSelection` is a Dict with keys:

    * `end` (Number; optional)
    
    * `selection` (String; optional)
    
    * `start` (Number; optional)

    `search` (Bool; default true): The option of whether or not to include a search bar in the header. This supports regex.

    `selection` (optional): A highlighted section of the sequence; the color of the highlight can also be defined. Takes a list of format [min, max, color] where min is a Number that represents the starting index of the selection, max is a Number that represents the stopping index of the selection, and color is a String that defines the highlight color. Cannot be used at the same time as coverage.

    `sequence` (String; default '-'): The amino acid sequence that will be displayed.

    `sequenceMaxHeight` (String; default '400px'): The maximum height of the sequence.

    `showLineNumbers` (Bool; default true): The option of whether or not to display line Numbers.

    `subpartSelected` (list of Dicts; optional): A list of the subparts selected using the "search" function or the "selection" property.

    `subpartSelected` is a list of Dicts with keys:

    * `end` (Number; optional)
    
    * `sequence` (String; optional)
    
    * `start` (Number; optional)

    `title` (String; default ''): A String that displays at the top of the component.

    `toolbar` (Bool; default false): The option of whether or not to display a toolbar at the top that allows the user to choose the Number of letters per line.

    `wrapAminoAcids` (Bool; default true): The option of whether or not to display the list of amino acids as broken up into separate lines of a fixed length set by charsPerLine.
  """)

end

end
