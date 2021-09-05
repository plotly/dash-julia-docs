@doc_chapter "/cytoscape/elements" begin


    @example boolean_properties "boolean_properties.jl"
    @example classes "classes.jl"
    @example compound_nodes "compound_nodes.jl"
    @example element_declaration "element_declaration.jl"
    
    
        @layout html_div() do
            html_h1("Cytoscape Elements"),

            html_h3("Element Declaration"),
            dcc_markdown("""
                Each element is defined by a dictionary declaring its purpose and describing its properties. Usually, you specify what group the element belongs to (i.e., if it's a node or an edge), indicate what position you want to give to your element (if it's a node), or what data it contains. In fact, the `data` and `position` keys are themselves mapped to dictionaries, where each item specify an aspect of the data or position.

                In the case of `data`, the typical keys fed to the dictionaries are:
                
                * `id`: The index of the element, useful when you want to reference it
                * `label`: The name associated with the element if you wish to display it
                If your element is an edge, the following keys are required in your data dictionary:
                
                * `source`: The `id` of the source node, which is where the edge starts
                * `target`: The `id` of the target node, where the edge ends
                The `position` dictionary takes as items the `x` and `y` position of the node. If you use any other layout than `preset`, or if the element is an edge, the position item will be ignored.
                
                If we want a graph with two nodes, and an edge connecting those two nodes, we effectively need three of those element dictionaries, grouped as a list:
            """),       
                        
            source"element_declaration",
            layout"element_declaration",
    
            dcc_markdown("""
                Notice that we also need to specify the `id`, the `layout`, and the `style` of Cytoscape. The `id` parameter is needed for assigning `callbacks`, `style` lets you specify the CSS style of the component (similarly to core components), and layout tells you how to arrange your graph. It is described in depth in [part 2](https://dash-julia.plotly.com/cytoscape/layout), so all you need to know is that `'preset'` will organize the nodes according to the positions you specified.

                The official Cytoscape.js documentation nicely outlines the **[JSON format for declaring elements](https://js.cytoscape.org/#notation/elements-json)**.
            """),
    
            html_h3("Boolean Properties"),    
            
            dcc_markdown("""
                In addition to the properties presented above, the element dictionary can also accept boolean items that specify its state. We extend the previous example in the following way:
            """),

            source"boolean_properties",
            layout"boolean_properties",
    
            html_blockquote([
            dcc_markdown("""
                Note that those boolean properties can be overwritten by certain Cytoscape parameters such as `autoungrabify` or `autounselectify`. Please refer to the **[reference](https://dash-julia.plotly.com/cytoscape/reference)** for more information.
            """),
            ]),

            html_h3("Classes"), 
            
            dcc_markdown("""
                Similarly to CSS classes, element classes are used to style groups of elements using a selector. We modify the previous example by giving the elements a class or multiple classes (separated by a space), and define a stylesheet that modifies the elements based on those classes.
            """),

            source"classes",
            layout"classes",

            html_blockquote([
                dcc_markdown("""
                    The stylesheet parameter will be described in depth in **[part 3](https://dash-julia.plotly.com/cytoscape/styling)** of this guide. We will show extensive examples of using selectors to style groups, classes, and data values. Expand below if you still want to take a look at the stylesheet used previously.
                """)
            ]),

            html_h3("Compound Nodes"), 

            dcc_markdown("""
                A concept introduced in Cytoscape.js, compound nodes are nodes that contain (parent), or are contained (child) inside another node. A parent node does not have have a position nor a size, since those values are automatically calculated based on how the children nodes are configured.

                Here is the example of an app using compound nodes:
            """),

            source"compound_nodes",
            layout"compound_nodes"
        end
    
    end