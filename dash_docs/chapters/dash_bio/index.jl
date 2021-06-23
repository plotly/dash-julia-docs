module chapters_dash_bio

using Dash, DashHtmlComponents, DashCoreComponents, DashBio, Chain, Pkg

function get_pkg_version(name::AbstractString)
    @chain Pkg.dependencies() begin
        values
        [x for x in _ if x.name == name]
        only
        _.version
    end
end

include("../../utils.jl")

export examples

examples_path = joinpath(@__DIR__, "examples")

alignmentchart_index_example = LoadExampleCode(string(examples_path, "/alignmentchart_index_example.jl"))
fornacontainer_index_example = LoadExampleCode(string(examples_path, "/fornacontainer_index_example.jl"))
ideogram_index_example = LoadExampleCode(string(examples_path, "/ideogram_index_example.jl"))
igv_index_example = LoadExampleCode(string(examples_path, "/igv_index_example.jl"))
molecule2dviewer_index_example = LoadExampleCode(string(examples_path, "/molecule2dviewer_index_example.jl"))
molecule3dviewer_index_example = LoadExampleCode(string(examples_path, "/molecule3dviewer_index_example.jl"))
examples = [
    
]

app =  dash()

n = get_pkg_version("DashBio")

app.layout = html_div() do

    html_h1("Dash Bio"),

    dcc_markdown(
      "
      pip install dash-bio==0.7.0

      Dash is a web application framework that provides pure Python abstraction around HTML, CSS, and JavaScript.

      Dash Bio is a suite of bioinformatics components that make it simpler to analyze and visualize bioinformatics data and interact with them in a Dash application.

      The source can be found on GitHub at [plotly/dash-bio](https://github.com/plotly/dash-bio).

      These docs are using Dash Bio version $n.
      "
    ),

    html_a(html_h3("AlignmentChart"), href="#"),

    dcc_markdown("An alignment chart."),

    alignmentchart_index_example.source_code,
    alignmentchart_index_example.layout,

    html_a(html_h3("FornaContainer"), href="#"),

    dcc_markdown("A secondary structure visualization for RNA molecules."),

    fornacontainer_index_example.source_code,
    fornacontainer_index_example.layout,

    html_a(html_h3("Ideogram"), href="#"),

    dcc_markdown("A visual representation and analysis tool for chromosome bands."),

    ideogram_index_example.source_code,
    ideogram_index_example.layout,

    html_a(html_h3("Igv"), href="#"),

    dcc_markdown("A high performance genomics visualization tool for real-time exploration 
    of large scale genomic data features."),

    igv_index_example.source_code,
    igv_index_example.layout,

    html_a(html_h3("Molecule2dViewer"), href="#"),

    dcc_markdown("A 2D rendering of molecular structures."),

    molecule2dviewer_index_example.source_code,
    molecule2dviewer_index_example.layout,

    html_a(html_h3("Molecule3dViewer"), href="#"),

    dcc_markdown("A 3D visualization of biomolecular structures."),

    molecule3dviewer_index_example.source_code,
    molecule3dviewer_index_example.layout
    


end

end
