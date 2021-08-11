@doc_chapter "/dash-bio/ideogram" begin

@example ideogram_default "default.jl"
@example ideogram_annotations "annotations.jl"
@example ideogram_brush "brush.jl"
@example ideogram_heightwidth "height_width.jl"
@example ideogram_orientation "orientation.jl"
@example ideogram_rotatability "rotatability.jl"

@layout html_div() do

    html_h1("Ideogram Examples and Reference"),
    html_a(children=[
      html_b("See Ideogram in action.")
      ], href="https://dash-gallery.plotly.host/dash-ideogram/"
    ),

    html_h3("Default Ideogram"),

    dcc_markdown("""
    An example of a default Ideogram component without any extra properties.
    """),
    source"ideogram_default",
    layout"ideogram_default",

    html_h3("Height/Width"),

    dcc_markdown("""
    Change the size of the chromosomes in your ideogram.
    """),
    source"ideogram_heightwidth",
    layout"ideogram_heightwidth",

    html_h3("Annotations"),

    dcc_markdown("""
    Display annotations that are loaded from a JSON file.
    """),
    source"ideogram_annotations",
    layout"ideogram_annotations",

    html_h3("Rotatability"),

    dcc_markdown("""
    Disable rotation of the chromosome upon clicking on it.
    """),
    source"ideogram_rotatability",
    layout"ideogram_rotatability",

    html_h3("Orientation"),

    dcc_markdown("""
    Display chromosomes horizontally or vertically.
    """),
    source"ideogram_orientation",
    layout"ideogram_orientation",

    html_h3("Brush"),

    dcc_markdown("""
    Highlight a region of the chromosome by adding a brush.
    """),
    source"ideogram_brush",
    layout"ideogram_brush",

    html_h3("Ideogram Properties"),
    dcc_markdown("""
    Access this documentation in your Julia REPL with:
    ```julia    
    ?help dashbio_ideogram
    ```
    Our recommended IDE for writing Dash apps is Dash
      Enterprise's [Data Science Workspaces](https://plotly.com/dash/workspaces/),
       which has typeahead support for Dash Component Properties. [Find out if your company is using Dash Enterprise](https://go.plotly.com/company-lookup).
    """),
    dcc_markdown(string(@doc dashbio_ideogram))

end

end
