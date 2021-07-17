@doc_chapter "/dash_bio/needle_plot" begin

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
    dcc_markdown("""
    `id` (String; optional)=> The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.

    `domainStyle` (Dict; default Dict( displayMinorDomains=> False, domainColor=> [ '#8dd3c7', '#ffffb3', '#bebada', '#fb8072', '#80b1d3', '#fdb462', '#b3de69', '#fccde5', '#d9d9d9', '#bc80bd', '#ccebc5', '#ffed6f', '#8dd3c7', '#ffffb3', '#bebada', '#fb8072', '#80b1d3', '#fdb462', '#b3de69', ],))=> Options for the protein domain coloring.

    `domainStyle` is a Dict with keys=>

    * `displayMinorDomains` (Bool; optional)
    
    * `domainColor` (list; optional)

    `mutationData` (Dict; default Dict( x=> [], y=> [], domains=> [], mutationGroups=> [],))=> The data that are displayed on the plot.

    `mutationData` is a Dict with keys=>

    * `domains` (list; optional)
    
    * `mutationGroups` (list of Strings; optional)
    
    * `x` (String | list; optional)
    
    * `y` (String | list; optional)

    `needleStyle` (Dict; default Dict( stemColor=> '#444', stemThickness=> 0.5, stemConstHeight=> False, headSize=> 5, headColor=> [ '#e41a1c', '#377eb8', '#4daf4a', '#984ea3', '#ff7f00', '#ffff33', '#a65628', '#f781bf', '#999999', '#e41a1c', '#377eb8', '#4daf4a', '#984ea3', '#ff7f00', '#ffff33', '#a65628', '#f781bf', '#999999', '#e41a1c', ], headSymbol=> 'circle',))=> Options for the needle marking single site mutations.

    `needleStyle` is a Dict with keys=>

    * `headColor` (list | String; optional)
    
    * `headSize` (Number; optional)
    
    * `headSymbol` (list | String; optional)
    
    * `stemColor` (String; optional)
    
    * `stemConstHeight` (Bool; optional)
    
    * `stemThickness` (Number; optional)

    `rangeSlider` (Bool; default False)=> If True, enables a rangeslider for the x-axis.

    `xlabel` (String; optional)=> Title of the x-axis.

    `ylabel` (String; optional)=> Title of the y-axis.
    """)

end

end
