@doc_chapter "/cytoscape/events" begin

    @example click_tap "click_tap.jl"
    @example select_multiple "select_multiple.jl"
    @example simple_callback "simple_callback.jl"

    @layout html_div() do
        html_h1("Cytoscape Event Callbacks"),

        dcc_markdown("""
            In [**part 4**](https://dash-julia.plotly.com/cytoscape/callbacks), we showed how to update Cytoscape with other components by assigning callbacks that output to `'elements', 'stylesheet', 'layout'`. Moreover, it is also possible to use properties of Cytoscape as an input to callbacks, which can be used to update other components, or Cytoscape itself. Those properties are updated (which fires the callbacks) when the user interact with elements in a certain way, which justifies the name of event callbacks. You can find props such as `tapNode`, which returns a complete description of the node object when the user clicks or taps on a node, `mouseoverEdgeData`, which returns only the data dictionary of the edge that was most recently hovered by the user. The complete list can be found in the **[Dash Cytoscape Reference](https://dash-julia.plotly.com/cytoscape/reference)**.
        """),
        html_h3("Simple callback construction"),
        dcc_markdown("""
            Let's look back at the same city example as the previous chapter:
            ```julia
                cyto_cytoscape(
                    id="cytoscape-events",
                    layout=Dict("name" =>  "preset"),
                    elements=vcat(edges,nodes),
                    stylesheet=default_stylesheet,
                    style=Dict("width" =>  "100%", "height" =>  "450px")
                )
            ```
            This time, we will use the `tapNodeData` properties as input to our callbacks, which will simply dump the content into an `html_pre`:
        """),
        source"simple_callback",
        layout"simple_callback",
        dcc_markdown("""
            Notice that the `html_div` is updated every time you click or tap a node, and returns the data dictionary of the node. Alternatively, you can use `tapNode` to obtain the entire element specification (given as a dictionary), rather than just its `data`.
        """),
        html_h3("Click, tap and hover"),
        dcc_markdown("""
            Let's now display the data generated whenever you click or hover over a node or an edge. Simply replace the previous layout and callbacks by this:
        """),
        source"click_tap",
        layout"click_tap",
        html_h3("Selecting multiple elements"),
        dcc_markdown("""
            Additionally, you can also display all the data currently selected, either through a box selection (Shift+Click and drag) or by individually selecting multiple elements while holding Shift:
        """),
        source"select_multiple",
        layout"select_multiple"
    end
end