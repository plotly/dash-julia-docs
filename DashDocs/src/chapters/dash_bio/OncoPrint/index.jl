@doc_chapter "/dash-bio/oncoprint" begin

@example oncoprint_default "default.jl"
@example oncoprint_colors "colors.jl"
@example oncoprint_legendoverview "legend_overview.jl"
@example oncoprint_sizespace "size_space.jl"

@layout html_div() do

    html_h1("OncoPrint Examples and Reference"),
    html_a(children=[
      html_b("See OncoPrint in action.")
      ], href="http://dash-gallery.plotly.host/dash-onco-print"
    ),

    html_h3("Default OncoPrint"),

    dcc_markdown("""
    An example of a default OncoPrint component without any extra properties.
    """),
    source"oncoprint_default",
    layout"oncoprint_default",

    html_h3("Colors"),

    dcc_markdown("""
    Change the color of specific mutations, as well as the background color.
    """),
    source"oncoprint_colors",
    layout"oncoprint_colors",

    html_h3("Size And Spacing"),

    dcc_markdown("""
    Change the height and width of the component, and adjust the spacing between adjacent tracks.
    """),
    source"oncoprint_sizespace",
    layout"oncoprint_sizespace",

    html_h3("Legend And Overview"),

    dcc_markdown("""
    Show or hide the legend and/or overview heatmap.
    """),
    source"oncoprint_legendoverview",
    layout"oncoprint_legendoverview",

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
    dcc_markdown(string(@doc dashbio_oncoprint))
end

end
