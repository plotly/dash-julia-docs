@doc_chapter "/cytoscape/styling" begin

    @example basic "basic.jl"
    @example compare_data_selector "compare_data_selector.jl"
    @example compare_data_selector1 "compare_data_selector1.jl"
    @example compare_data_selector2 "compare_data_selector2.jl"
    @example compare_data_selector3 "compare_data_selector3.jl"
    @example compare_data_selector4 "compare_data_selector4.jl"
    @example compare_data_selector5 "compare_data_selector5.jl"
    @example display_images "display_images.jl"
    @example edge_arrows "edge_arrows.jl"
    @example styling_edge "styling_edge.jl"


    @layout html_div() do
        html_h1("Cytoscape Styling"),

        html_h3(["The ", html_code("stylesheet"), " parameter"]),

        dcc_markdown("""
            Just like how the `elements` parameter takes as an input a list of dictionaries specifying all the elements in the graph, the stylesheet takes a list of dictionaries specifying the style for a group of elements, a class of elements, or a single element. Each of these dictionaries accept two keys:

            * `'selector'`: A string indicating which elements you are styling.
            * `'style'`: A dictionary specifying what exactly you want to modify. This could be the width, height, color of a node, the shape of the arrow on an edge, or many more.

            Both the **[selector string](https://js.cytoscape.org/#selectors)** and **[the style dictionary](https://js.cytoscape.org/#style/node-body)** are exhaustively documented in the Cytoscape.js docs. We will show examples that can be easily modified for any type of design, and you can create your own styles with the **[online style editor](https://dash-gallery.plotly.host/cytoscape-advanced)**.
        """),

        html_h3("Basic selectors and styles"),

        dcc_markdown("""
            We start by looking at the same example shown in the elements chapter, but this time we examine the stylesheet:
        """),

        html_details(open=false, children=[
            html_summary("View simple elements"),
            dcc_markdown("""
                ```julia
                    simple_elements = [
                        Dict(
                            "data" =>  Dict("id" =>  "one", "label" =>  "Modified Color"),
                            "position" =>  Dict("x" =>  75, "y" =>  75),
                            "classes" =>  "red" # Single class
                        ),
                        Dict(
                            "data" =>  Dict("id" =>  "two", "label" =>  "Modified Shape"),
                            "position" =>  Dict("x" =>  75, "y" =>  200),
                            "classes" =>  "triangle" # Single class
                        ),
                        Dict(
                            "data" =>  Dict("id" =>  "three", "label" =>  "Both Modified"),
                            "position" =>  Dict("x" =>  200, "y" =>  75),
                            "classes" =>  "red triangle" # Multiple classes
                        ),
                        Dict(
                            "data" =>  Dict("id" =>  "four", "label" =>  "Regular"),
                            "position" =>  Dict("x" =>  200, "y" =>  200)
                        ),
                        Dict("data" =>  Dict("source" =>  "one", "target" =>  "two"), "classes" =>  "red"),
                        Dict("data" =>  Dict("source" =>  "two", "target" =>  "three")),
                        Dict("data" =>  Dict("source" =>  "three", "target" =>  "four"), "classes" =>  "red"),
                        Dict("data" =>  Dict("source" =>  "two", "target" =>  "four")),
                    ]
                
                ```
            """)
        ]),
        dcc_markdown("""
            ```julia
                cyto_cytoscape(
                    id="cytoscape-styling-1",
                    layout=Dict("name" =>  "preset"),
                    style=Dict("width" =>  "100%", "height" =>  "400px"),
                    elements=simple_elements,
                    stylesheet=[
                        # Group selectors
                        Dict(
                            "selector" =>  "node",
                            "style" =>  Dict(
                                "content" =>  "data(label)"
                            )
                        ),
                
                        # Class selectors
                        Dict(
                            "selector" =>  ".red",
                            "style" =>  Dict(
                                "background-color" =>  "red",
                                "line-color" =>  "red"
                            )
                        ),
                        Dict(
                            "selector" =>  ".triangle",
                            "style" =>  Dict(
                                "shape" =>  "triangle"
                            )
                        )
                    ]
                )
            ```
        """),
        layout"basic",
        html_details(open=false, children=[
            html_summary("View full source"),
            source"basic"
        ]),

        dcc_markdown("""
            In this example, we use the group and class selectors. Group selectors consist of either the string `'node'` or the string `'edge'`, since an element can only be one or the other.

            To select a class, you simply pass `.className` to the selector, where className is the name of one of the classes you assigned to some of your elements. Notice in the example above that if an element has two or more classes, it will accept all the styles that select it.

            Here, we are simultaneously modifying the background and line color of all the elements of class "red". This means that if the element is a node, then it will be filled with red, and it is an edge, then the color of the line will be red. Although this offers great flexibility, you need to be careful with your declaration, since you won't receive warning if you use the wrong key or make a typo. Standard RGB and Hex colors are accepted, along with basic colors recognized by CSS.

            Additionally, the content key takes as value what you want to display above or next to the element on the screen, which in this case is the label inside the data dictionary of the input element. Since we defined a label for each element, that label will be displayed for every node.
        """),

        html_h3("Comparing data items using selectors"),

        dcc_markdown("""
            A nice property of the selector is that it can select elements by comparing a certain item of the data dictionaries with a given value. Say we have some nodes with `id` A to E declared this way:
            ```julia
                Dict("data" =>  Dict("source" =>  "A", "target" =>  "B", "weight" =>  1))
            ```
            where the `'weight'` key indicates the weight of your edge. You can find the declaration below:
        """),
        html_details(open=false, children=[
            html_summary("View weighted elements"),
            dcc_markdown("""
                ```julia
                    weighted_elements = [
                        Dict("data" =>  Dict("id" =>  "A")),
                        Dict("data" =>  Dict("id" =>  "B")),
                        Dict("data" =>  Dict("id" =>  "C")),
                        Dict("data" =>  Dict("id" =>  "D")),
                        Dict("data" =>  Dict("id" =>  "E")),
                    
                        Dict("data" =>  Dict("source" =>  "A", "target" =>  "B", "weight" =>  1)),
                        Dict("data" =>  Dict("source" =>  "A", "target" =>  "C", "weight" =>  2)),
                        Dict("data" =>  Dict("source" =>  "B", "target" =>  "D", "weight" =>  3)),
                        Dict("data" =>  Dict("source" =>  "B", "target" =>  "E", "weight" =>  4)),
                        Dict("data" =>  Dict("source" =>  "C", "target" =>  "E", "weight" =>  5)),
                        Dict("data" =>  Dict("source" =>  "D", "target" =>  "A", "weight" =>  6))
                    ]
                ```
                If you want to highlight all the of the edges above a certain weight (e.g. 3), use the selector `'[weight > 3]'`. For example:

                ```julia
                    cyto_cytoscape(
                        id="cytoscape-styling-2",
                        layout=Dict("name" =>  "circle"),
                        style=Dict("width" =>  "100%", "height" =>  "400px"),
                        elements=weighted_elements,
                        stylesheet=[
                            Dict(
                                "selector" =>  "edge",
                                "style" =>  Dict(
                                    "label" =>  "data(weight)"
                                )
                            ),
                            Dict(
                                "selector" =>  "[weight > 3]",
                                "style" =>  Dict(
                                    "line-color" =>  "blue"
                                )
                            )
                        ]
                    )
                ```
            """)
        ]),
        layout"compare_data_selector",
        html_details(open=false, children=[
            html_summary("View full source"),
            source"compare_data_selector"
        ]), 
        dcc_markdown("""
            Similarly, if you want to have weights smaller or equal to 3, you would write:
            ```julia
                cyto_cytoscape(
                    id="cytoscape-styling-3",
                    layout=Dict("name" =>  "circle"),
                    style=Dict("width" =>  "100%", "height" =>  "400px"),
                    elements=weighted_elements,
                    stylesheet=[
                        Dict(
                            "selector" =>  "edge",
                            "style" =>  Dict(
                                "label" =>  "data(weight)"
                            )
                        ),
                        Dict(
                            "selector" =>  "[weight <= 3]",
                            "style" =>  Dict(
                                "line-color" =>  "blue"
                            )
                        )
                    ]
                )
            ```
        """),
        layout"compare_data_selector1",
        html_details(open=false, children=[
            html_summary("View full source"),
            source"compare_data_selector1"
        ]),
        dcc_markdown("""
            Comparisons also work for string matching problems. Given the same graph as before, but with a data key `'firstname'` for each node:
            ```julia
                Dict("data" =>  Dict("id" =>  "A", "firstname" =>  "Albert"))
            ```   
            We can select all the elements that match a specific pattern. For instance, to style nodes where `'firstname'` contains the substring `'ert'`, we declare: 
        """),
        html_details(open=false, children=[
            html_summary("View named elements"),
            dcc_markdown("""
                ```julia
                    named_elements = [
                        Dict("data" =>  Dict("id" =>  "A", "firstname" =>  "Albert")),
                        Dict("data" =>  Dict("id" =>  "B", "firstname" =>  "Bert")),
                        Dict("data" =>  Dict("id" =>  "C", "firstname" =>  "Charlie")),
                        Dict("data" =>  Dict("id" =>  "D", "firstname" =>  "Daniela")),
                        Dict("data" =>  Dict("id" =>  "E", "firstname" =>  "Emma")),

                        Dict("data" =>  Dict("source" =>  "A", "target" =>  "B")),
                        Dict("data" =>  Dict("source" =>  "A", "target" =>  "C")),
                        Dict("data" =>  Dict("source" =>  "B", "target" =>  "D")),
                        Dict("data" =>  Dict("source" =>  "B", "target" =>  "E")),
                        Dict("data" =>  Dict("source" =>  "C", "target" =>  "E")),
                        Dict("data" =>  Dict("source" =>  "D", "target" =>  "A"))
                    ]
                ```
            """)
        ]), 
        dcc_markdown("""
            ```julia
                cyto_cytoscape(
                    id="cytoscape-styling-4",
                    layout=Dict("name" =>  "circle"),
                    style=Dict("width" =>  "100%", "height" =>  "400px"),
                    elements=named_elements,
                    stylesheet=[
                        Dict(
                            "selector" =>  "node",
                            "style" =>  Dict(
                                "label" =>  "data(firstname)"
                            )
                        ),
                        Dict(
                            "selector" =>  "[firstname *= 'ert']",
                            "style" =>  Dict(
                                "background-color" =>  "#FF4136",
                                "shape" =>  "rectangle"
                            )
                        )
                    ]
                )
            ```
        """),
        layout"compare_data_selector2",
        html_details(open=false, children=[
            html_summary("View full source"),
            source"compare_data_selector2"
        ]),
        dcc_markdown("""
            Now, if we want to select all the elements where `'firstname'` does not contain `'ert'`, then we can run:
            ```julia
                cyto_cytoscape(
                    id="cytoscape-styling-5",
                    layout=Dict("name" =>  "circle"),
                    style=Dict("width" =>  "100%", "height" =>  "400px"),
                    elements=named_elements,
                    stylesheet=[
                        Dict(
                            "selector" =>  "node",
                            "style" =>  Dict(
                                "label" =>  "data(firstname)"
                            )
                        ),
                        Dict(
                            "selector" =>  "[firstname !*= 'ert']",
                            "style" =>  Dict(
                                "background-color" =>  "#FF4136",
                                "shape" =>  "rectangle"
                            )
                        )
                    ]
                )
            ```
        """),
        layout"compare_data_selector3",
        html_details(open=false, children=[
            html_summary("View full source"),
            source"compare_data_selector3"
        ]),
        dcc_markdown("""
            Other options also exist for matching specific parts of the string. For example, if we want to only select the prefix, we can use `^=` as such:
            ```julia
                cyto_cytoscape(
                    id="cytoscape-styling-6",
                    layout=Dict("name" =>  "circle"),
                    style=Dict("width" =>  "100%", "height" =>  "400px"),
                    elements=named_elements,
                    stylesheet=[
                        Dict(
                            "selector" =>  "node",
                            "style" =>  Dict(
                                "label" =>  "data(firstname)"
                            )
                        ),
                        Dict(
                            "selector" =>  "[firstname ^= 'Alb']",
                            "style" =>  Dict(
                                "background-color" =>  "#FF4136",
                                "shape" =>  "rectangle"
                            )
                        )
                    ]
                )
            ``` 
        """),
        layout"compare_data_selector4",
        html_details(open=false, children=[
            html_summary("View full source"),
            source"compare_data_selector4"
        ]),
        dcc_markdown("""   
            This can also be prepended by modifiers. For example, `@` added in front of an operator will render the string matched case insensitive.
            ```julia
                cyto_cytoscape(
                    id="cytoscape-styling-7",
                    layout=Dict("name" =>  "circle"),
                    style=Dict("width" =>  "100%", "height" =>  "400px"),
                    elements=named_elements,
                    stylesheet=[
                        Dict(
                            "selector" =>  "node",
                            "style" =>  Dict(
                                "label" =>  "data(firstname)"
                            )
                        ),
                        Dict(
                            "selector" =>  "[firstname @^= 'alb']",
                            "style" =>  Dict(
                                "background-color" =>  "#FF4136",
                                "shape" =>  "rectangle"
                            )
                        )
                    ]
                )
            ```            
        """),
        layout"compare_data_selector5",
        html_details(open=false, children=[
            html_summary("View full source"),
            source"compare_data_selector5"
        ]),
        dcc_markdown("""
            View the complete list of [matching operations](https://js.cytoscape.org/#selectors/data) for data selectors.
        """),
        html_h3("Styling edges"),
        html_h5("Two-sided edges and curvature"),
        dcc_markdown("""
            Many methods exist to style edges in Dash Cytoscape. In some cases, you might want different ways to display double-edged
        """),
        html_details(open=false, children=[
            html_summary("View double-edged elements"),
            dcc_markdown("""
                ```julia
                    double_edges = [
                        Dict("data" =>  Dict("id" =>  string(src,tgt), "source" =>  src, "target" =>  tgt))
                        for (src, tgt) in ["AB", "BA", "BC", "CB", "CD", "DC", "DA", "AD"]
                    ]

                    double_edged_el = vcat([("data" =>  ("id" =>  id_)) for id_ in "ABCD"],double_edges)

                ```
            """)
        ]),
        dcc_markdown("""
            ```julia
                cyto_cytoscape(
                    id="cytoscape-styling-8",
                    layout=Dict("name" =>  "circle"),
                    style=Dict("width" =>  "100%", "height" =>  "400px"),
                    elements=double_edged_el,
                    stylesheet=[
                        Dict(
                            "selector" =>  "node",
                            "style" =>  Dict(
                                "label" =>  "data(id)"
                            )
                        ),
                        Dict(
                            "selector" =>  "#AB, #BA",
                            "style" =>  Dict(
                                "curve-style" =>  "bezier",
                                "label" =>  "bezier",
                                "line-color" =>  "red"
                            )
                        ),
                        Dict(
                            "selector" =>  "#AD, #DA",
                            "style" =>  Dict(
                                "curve-style" =>  "haystack",
                                "label" =>  "haystack",
                                "line-color" =>  "blue"
                            )
                        ),
                        Dict(
                            "selector" =>  "#DC, #CD",
                            "style" =>  Dict(
                                "curve-style" =>  "segments",
                                "label" =>  "segments",
                                "line-color" =>  "green"
                            )
                        )
                    ]
                )
            ```
        """),
        layout"styling_edge",
        html_details(open=false, children=[
            html_summary("View full source"),
            source"styling_edge"
        ]),
        dcc_markdown("""
            Many curve styles are accepted, and support further customization such as the distance between edges and curvature radius. You can find them in the [JavaScript docs](https://js.cytoscape.org/#style/bezier-edges).
        """),
        html_h5("Edge Arrows"),
        dcc_markdown("""
            To better highlight the directed edges, we can add arrows of different shapes, colors, and positions onto the edges. This is an example of using different types of arrows, with the same graph above, but with certain edges removed:
        """),
        html_details(open=false, children=[
            html_summary("View directed elements"),
            dcc_markdown("""
                ```julia
                    directed_edges = [
                        Dict("data" =>  Dict("id" =>  string(src,tgt), "source" =>  src, "target" =>  tgt))
                        for (src, tgt) in ["BA", "BC", "CD", "DA"]
                    ]

                    directed_elements = vcat([Dict("data" =>  ("id" =>  id_)) for id_ in "ABCD"], directed_edges)

                ```
            """)
        ]),
        dcc_markdown("""
            ```julia
                cyto_cytoscape(
                    id="cytoscape-styling-9",
                    layout=Dict("name" =>  "circle"),
                    style=Dict("width" =>  "100%", "height" =>  "400px"),
                    elements=directed_elements,
                    stylesheet=[
                        Dict(
                            "selector" =>  "node",
                            "style" =>  Dict(
                                "label" =>  "data(id)"
                            )
                        ),
                        Dict(
                            "selector" =>  "edge",
                            "style" =>  Dict(
                                # The default curve style does not work with certain arrows
                                "curve-style" =>  "bezier"
                            )
                        ),
                        Dict(
                            "selector" =>  "#BA",
                            "style" =>  Dict(
                                "source-arrow-color" =>  "red",
                                "source-arrow-shape" =>  "triangle",
                                "line-color" =>  "red"
                            )
                        ),
                        Dict(
                            "selector" =>  "#DA",
                            "style" =>  Dict(
                                "target-arrow-color" =>  "blue",
                                "target-arrow-shape" =>  "vee",
                                "line-color" =>  "blue"
                            )
                        ),
                        Dict(
                            "selector" =>  "#BC",
                            "style" =>  Dict(
                                "mid-source-arrow-color" =>  "green",
                                "mid-source-arrow-shape" =>  "diamond",
                                "mid-source-arrow-fill" =>  "hollow",
                                "line-color" =>  "green",
                            )
                        ),
                        Dict(
                            "selector" =>  "#CD",
                            "style" =>  Dict(
                                "mid-target-arrow-color" =>  "black",
                                "mid-target-arrow-shape" =>  "circle",
                                "arrow-scale" =>  2,
                                "line-color" =>  "black",
                            )
                        )
                    ]
                )
            ```
        """),
        layout"edge_arrows",
        html_details(open=false, children=[
            html_summary("View full source"),
            source"edge_arrows"
        ]),
        dcc_markdown("""
            Notice here that we prepend a position indicator for the color and shape keys. In the previous example, all four possible positions are displayed. In fact, you can even the edges with multiple arrows, all with different colors and shapes. View the [complete list of edge arrow configurations](http://js.cytoscape.org/#style/edge-arrow).
        """),
        html_h3("Displaying Images"),
        dcc_markdown("""
            It is possible to [display images inside nodes](It is possible to display images inside nodes, as documented in Cytoscape.js. We show below a complete example of display an interactive tree of animal phylogeny using images from Wikimedia.), as documented in Cytoscape.js. We show below a complete example of display an interactive tree of animal phylogeny using images from Wikimedia.
        """),
        layout"display_images",
        html_details(open=false, children=[
            html_summary("View full source"),
            source"display_images"
        ])

    end
end