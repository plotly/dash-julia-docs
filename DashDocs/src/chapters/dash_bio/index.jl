include("AlignmentChart/index.jl")
include("FornaContainer/index.jl")
include("Ideogram/index.jl");
include("Igv/index.jl");
include("Molecule2dViewer/index.jl");
include("Molecule3dViewer/index.jl");
include("NeedlePlot/index.jl");
include("NglMoleculeViewer/index.jl");
include("OncoPrint/index.jl");
include("SequenceViewer/index.jl");
include("Speck/index.jl");
@doc_chapter "/dash-bio" begin

@example alignmentchart_index_example "alignmentchart_index_example.jl"
@example fornacontainer_index_example "fornacontainer_index_example.jl"
@example ideogram_index_example "ideogram_index_example.jl"
@example igv_index_example "igv_index_example.jl"
@example molecule2dviewer_index_example "molecule2dviewer_index_example.jl"
@example molecule3dviewer_index_example "molecule3dviewer_index_example.jl"
@example needleplot_index_example "needleplot_index_example.jl"
@example nglmoleculeviewer_index_example "nglmoleculeviewer_index_example.jl"
@example oncoprint_index_example "oncoprint_index_example.jl"
@example sequenceviewer_index_example "sequenceviewer_index_example.jl"
@example speck_index_example "speck_index_example.jl"



@layout html_div() do

    html_h1("Dash Bio"),

    dcc_markdown(
      """
      ```
      pkg> add DashBio
      ```

      Dash is a web application framework that provides pure Julia abstraction around HTML, CSS, and JavaScript.

      Dash Bio is a suite of bioinformatics components that make it simpler to analyze and visualize bioinformatics data and interact with them in a Dash application.

      The source can be found on GitHub at [plotly/dash-bio](https://github.com/plotly/dash-bio).

      These docs are using Dash Bio version $(pkgver"DashBio").
      """
    ),

    html_a(html_h3("AlignmentChart"), href="/dash-bio/alignmentchart"),

    dcc_markdown("An alignment chart."),

    source"alignmentchart_index_example",
    layout"alignmentchart_index_example",

    html_a(html_h3("FornaContainer"), href="/dash-bio/fornacontainer"),

    dcc_markdown("A secondary structure visualization for RNA molecules."),

    source"fornacontainer_index_example",
    layout"fornacontainer_index_example",

    html_a(html_h3("Ideogram"), href="/dash-bio/ideogram"),

    dcc_markdown("A visual representation and analysis tool for chromosome bands."),

    source"ideogram_index_example",
    layout"ideogram_index_example",

    html_a(html_h3("Igv"), href="/dash-bio/igv"),

    dcc_markdown("A high performance genomics visualization tool for real-time exploration
    of large scale genomic data features."),

    source"igv_index_example",
    layout"igv_index_example",

    html_a(html_h3("Molecule2dViewer"), href="dash-bio/molecule2dviewer"),

    dcc_markdown("A 2D rendering of molecular structures."),

    source"molecule2dviewer_index_example",
    layout"molecule2dviewer_index_example",

    html_a(html_h3("Molecule3dViewer"), href="/dash-bio/molecule3dviewer"),

    dcc_markdown("A 3D visualization of biomolecular structures."),

    source"molecule3dviewer_index_example",
    layout"molecule3dviewer_index_example",

    html_a(html_h3("NeedlePlot"), href="/dash-bio/needleplot"),

    dcc_markdown("A combination of a bar chart and a scatter plot, for data that
    are both categorical and continuous."),

    source"needleplot_index_example",
    layout"needleplot_index_example",

    html_a(html_h3("NglMoleculeViewer"), href="/dash-bio/nglmoleculeviewer"),

    dcc_markdown("A comprehensive 3D molecule visualizer for visualizing multiple
    molecules and chains in a variety of representations."),

    source"nglmoleculeviewer_index_example",
    layout"nglmoleculeviewer_index_example",

    html_a(html_h3("OncoPrint"), href="/dash-bio/oncoprint"),

    dcc_markdown("A chart that can be used to visualize
    multiple genomic alternations with an interactive heatmap."),

    source"oncoprint_index_example",
    layout"oncoprint_index_example",

    html_a(html_h3("SequenceViewer"), href="/dash-bio/sequenceviewer"),

    dcc_markdown("A sequence viewer."),

    source"sequenceviewer_index_example",
    layout"sequenceviewer_index_example",

    html_a(html_h3("Speck"), href="/dash-bio/speck"),

    dcc_markdown("A 3D WebGL molecule viewer."),

    source"speck_index_example",
    layout"speck_index_example"    


end

end
