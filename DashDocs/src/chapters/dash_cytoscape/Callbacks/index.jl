@doc_chapter "/cytoscape/callbacks" begin

    @example add_remove_node "add_remove_node.jl"
    @example add_remove_button "add_remove_button.jl"
    @example change_color "change_color.jl"
    @example change_colorf "change_colorf.jl"
    @example change_color_input "change_color_input.jl"    
    @example changing_layouts "changing_layouts.jl"
    @example changing_layoutsf "changing_layoutsf.jl"
    @example dropdown_ex "dropdown_ex.jl"


    @layout html_div() do
        html_h1("Dash Callbacks for Cytoscape"),
        dcc_markdown("""
            **[Dash callbacks](https://dash-julia.plotly.com/basic-callbacks)** allow you to update your Cytoscape graph via other components like dropdowns, buttons, and sliders. If you have used Cytoscape.js before, you have probably used event handlers to interactively update your graph; with Dash Cytoscape, we will instead use callbacks.
        """),
        html_h3("Changing Layouts"),
        dcc_markdown("""
            Consider the graph containing North American cities from the layout chapter. We have shown in that chapter how to display the same graph in multiple layouts. But what if we want to introduce the option for the user to interactively update the layouts?

            Recall the declaration of the graph:
        """),
        html_details(open=false, children=[
            html_summary("View Elements Declaration"),
            dcc_markdown("""
                ```julia
                    nodes = [
                        Dict(
                            "data" =>  Dict("id" =>  short, "label" =>  label),
                            "position" =>  Dict("x" =>  20*lat, "y" =>  -20*long)
                        )
                        for (short, label, long, lat) in (
                            ("la", "Los Angeles", 34.03, -118.25),
                            ("nyc", "New York", 40.71, -74),
                            ("to", "Toronto", 43.65, -79.38),
                            ("mtl", "Montreal", 45.50, -73.57),
                            ("van", "Vancouver", 49.28, -123.12),
                            ("chi", "Chicago", 41.88, -87.63),
                            ("bos", "Boston", 42.36, -71.06),
                            ("hou", "Houston", 29.76, -95.37)
                        )
                    ]
                    
                    edges = [
                        Dict("data" =>  Dict("source" =>  source, "target" =>  target))
                        for (source, target) in (
                            ("van", "la"),
                            ("la", "chi"),
                            ("hou", "chi"),
                            ("to", "mtl"),
                            ("mtl", "bos"),
                            ("nyc", "bos"),
                            ("to", "hou"),
                            ("to", "nyc"),
                            ("la", "nyc"),
                            ("nyc", "bos")
                        )
                    ]
                    
                    elements = vcat(nodes, edges)
                ```
            """)
        ]),
        dcc_markdown("""
            ```julia
                cyto_cytoscape(
                    id="cytoscape-callbacks-1",
                    elements=elements,
                    style=Dict("width" =>  "100%", "height" =>  "400px"),
                    layout=Dict(
                        "name" =>  "grid"
                    )
                )
            ```
        """),
        layout"changing_layoutsf",
        dcc_markdown("""
            What we want to modify is the argument to `layout`. To do so, we could use a `DashCoreComponents.dcc_dropdown` with the name of the layouts as options. We could set the default value to `'grid'`, and force it to be unclearable (since we do not want to pass a dictionary with null value to `Cytoscape`).
            ```julia
                dcc_dropdown(
                    id="dropdown-callbacks-1",
                    value="grid",
                    clearable=false,
                    options=[
                        Dict("label" =>  uppercase(name), "value" =>  name)
                        for name in ["grid", "random", "circle", "cose", "concentric"]
                    ]
                )
            ```
        """),
        layout"dropdown_ex",
        dcc_markdown("""
            The construction of the callback becomes extremely easy. We simply create a function as such:
            ```julia
                callback!(app,
                    Output("cytoscape-callbacks-1", "layout"),
                    Input("dropdown-callbacks-1", "value")
                ) do layout
                    return Dict(
                        "name" =>  layout
                    )
                end
            ```
            In fact, it is even possible to animate the layouts after an update! Simply enable `animate`:
            ```julia
                callback!(app,
                    Output("cytoscape-callbacks-1", "layout"),
                    Input("dropdown-callbacks-1", "value")
                ) do layout
                    return Dict(
                        "name" =>  layout,
                        "animate" => true
                    )
                end
            ```
            Piecing everything together, we get:
        """),
        source"changing_layouts",
        layout"changing_layouts",
        html_blockquote([
            dcc_markdown("""
                Notice we did not include an animation for `preset`. As discussed in the layout chapter, you will need to specify the position of the nodes inside of the `layout` dictionary.
            """)
        ]),
        html_h3("Interactively update styles"),
        dcc_markdown("""
            Updating the stylesheet using Dash components is similar to updating layouts, although it can get more complex. Indeed, you can choose to create a default stylesheet, and append new styles to that stylesheet every time a designated callback is fired. Let's take the following stylesheet:
            ```julia
                default_stylesheet = [
                    Dict(
                        "selector" =>  "node",
                        "style" =>  Dict(
                            "background-color" =>  "#BFD7B5",
                            "label" =>  "data(label)"
                        )
                    ),
                    Dict(
                        "selector" =>  "edge",
                        "style" =>  Dict(
                            "line-color" =>  "#A3C4BC"
                        )
                    )
                ]
            ```
            This is generally declared at the beginning of your script, before layout declaration (therefore it is shared across sessions). The city graph will look something like this:
            ```julia
                cyto_cytoscape(
                    id="cytoscape-callbacks-2",
                    elements=elements,
                    stylesheet=default_stylesheet,
                    style=Dict("width" =>  "100%", "height" =>  "400px"),
                    layout=Dict(
                        "name" =>  "circle"
                    )
                )
            ```
        """),
        layout"change_colorf",
        dcc_markdown("""
            ```julia
                html_div([
                    html_div(style=Dict("width" =>  "50%", "display" =>  "inline"), children=[
                        "Edge Color:  ",
                        dcc_input(id="input-line-color", type="text")
                    ]),
                    html_div(style=Dict("width" =>  "50%", "display" =>  "inline"), children=[
                        "Node Color:  ",
                        dcc_input(id="input-bg-color", type="text")
                    ])
                ])
            ```
        """),
        layout"change_color_input",
        dcc_markdown("""
            All we need now is to assign a callback that will add new styles to the default stylesheet in order to change the default color:
            ```julia
            callback!(app,
                Output("cytoscape-callbacks-2", "stylesheet"),
                Input("input-line-color", "value"),
                Input("input-bg-color", "value")
            ) do line_color, bg_color
                if line_color isa Nothing
                    line_color = ""
                end
            
                if bg_color isa Nothing
                    bg_color = ""
                end
            
                new_styles = [
                    Dict(
                        "selector" =>  "node",
                        "style" =>  Dict(
                            "background-color" =>  bg_color
                        )
                    ),
                    Dict(
                        "selector" =>  "edge",
                        "style" =>  Dict(
                            "line-color" =>  line_color
                        )
                    )
                ]
            
                return vcat(default_stylesheet, new_styles)
            end
            ```
            Notice that we are setting the line and background color to an empty string when they are set to `Nothing`; this is to avoid feeding `Nothing` to the dictionary, since it is not accepted by `Cytoscape`.

            However, passing any string value to the dictionary is accepted, even when the string value is not recognized. Therefore, the callback is fired every time you type a new character, but the changes are only applied when `Cytoscape` recognizes the input, which in this case could be the name of a color, the hex code, or the rgb function.

            Below, we show how the entire app is constructed:
        """),
        source"change_color",
        layout"change_color",
        dcc_markdown("""
            In this example, we are not appending the new styles directly to the default style, but instead concatenating `default_stylesheet` with new_styles. This is because any modification to `default_stylesheet` will be permanent, which is not a good thing if you are hosting your app for many users (since `default_stylesheet` is shared across all user sessions).
        """),
        html_h3("Adding and removing elements"),
        dcc_markdown("""
            One useful aspect of callbacks is the ability to add and remove elements. By using elements as a state of your callback, you can decide to manipulate it in order to add elements whenever another Dash component is updated.

            Let's take as an example a simple app where you can add and remove nodes by clicking two html buttons (with the same graph as above):
            ```julia
                html_div([
                    html_button("Add Node", id="btn-add-node-example", n_clicks_timestamp=0),
                    html_button("Remove Node", id="btn-remove-node-example", n_clicks_timestamp=0)
                ])
            ```
        """),
        layout"add_remove_button", 
        dcc_markdown("""
            The following callback would be needed:
            ```julia
                callback!(app,
                    Output("cytoscape-callbacks-2", "elements"),
                    Input("btn-add-node-example", "n_clicks_timestamp"),
                    Input("btn-remove-node-example", "n_clicks_timestamp"),
                    State("cytoscape-callbacks-2", "elements")
                ) do btn_add, btn_remove, elements
                    # If the add button was clicked most recently
                    if Int(btn_add) > Int(btn_remove)
                        next_node_idx = count(isdefined.(elements,Symbol("position")))
                        # As long as we have not reached the max number of nodes, we add them
                        # to the cytoscape elements
                        if next_node_idx < length(nodes)
                            new_nodes = nodes[1:next_node_idx+1]
                            node_ids = map(x->x["data"]["id"], new_nodes)
                            locs = map(x->(
                                (x["data"]["target"] ∈ node_ids ) &&
                                (x["data"]["source"] ∈ node_ids)
                            ),edges)
                            return vcat(edges[locs], new_nodes) 
                        end
                        
                # If the remove button was clicked most recently
                    elseif Int(btn_remove) > Int(btn_add) 
                        if length(elements) > length(edges)
                            return elements[1:end-1]
                        end
                    end
                    # # Neither have been clicked yet (or fallback condition)
                    return elements
                end
            ```
            The first conditional if `Int(btn_add) > Int(btn_remove)` verifies whether the add button was just clicked. If it wasn't, then the remove button is verified with `elseif Int(btn_remove) > Int(btn_add)`. If neither were clicked, then we return the default elements.

            The statement `if next_node_idx < length(nodes)` verifies if we have reached the maximum number of nodes. If not, then we proceed to add the next node. Similarly for the remove case: `if length(elements) > length(edges)` only removes nodes if there is any remaining (so we don't remove any edge). If neither conditions are met, we simply return the current elements.
            
            It's important to mutate the elements object by passing it into the callbacks as State (which is what we are doing here) rather than making it a global variable. In general, global variables should be avoided as they won't work when multiple users are viewing the app or when the app is deployed with multiple gunicorn workers.
            
            You can find the complete app below:
        """),
        source"add_remove_node",
        layout"add_remove_node"

    end
end