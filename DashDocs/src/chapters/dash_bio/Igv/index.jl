@doc_chapter "/dash_bio/igv" begin

@example igv_default "default.jl"
@example igv_genome "genome.jl"
@example igv_locus "locus.jl"
@example igv_minimumbases "minimum_bases.jl"
@example igv_reference "reference.jl"

@layout html_div() do

    html_h1("Igv Examples and Reference"),
    html_a(children=[
      html_b("See Igv in action.")
      ], href="https://dash-gallery.plotly.host/dash-igv/"
    ),

    html_h3("Default Igv"),

    dcc_markdown("""
    An example of a default Igv component without any extra properties.
    """),
    source"igv_default",
    layout"igv_default",

    html_h3("Genome"),

    dcc_markdown("""
    Select a genome using an identifier string 
    (e.g. "hg19"). A list of pre-defined genomes hosted by IGV can be found (here)[https://s3.amazonaws.com/igv.org.genomes/genomes.json].
    """),
    source"igv_genome",
    layout"igv_genome",

    html_h3("Reference"),

    dcc_markdown("""
    Add a reference dictionary which can be used to specify the genomic data added to the IGV component, and add tracks to display features such as annotations, genome variants, alignments, and quantitative data.

    For more information on reference options, visit the `IGV` wiki [here](https://github.com/igvteam/igv.js/wiki/Reference-Genome).

    Multiple tracks can be added to a single reference by creating a list of dicts, each of which correspond to a single track. For more information on Track Types and Track Configurations, visit the IGV wiki [here](https://github.com/igvteam/igv.js/wiki/Tracks-2.0).
    """),
    source"igv_reference",
    layout"igv_reference",

    html_h3("Locus"),

    dcc_markdown("""
    The initial genomic location displayed on the viewer. This can be a string or a list of strings. In the example below, the locus is "chrV".
    """),
    source"igv_locus",
    layout"igv_locus",

    html_h3("Minimum Bases"),

    dcc_markdown("""
    Minimum window size in base pairs when zooming in.
    """),
    source"igv_minimumbases",
    layout"igv_minimumbases",

    html_h3("Igv Properties"),
    dcc_markdown("""
    Access this documentation in your Julia REPL with:
    ```julia    
    ?help dashbio_igv
    ```
    Our recommended IDE for writing Dash apps is Dash
      Enterprise's [Data Science Workspaces](https://plotly.com/dash/workspaces/),
       which has typeahead support for Dash Component Properties. [Find out if your company is using Dash Enterprise](https://go.plotly.com/company-lookup).
    """),
    dcc_markdown("""
    `id` (String; optional): The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.

    `className` (String; optional): className of the component div.

    `genome` (String; optional): String identifier defining genome (e.g. "hg19"). See [https://github.com/igvteam/igv.js/wiki/Reference-Genome](https://github.com/igvteam/igv.js/wiki/Reference-Genome) for details and list of supported identifiers. Note: One (but only one) of either genome or reference properties must be set. If both are set, the genome property will be ignored.

    `locus` (String; optional): Initial genomic location(s). Either a String or an array of Strings. If an array a viewport is created for each location.

    `minimumBases` (Number; optional): Minimum window size in base pairs when zooming in.

    `reference` (Dict; optional): Object defining reference genome. see [https://github.com/igvteam/igv.js/wiki/Reference-Genome](https://github.com/igvteam/igv.js/wiki/Reference-Genome) Note: One (but only one) of either genome or reference properties must be set. If both are set, the genome property will be ignored.

    `style` (Dict; optional): Generic style overrides on the plot div.

    `tracks` (list; optional): Array of configuration objects defining tracks initially displayed when app launches. see [https://github.com/igvteam/igv.js/wiki/Tracks-2.0](https://github.com/igvteam/igv.js/wiki/Tracks-2.0).
    """)

end

end
