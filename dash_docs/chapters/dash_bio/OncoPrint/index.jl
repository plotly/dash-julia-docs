module chapters_dash_bio_oncoprint
using Dash, DashHtmlComponents, DashCoreComponents, Chain, Pkg

include("../../../utils.jl")

export examples

examples_path = joinpath(@__DIR__, "examples")

oncoprint_default = LoadExampleCode(string(examples_path, "/default.jl"))

oncoprint_colors = LoadExampleCode(string(examples_path, "/colors.jl"))

oncoprint_legendoverview = LoadExampleCode(string(examples_path, "/legend_overview.jl"))

oncoprint_sizespace = LoadExampleCode(string(examples_path, "/size_space.jl"))

examples = [
  oncoprint_default
]

app =  dash()

oncoprint_default.callback!(app)

app.layout = html_div() do

    html_h1("OncoPrint Examples and Reference"),
    html_a(children=[
      html_b("See OncoPrint in action.")
      ], href="http://dash-gallery.plotly.host/dash-onco-print"
    ),

    html_h3("Default OncoPrint"),

    dcc_markdown("""
    An example of a default OncoPrint component without any extra properties.
    """),
    oncoprint_default.source_code,
    oncoprint_default.layout,

    html_h3("Colors"),

    dcc_markdown("""
    Change the color of specific mutations, as well as the background color.
    """),
    oncoprint_colors.source_code,
    oncoprint_colors.layout,

    html_h3("Size And Spacing"),

    dcc_markdown("""
    Change the height and width of the component, and adjust the spacing between adjacent tracks.
    """),
    oncoprint_sizespace.source_code,
    oncoprint_sizespace.layout,

    html_h3("Legend And Overview"),

    dcc_markdown("""
    Show or hide the legend and/or overview heatmap.
    """),
    oncoprint_legendoverview.source_code,
    oncoprint_legendoverview.layout,

    html_h3("Onco Print Properties"),
    dcc_markdown("""
    Access this documentation in your Julia REPL with:
    ```julia    
    ?help dashbio_oncoprint
    ```
    Our recommended IDE for writing Dash apps is Dash
      Enterprise's [Data Science Workspaces](https://plotly.com/dash/workspaces/),
       which has typeahead support for Dash Component Properties. [Find out if your company is using Dash Enterprise](https://go.plotly.com/company-lookup).
    """),
    dcc_markdown("""
    `id` (String; optional): The ID of this component, used to identify dash components in callbacks. The ID needs to be unique to the component.

    `backgroundcolor` (String; default 'rgb(190, 190, 190)'): Default color for the tracks, in common name, hex, rgb or rgba format. If left blank, will default to a light grey rgb(190, 190, 190).

    `colorscale` (Bool | Dict; optional): If not None, will override the default OncoPrint colorscale. Default OncoPrint colorscale same as CBioPortal implementation. Make your own colrscale as a {'mutation': COLOR} Dict. Supported mutation keys are ['MISSENSE, 'INFRAME', 'FUSION', 'AMP', 'GAIN', 'HETLOSS', 'HMODEL', 'UP', 'DOWN'] Note that this is NOT a standard plotly colorscale.

    `data` (list; optional): Input data, in CBioPortal format where each list entry is a Dict consisting of 'sample', 'gene', 'alteration', and 'type'.

    `eventDatum` (Dict; optional): A Dash prop that returns data on clicking, hovering or resizing the viewer.

    `height` (Number | String; default 500): Height of the OncoPrint. Will disable auto-resizing of plots if set.

    `padding` (Number; default 0.05): Adjusts the padding (as a proportion of whitespace) between two tracks. Value is a ratio between 0 and 1. Defaults to 0.05 (i.e., 5 percent). If set to 0, plot will look like a heatmap.

    `range` (list; default [None, None]): Toogles whether or not to show a legend on the right side of the plot, with mutation information.

    `showlegend` (Bool; default true): Toogles whether or not to show a legend on the right side of the plot, with mutation information.

    `showoverview` (Bool; default true): Toogles whether or not to show a heatmap overview of the tracks.

    `width` (Number | String; optional): Width of the OncoPrint. Will disable auto-resizing of plots if set.
  """)

end

end
