@doc_chapter "/dash-bio/sequenceviewer" begin

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
    dcc_markdown(string(@doc dashbio_sequenceviewer))

end

end
