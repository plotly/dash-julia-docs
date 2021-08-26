include("BasicUsage/index.jl");
include("Layouts/index.jl");
include("Styling/index.jl");
include("Callbacks/index.jl");
include("UserInteractions/index.jl");
include("ExportingImages/index.jl");
include("ResponsiveGraph/index.jl");
include("ResponsiveGraph/index.jl");
include("Reference/index.jl");
@doc_chapter "/cytoscape" begin


@example quick_startcyto "quick_startcyto.jl"


    @layout html_div() do
        html_h1("Dash Cytoscape"),

        html_blockquote([
            dcc_markdown("""
                Released on February 5th, 2019**

                Dash Cytoscape is a graph visualization component for creating easily customizable, high-performance, interactive, and web-based networks. It extends and renders [Cytoscape.js](https://js.cytoscape.org/), and offers deep integration with Dash layouts and callbacks, enabling the creation of powerful networks in conjunction with the rich collection of Dash components, as well as established computational biology and network science libraries.
                
                -- xhlulu and the Dash Team
            """)
        ]),

        html_h3("Quickstart"),
        dcc_markdown("""
            ```Julia
                julia>using Pkg
                julia>Pkg.add("DashCytoscape")
            ```
        """),       
                    
        source"quick_startcyto",
        layout"quick_startcyto",

        html_blockquote(
            dcc_markdown("""
                Dash Cytoscape graphs are interactive! Scroll to zoom and drag on the canvas to move the entire graph around. You can move nodes by *dragging it, or by clicking, holding, and moving your mouse* to the desired location (and click again to release).

                This also work in mobile! Tap-and-hold on a node to move it, or on the canvas to move the entire graph. Pinch your fingers outwards to zoom in, or pinch them together to zoom out.
            """)
        ),

        html_h3("Dash Cytoscape User Guide"),

        html_a(html_h5("Basic Usage & Elements"), href="/cytoscape/elements"),
        dcc_markdown("""
            Overview of element declaration and manipulation.
        """),

        html_a(html_h5("Layouts"), href="/cytoscape/layout"),
        dcc_markdown("""
            Description of built-in layouts, and how to modify their properties.
        """),

        html_a(html_h5("Styling"), href="/cytoscape/styling"),
        dcc_markdown("""
            Methods to style elements with a CSS-like syntax.
        """),

        html_a(html_h5("Callbacks"), href="/cytoscape/callbacks"),
        dcc_markdown("""
            Methods to combine Dash callbacks to update your Cytoscape object.
        """),

        html_a(html_h5("User Interactions"), href="/cytoscape/events"),
        dcc_markdown("""
            Overview of user-interaction events that trigger callbacks in Dash, and how to use them to update the Cytoscape component.
        """),

        # html_a(html_h5("Biopython Examples"), href="/cytoscape/biopython"),
        # dcc_markdown("""
        #     Biopython Examples
        # """),

        html_a(html_h5("Exporting Images"), href="/cytoscape/images"),
        dcc_markdown("""
            This example shows how to export your Cytoscape graphs as images (jpg, png, svg).
        """),

        html_a(html_h5("Making responsive graphs"), href="/cytoscape/responsive"),
        dcc_markdown("""
            This example shows how to build a responsive Cytoscape graph.
        """),

        html_a(html_h5("Reference"), href="/cytoscape/reference"),
        dcc_markdown("""
            Comprehensive list of all of the Cytoscape properties.
        """)

    end

end