@doc_chapter "/cytoscape/layout" begin

    @example default "default.jl"
    @example display_methods "display_methods.jl"
    @example display_methods1 "display_methods1.jl"
    # @example external_layout "external_layout.jl"
    @example fine_tuning "fine_tuning.jl"
    @example fine_tuning1 "fine_tuning1.jl"
    @example fine_tuning2 "fine_tuning2.jl"
    @example fine_tuning3 "fine_tuning3.jl"
    @example fine_tuning4 "fine_tuning4.jl"
    @example physics_based "physics_based.jl"


    @layout html_div() do
        html_h1("Cytoscape Layouts"),

        dcc_markdown("""
            The layout parameter of `cyto_cytoscape` takes as argument a dictionary specifying how the nodes should be positioned on the screen. Every graph requires this dictionary with a value specified for the `name` key. It represents a built-in display method, which is one of the following:

            * preset
            * random
            * grid
            * circle
            * concentric
            * breadthfirst
            * cose
            * 
            All those layouts, along with their options, are described in the **[official Cytoscape documentation](https://js.cytoscape.org/#layouts)**. There, you can find the exact keys accepted by your dictionary, enabling advanced fine-tuning (demonstrated below).

            If preset is given, the positions will be rendered based on the positions specified in the elements. Otherwise, the positions will be computed by Cytoscape.js behind the scene, based on the given items of the layout dictionary. Let's start with an example of declaring a graph with a preset layout:
        """),      
                    
        dcc_markdown("""
            ```julia
                cyto_cytoscape(
                    id="cytoscape-layout-1",
                    elements=elements,
                    style=Dict("width" =>  "100%", "height" =>  "350px"),
                    layout=Dict(
                        "name" =>  "preset"
                    )
                )
            ```
        """),
        layout"default",
        html_details(open=false, children=[
            html_summary("View Elements Declaration"),
            source"default"
        ]),
        
        html_h3("Display Methods"),

        dcc_markdown("""
            In most cases, the position of the nodes will not be given. In these cases, one of the built-in methods can be used. Let's see what happens when the value of name is set to `'circle'` or `'grid'`
        """),

        dcc_markdown("""
            ```julia
                cyto_cytoscape(
                    id="cytoscape-layout-2",
                    elements=elements,
                    style=Dict("width" =>  "100%", "height" =>  "350px"),
                    layout=Dict(
                        "name" =>  "circle"
                    )
                )
            ```
        """),        
        layout"display_methods",
        html_details(open=false, children=[
            html_summary("View Full Source"),
            source"display_methods"
        ]),
        dcc_markdown("""
            ```julia
                cyto_cytoscape(
                    id="cytoscape-layout-3",
                    elements=elements,
                    style=Dict("width" =>  "100%", "height" =>  "350px"),
                    layout=Dict(
                        "name" =>  "grid"
                    )
                )
            ```
        """),
        layout"display_methods1",
        html_details(open=false, children=[
            html_summary("View Full Source"),
            source"display_methods1"
        ]),

        html_h3("Fine-tuning the Layouts"),

        dcc_markdown("""
            For any given `name` item, a collection of keys are accepted by the layout dictionary. For example, the grid layout will accept `row` and `cols`, the **[circle layout](https://js.cytoscape.org/#layouts/circle)** radius and startAngle, and so forth. Here is the grid layout with the same graph as above, but with different layout options:
        """),
        dcc_markdown("""
            ```julia
                cyto_cytoscape(
                    id="cytoscape-layout-4",
                    elements=elements,
                    style=Dict("width" =>  "100%", "height" =>  "350px"),
                    layout=Dict(
                        "name" =>  "grid",
                        "rows" =>  3
                    )
                )
            ```
        """),
        layout"fine_tuning",
        html_details(open=false, children=[
            html_summary("View Full Source"),
            source"fine_tuning"
        ]),

        dcc_markdown("""
            In the case of the circle layout, we can force the nodes to start and end at a certain angle in radians:
        """),

        dcc_markdown("""
            ```julia
                cyto_cytoscape(
                    id="cytoscape-layout-5",
                    elements=elements,
                    style=Dict("width" =>  "100%", "height" =>  "350px"),
                    layout=Dict(
                        "name" =>  "circle",
                        "radius" =>  250,
                        "startAngle" =>  pi * 1/6,
                        "sweep" =>  pi * 2/3
                    )
                )
            ```
        """),
        layout"fine_tuning1",
        html_details(open=false, children=[
            html_summary("View Full Source"),
            source"fine_tuning1"
        ]),

        dcc_markdown("""
            For the `breadthfirst` layout, a tree is created from the existing nodes by performing a breadth-first search of the graph. By default, the root(s) of the tree is inferred, but can also be specified as an option. Here is how the graph would look like if we choose New York City as the root:
        """),

        dcc_markdown("""
            ```julia
                cyto_cytoscape(
                    id="cytoscape-layout-6",
                    elements=elements,
                    style=Dict("width" =>  "100%", "height" =>  "350px"),
                    layout=Dict(
                        "name" =>  "breadthfirst",
                        "roots" =>  "[id = 'nyc']"
                    )
                )
            ```
        """),
        layout"fine_tuning2",
        html_details(open=false, children=[
            html_summary("View Full Source"),
            source"fine_tuning2"
        ]),

        dcc_markdown("""
            Here is what would happen if we chose Montreal and Vancouver instead:
        """),

        dcc_markdown("""
            ```julia
                cyto_cytoscape(
                    id="cytoscape-layout-7",
                    elements=elements,
                    style=Dict("width" =>  "100%", "height" =>  "350px"),
                    layout=Dict(
                        "name" =>  "breadthfirst",
                        "roots" =>  "#van, #mtl"
                    )
                )
            ```
        """),
        layout"fine_tuning3",
        html_details(open=false, children=[
            html_summary("View Full Source"),
            source"fine_tuning3"
        ]),

        html_blockquote([
            dcc_markdown("""
            Notice here that we are not giving the ID of the nodes to the roots key, but instead using a specific syntax to select the desired elements. This concept of **[selector is extensively documented in Cytoscape](https://js.cytoscape.org/#selectors)**.js, and will be further explored in **[part 3](https://dash-julia.plotly.com/cytoscape/styling)**. We follow the same syntax as the Javascript library.
            """)
        ]),
        
        dcc_markdown("""
            For preset layouts, you can also specify the positions for which you would like to render each of your nodes:
        """),

        dcc_markdown("""
            ```julia
                cyto_cytoscape(
                    id="cytoscape-layout-8",
                    elements=elements,
                    style=Dict("width" =>  "100%", "height" =>  "350px"),
                    layout=Dict(
                        "name" =>  "preset",
                        "positions" =>  Dict(
                            node["data"]["id"] =>  node["position"]
                            for node in nodes
                        )
                    )
                )
            ```
        """),
        layout"fine_tuning4",
        html_details(open=false, children=[
            html_summary("View Full Source"),
            source"fine_tuning4"
        ]),

        html_blockquote([
            dcc_markdown("""
                In the callbacks chapter, you will learn how to interactively update your layout; in order to use `preset`, you will need to specify the position of each node.
            """)
        ]),

        html_h3("Physics-based Layouts"),

        dcc_markdown("""
            Additionally, the cose layout can be used to position the nodes using a force-directed layout by simulating attraction and repulsion among the elements, based on the paper by **[Dogrusoz et al, 2009](https://dl.acm.org/citation.cfm?id=1498047)**.
        """),

        dcc_markdown("""
            ```julia
                cyto_cytoscape(
                    id="cytoscape-layout-9",
                    elements=elements,
                    style=Dict("width" =>  "100%", "height" =>  "350px"),
                    layout=Dict(
                        "name" =>  "cose"
                    )
                )
            ```
        """),
        layout"physics_based",
        html_details(open=false, children=[
            html_summary("View Full Source"),
            source"physics_based"
        ])
        
        # html_h3("Loading External Layout"),

        # html_blockquote([
        #     dcc_markdown("""
        #         External layouts are now available! Update your `DashCytoscape.jl` to **[version 0.1.1](https://github.com/plotly/dash-cytoscape/pull/50)** or later.
        #     """)
        # ])

        
    end

end