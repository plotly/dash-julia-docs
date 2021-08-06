@doc_chapter "/dash_bio/forna_container" begin

@example fornacontainer_default "default.jl"
@example fornacontainer_colorscheme "color_scheme.jl"
@example fornacontainer_customcolor "custom_color.jl"
@example fornacontainer_diasblezoompzn "diasble_zoom_pzn.jl"
@example fornacontainer_filcolor "fil_color.jl"
@example fornacontainer_heightwidth "height_width.jl"
@example fornacontainer_lableinterval "lable_interval.jl"

@layout html_div() do

    html_h1("FornaContainer Examples and Reference"),

    html_h3("Default FornaContainer"),

    dcc_markdown("""
    An example of a default FornaContainer component without any extra properties.
    """),
    source"fornacontainer_default",
    layout"fornacontainer_default",

    html_h3("Height/Width"),

    dcc_markdown("""
    Change the size of the canvas component that holds the container.
    """),
    source"fornacontainer_heightwidth",
    layout"fornacontainer_heightwidth",

    html_h3("Disable Zoom And Pan"),

    dcc_markdown("""
    Specify whether zoom and pan interactions should be disabled.
    """),
    source"fornacontainer_diasblezoompzn",
    layout"fornacontainer_diasblezoompzn",

    html_h3("Label Interval"),

    dcc_markdown("""
    Specify the interval at which the sequence positions should be labelled.
    """),
    source"fornacontainer_lableinterval",
    layout"fornacontainer_lableinterval",

    html_h3("Fill Color For All Nodes"),

    dcc_markdown("""
    Change the color of all of the nucleotides in all sequences shown.
    """),
    source"fornacontainer_filcolor",
    layout"fornacontainer_filcolor",

    html_h3("Color Scheme"),

    dcc_markdown("""
    Change the parameter according to which the structure is colored.
    """),
    source"fornacontainer_colorscheme",
    layout"fornacontainer_colorscheme",

    html_h3("Custom Color Schemes For Different Sequences"),

    dcc_markdown("""
    Specify color schemes to be applied to all sequences in the container, or sequence-specific color schemes.
    """),
    source"fornacontainer_customcolor",
    layout"fornacontainer_customcolor",

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
    dcc_markdown(string(@doc dashbio_fornacontainer))

end

end
