@doc_chapter "/clientside-callbacks" begin
    @example graph_update_fe_be "graph_update_fe_be.jl"
    @example graph_update_fe_be_plotlyjs "graph_update_fe_be_plotlyjs.jl"

    @layout html_div() do
        html_h1("Clientside Callbacks"),
        dcc_markdown("""

        Sometimes callbacks can incur a significant overhead, especially when they:
        - receive and/or return very large quantities of data (transfer time)
        - are called very often (network latency, queuing, handshake)
        - are part of a callback chain that requires multiple roundtrips
        between the browser and Dash

        When the overhead cost of a callback becomes too great and no
        other optimization is possible, the callback can be modified to be run
        directly in the browser instead of a making a request to Dash.

        The syntax for the callback is almost exactly the same; you use
        `Input` and `Output` as you normally would when declaring a callback,
        but you also define a JavaScript function as the first argument to the
        `@app.callback` decorator.

        For example, the following callback.

        ```julia
        callback!(
            app,
            Output("out-component", "value"),
            Input("in-component1", "value"),
            Input("in-component2", "value")
        ) do large_value1, large_value2
            large_value_output = some_transform(large_value1, large_value2)
        end
        ```

        ***

        Can be rewritten to use JavaScript like so:

        ```julia
        callback!(
            \"\"\"
            function(largeValue1, largeValue2) {
                return someTransform(largeValue1, largeValue2);
            }
            \"\"\"
            app,
            Output("out-component", "value"),
            Input("in-component1", "value"),
            Input("in-component2", "value")
        )
        ```

        ***

        You also have the option of defining the function in a `.js` file in
        your `assets/` folder. To achieve the same result as the code above,
        the contents of the `.js` file would look like this:

        ```javascript
        window.dash_clientside = Object.assign({}, window.dash_clientside, {
            clientside: {
                large_params_function: function(largeValue1, largeValue2) {
                    return someTransform(largeValue1, largeValue2);
                }
            }
        });
        ```

        ***

        In Dash, the callback would now be written as:

        ```julia
        callback!(
            ClientsideFunction("clientside", "large_params_function"),
            app,
            Output("out-component", "value"),
            Input("in-component1", "value"),
            Input("in-component2", "value")
        )
        ```

        ***

        ## A simple example

        Below are two examples of using clientside callbacks to update a
        graph in conjunction with a `dcc.Store` component. In these
        examples, we update a `dcc.Store` component on the backend; to
        create and display the graph, we have a clientside callback in the
        frontend that adds some extra information about the layout that we
        specify using the radio buttons under "Graph scale".

        """),
        source"graph_update_fe_be",
        layout"graph_update_fe_be",
        dcc_markdown("""
        Note that, in this example, we are manually creating the `figure`
        dictionary by extracting the relevant data from the
        dataframe. This is what gets stored in our `dcc.Store` component;
        expand the "Contents of figure storage" above to see exactly what
        is used to construct the graph.

        ### Using PlotlyJS.jl to generate a figure

        PlotlyJS.jl enables you to create one-line declarations of
        figures. We can rework the example above to use Plotly Express.
        """),
        source"graph_update_fe_be_plotlyjs",
        layout"graph_update_fe_be_plotlyjs",
        dcc_markdown("""

        Again, you can expand the "Contents of figure storage" section
        above to see what gets generated. You may notice that this is
        quite a bit more extensive than the previous example; in
        particular, a `layout` is already defined. So, instead of creating
        a `layout` as we did previously, we have to mutate the existing
        layout in our JavaScript code.

        ***

        **Note**: There are a few limitations to keep in mind:

        1. Clientside callbacks execute on the browser's main thread and will block
        rendering and events processing while being executed.
        2. Dash does not currently support asynchronous clientside callbacks and will
        fail if a `Promise` is returned.
        3. Clientside callbacks are not possible if you need to refer to global
        variables on the server or a DB call is required.


        """)
    end
end

