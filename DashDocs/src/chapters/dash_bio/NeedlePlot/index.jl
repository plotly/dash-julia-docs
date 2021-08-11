@doc_chapter "/dash-bio/needleplot" begin

@example needleplot_default "default.jl"
@example needleplot_domainstyle "domain_style.jl"
@example needleplot_needlestyle "needle_style.jl"

@layout html_div() do

    html_h1("NeedlePlot Examples and Reference"),
    html_a(children=[
      html_b("See NeedlePlot in action.")
      ], href="http://dash-gallery.plotly.host/dash-needle-plot"
    ),

    html_h3("Default NeedlePlot"),

    dcc_markdown("""
    An example of a default NeedlePlot component without any extra properties.
    """),
    source"needleplot_default",
    layout"needleplot_default",

    html_h3("Needle Style"),

    dcc_markdown("""
    Change the appearance of the needles.
    """),
    source"needleplot_needlestyle",
    layout"needleplot_needlestyle",

    html_h3("Domain Style"),

    dcc_markdown("""
    Change the appearance of the domains.
    """),
    source"needleplot_domainstyle",
    layout"needleplot_domainstyle",

    html_h3("Needle Plot Properties"),
    dcc_markdown("""
    Access this documentation in your Julia REPL with:
    ```julia    
    ?help dashbio_needleplot
    ```
    Our recommended IDE for writing Dash apps is Dash
      Enterprise's [Data Science Workspaces](https://plotly.com/dash/workspaces/),
       which has typeahead support for Dash Component Properties. [Find out if your company is using Dash Enterprise](https://go.plotly.com/company-lookup).
    """),
    dcc_markdown(string(@doc dashbio_needleplot))

end

end
