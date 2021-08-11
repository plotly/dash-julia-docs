@doc_chapter "/dash-bio/alignmentchart" begin

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
    dcc_markdown(string(@doc dashbio_alignmentchart))

end

end
