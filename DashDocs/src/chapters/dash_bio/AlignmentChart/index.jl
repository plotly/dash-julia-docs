@doc_chapter "/dash_bio/alignment_chart" begin

@example alignmentchart_default "default.jl"
@example alignmentchart_colorscales "color_scales.jl"
@example alignmentchart_consensussequence "consensus_sequence.jl"
@example alignmentchart_showhide "show_hide.jl"
@example alignmentchart_tilesize "tile_size.jl"

@layout html_div() do

    html_h1("AlignmentChart Examples and Reference"),

    html_h3("Default AlignmentChart"),

    dcc_markdown("""
    An example of a default AlignmentChart component without any extra properties.
    """),
    source"alignmentchart_default",
    layout"alignmentchart_default",

    html_h3("Color Scales"),

    dcc_markdown("""
    Change the colors used for the heatmap.
    """),
    source"alignmentchart_colorscales",
    layout"alignmentchart_colorscales",

    html_h3("Show/Hide Barplots"),

    dcc_markdown("""
    Enable or disable the secondary bar plots for gaps and conservation.
    """),
    source"alignmentchart_showhide",
    layout"alignmentchart_showhide",

    html_h3("Tile Size"),

    dcc_markdown("""
    Change the height and/or width of the tiles.
    """),
    source"alignmentchart_tilesize",
    layout"alignmentchart_tilesize",

    html_h3("Consensus Sequence"),

    dcc_markdown("""
    Toggle the display of the consensus sequence at the bottom of the heatmap.
    """),
    source"alignmentchart_consensussequence",
    layout"alignmentchart_consensussequence",

    html_h3("Alignment Chart Properties"),
    dcc_markdown("""
    Access this documentation in your Julia REPL with:
    ```julia
    ?help dashbio_alignmentchart
    ```
    Our recommended IDE for writing Dash apps is Dash
      Enterprise's [Data Science Workspaces](https://plotly.com/dash/workspaces/),
       which has typeahead support for Dash Component Properties. [Find out if your company is using Dash Enterprise](https://go.plotly.com/company-lookup).
    """),
    dcc_markdown("""
    `id` (String; optional): The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.

    `colorscale` (String | Dict; default 'clustal2'): Colorscale in 'buried', 'cinema', 'clustal', 'clustal2', 'helix', 'hydrophobicity' 'lesk', 'mae', 'nucleotide', 'purine', 'strand', 'taylor', 'turn', 'zappo', or your own colorscale as a {'nucleotide': COLOR} Dict. Note that this is NOT a standard plotly colorscale.

    `conservationcolor` (String; optional): Color of the conservation secondary barplot, in common name, hex, rgb or rgba format.

    `conservationcolorscale` (String | list; default 'Viridis'): Colorscale of the conservation barplot, in Plotly colorscales (e.g. 'Viridis') or as custom Plotly colorscale under a list format. Note that this conservationcolorscale argument does NOT follow the same format as the colorscale argument.

    `conservationmethod` (a value equal to: 'conservation', 'entropy'; default 'entropy'): Whether to use most conserved ratio (MLE) 'conservation' or normalized entropy 'entropy' to determine conservation, which is a value between 0 and 1 where 1 is most conserved.

    `conservationopacity` (Number | String; optional): Opacity of the conservation secondary barplot as a value between 0 and 1.

    `correctgap` (Bool; default true): Whether to normalize the conservation barchart By multiplying it elementwise with the gap barchart, as to lower the conservation values across sequences regions with many gaps.

    `data` (String; optional): Input data, either in FASTA or Clustal format.

    `eventDatum` (String; optional): A Dash prop that returns data on clicking, hovering or resizing the viewer.

    `extension` (String; default 'fasta'): Format type of the input data, either in FASTA or Clustal.

    `gapcolor` (String; default 'grey'): Color of the gap secondary barplot, in common name, hex, rgb or rgba format.

    `gapcolorscale` (String | list; optional): Colorscale of the gap barplot, in Plotly colorscales (e.g. 'Viridis') or as custom Plotly colorscale under a list format. Note that this conservationcolorscale argument does NOT follow the same format as the colorscale argument.

    `gapopacity` (Number | String; optional): Opacity of the gap secondary barplot as a value between 0 and 1.

    `groupbars` (Bool; default false): If both conservation and gap are enabled, toggles whether to group bars or to stack them as separate subplots. No effect if not both gap and conservation are shown.

    `height` (Number | String; default 900): Width of the Viewer. Property takes precedence over tilesheight if both are set.

    `numtiles` (Number; optional): Sets how many tiles to display across horitontally. If enabled, overrides tilewidth and sets the amount of tiles directly based off that value.

    `opacity` (Number | String; optional): Opacity of the main plot as a value between 0 and 1.

    `overview` (a value equal to: 'heatmap', 'slider', 'none'; default 'heatmap'): Toggles whether the overview should be a heatmap, a slider, or none.

    `scrollskip` (Number; default 10): If overview is set to 'scroll', determines how many tiles to skip with each slider movement. Has no effect if scroll is not enabled (such as with overview or none).

    `showconsensus` (Bool; default true): Displays toggling the consensus sequence, where each nucleotide in the consensus sequence is the argmax of its distribution at a set nucleotide.

    `showconservation` (Bool; default true): Enables the display of conservation secondary barplot where the most conserved nucleotides or amino acids get greater bars.

    `showgap` (Bool; default true): Enables the display of gap secondary barplot where the sequence regions with the fewest gaps get the greatest bars.

    `showid` (Bool; default true): Toggles displaying sequence IDs at left of alignment.

    `showlabel` (Bool; default true): Toggles displaying sequence labels at left of alignment.

    `textcolor` (String; optional): Color of the nucleotide labels, in common name, hex, rgb or rgba format. If left blank, handled by the colorscale automatically.

    `textsize` (Number | String; default 10): Size of the nucleotide labels, as a Number.

    `tickstart` (Number | String; optional): Determines where to start annotating the first tile. If let blank will be automatically determined by Plotly. Equivalent to Plotly's tick0 property. Does not function if overview mode 'slider' is applied. (Current bug).

    `ticksteps` (Number | String; optional): Determines at what interval to keep annotating the tiles. If left blank will be automatially determined by Plotly. Equivalent to Plotly's dtick property. Does not function if overview mode 'slider' is applied. (Current bug).

    `tileheight` (Number; default 16): Sets how many pixels each nucleotide/amino acid on the Alignment Chart takes up vertically. If enabled, set height dynamically.

    `tilewidth` (Number; default 16): Sets how many pixels each nucleotide/amino acid on the Alignment Chart takes up horizontally. The total Number of tiles (numtiles) seen horizontally is automatically determined by rounding the Viewer width divided by the tile width. the Viewwer width divided by the tile witdth.

    `width` (Number | String; optional): Width of the Viewer. Property takes precedence over tileswidth and numtiles if either of them is set.
    """)

end

end
