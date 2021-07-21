@doc_chapter "/dash_bio/ideogram" begin

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
    dcc_markdown("""
    `id` (String; required): The ID used to identify this component in Dash callbacks and used to identify Ideogram instances.

    `ancestors` (Dict; optional): A map associating ancestor labels to colors. Used to color chromosomes from different ancestors in polyploid genomes.

    `annotationHeight` (Number; optional): Not used if annotationsLayout is set to "overlay". The height of histogram bars or the size of annotations tracks symbols.

    `annotationTracks` (list of Dicts; optional): A list of objects with metadata for each track, e.g., id, display name, color, shape.

    `annotations` (list of Dicts; optional): A list of annotation objects. Annotation objects can also have a name, color, shape, and track index. At the moment there is more keys specified and the docs need updating.

    `annotations` is a list of Dicts with keys:

    * chr (String; optional)
    
    * name (String; optional)
    
    * start (Number; optional)
    
    * stop (Number; optional)

    `annotationsColor` (String; default '#F00'): Color of annotations.

    `annotationsData` (String; optional): Use this prop in a dash callback to return annotationData when hovered. It is read-only, i.e., it cannot be used with dash.dependencies.Output but only with dash.dependencies.Input.

    `annotationsLayout` (a value equal to: 'tracks', 'histogram', 'overlay'; default 'tracks'): Layout of ideogram annotations. One of "tracks", "histogram", or "overlay". "tracks": display annotations in tracks beside each chromosome. "histogram": display annotations in a histogram. Clusters annotations by location. Each cluster/bin is shown as a bar, the height of which represents the Number of annotations on genomic range. "overlay": display annotations directly over chromosomes.

    `annotationsPath` (String; optional): An absolute or relative URL directing to a JSON file containing annotation objects (JSON).

    `assembly` (String; optional): Default: latest RefSeq assembly for specified organism. The genome assembly to display. Takes assembly name (e.g., "GRCh37"), RefSeq accession (e.g., "GCF_000306695.2"), or GenBank accession (e.g., "GCA_000005005.5").

    `barWidth` (Number; default 3): Pixel width of histogram bars. Only used if annotationsLayout is set to "histogram".

    `brush` (String; optional): Genomic coordinate range (e.g., "chr1:104325484-119977655") for a brush on a chromosome. Useful when ideogram consists of one chromosome and you want to be able to focus on a region within that chromosome, and create an interactive sliding window to other regions.

    `brushData` (Dict; optional): A dash callback that is activated when the 'brush' prop is used. It will return an Dictionary like so: Dict('start': <value>, 'end': <value>, 'extent': <value>) where start is the left most edge, end is right most edge, and extent is the total width of the brush. It is read-only, i.e., it cannot be used with dash.dependencies.Output but only with dash.dependencies.Input.

    `brushData` is a Dict with keys:

    * `end` (String; optional)
    
    * `extent` (String; optional)
    
    * `start` (String; optional)

    `chrHeight` (Number; default 400): The pixel height of the tallest chromosome in the ideogram.

    `chrMargin` (Number; default 10): The pixel space of margin between each chromosome.

    `chrWidth` (Number; default 10): The pixel width of each chromosome.

    `chromosomes` (list of Strings | Dict; optional): A list of the names of chromosomes to display. Useful for depicting a subset of the chromosomes in the genome, e.g., a single chromosome. If Homology (between two different species): Ex: chromosomes=Dict( 'human': ['1'], 'mouse': ['4'] ) General case to specify specific chromosomes: Ex: chromosomes=['1', '2'].

    `className` (String; optional): The CSS class of the component wrapper.

    `container` (String; optional): CSS styling and the id of the container holding the Ideogram in react-ideogram.js, this is where all the d3 magic happens.

    `dataDir` (String; default 'https://unpkg.com/ideogram@1.5.0/dist/data/bands/native/'): Absolute or relative URL of the directory containing data needed to draw banded chromosomes. You will need to set up your own database to grab data from a custom database.

    `filterable` (Bool; optional): Whether annotations should be filterable or not.

    `fullChromosomeLabels` (Bool; optional): Whether to include abbreviation species name in chromosome label. Used for homology.

    `histogramScaling` (a value equal to: 'absolute', 'relative'; optional): Scaling of histogram bars height Only used if annotationsLayout is set to "histogram". One of "absolute" or "relative". "absolute": sets bar height relative to tallest bar in all chromosomes. "relative": sets bar height relative to tallest bar in each chromosome.

    `homology` (Dict; optional): Used to compare two chromosomes. The keys "chrOne" and "chrTwo" represent one chromosome each. Organism is the taxID or name. Start is an array, containing start one and start two, in this order. Stop is an array, containing stop one, and stop two, in this order. Ex: homology=Dict( "chrOne": Dict( organism": "9606", "start": [50000, 155701383], "stop": [900000, 156030895] ), "chrTwo": Dict( organism": "10090", "start": [10001, 50000000], "stop": [2781479, 57217415] ) ).

    `homology` is a Dict with keys:

    * `chrOne` (Dict; optional)
    `chrOne` is a Dict with keys:
    
        * organism (String; required)

        * start (list of Numbers; optional)

        * stop (list of Numbers; optional)
    
    * `chrTwo` (Dict; optional)
      `chrTwo` is a Dict with keys:
    
        * `organism` (String; required)

        * `start` (list of Numbers; optional)

        * `stop` (list of Numbers; optional)
    
    `localOrganism` (Dict; optional): Provide local JSON organism into this prop from a local user JSON file. DataDir must not be initialized.

    `organism` (String | Number; default 'human'): Organism(s) to show chromosomes for. Supply organism's name as a String (e.g., "human") or organism's NCBI Taxonomy ID (taxid, e.g., 9606) to display chromosomes from a single organism, or an array of organisms' names or taxids to display chromosomes from multiple species.

    `orientation` (a value equal to: 'vertical', 'horizontal'; optional): The orientation of chromosomes on the page.

    `perspective` (a value equal to: 'comparative'; optional): Use perspective: 'comparative' to enable annotations between two chromosomes, either within the same organism or different organisms. Used for homology.

    `ploidy` (Number; default 1): The ploidy - Number of chromosomes to depict for each chromosome set.

    `ploidyDesc` (list of Dicts; optional): Description of ploidy in each chromosome set in terms of ancestry composition.

    `rangeSet` (list of Dicts; optional): List of objects describing segments of recombination among chromosomes in a chromosome set.

    `resolution` (Number; optional): The resolution of cytogenetic bands to show for each chromosome. The quantity refers to an approximate value in bands per haploid set (bphs). One of 450, 550, or 850.

    `rotatable` (Bool; default true): Whether chromosomes are rotatable on click.

    `rotated` (Bool; optional): Dash callback that returns true if rotated, and false if not.

    `sex` (a value equal to: 'male', 'female'; optional): Useful for omitting chromosome Y in female animals. Currently only supported for organisms that use XY sex-determination.

    `showAnnotTooltip` (Bool; default true): Whether to show a tooltip upon mousing over an annotation.

    `showBandLabels` (Bool; default false): Whether to show cytogenetic band labels, e.g., 1q21.

    `showChromosomeLabels` (Bool; default true): Whether to show chromosome labels, e.g., 1, 2, 3, X, Y.

    `showFullyBanded` (Bool; default true): Whether to show fully banded chromosomes for genomes that have sufficient data. Useful for showing simpler chromosomes of cytogenetically well-characterized organisms, e.g., human, beside chromosomes of less studied organisms, e.g., chimpanzee.

    `showNonNuclearChromosomes` (Bool; default false): Whether to show non-nuclear chromosomes, e.g., for mitochondrial (MT) and chloroplast (CP) DNA.

    `style` (Dict; optional): The component's inline styles.
    """)

end

end
