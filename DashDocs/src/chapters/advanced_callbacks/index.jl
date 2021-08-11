@doc_chapter "/advanced-callbacks" begin
    @example prevent_update_button "prevent_update_button.jl"
    @example prevent_update "prevent_update.jl"
    @example last_clicked_button "last_clicked_button.jl"
    @example callbacks_initial_call "callbacks_initial_call.jl"
    @example callbacks_user_interaction "callbacks_user_interaction.jl"
    @example callbacks_prevent_initial_call "callbacks_prevent_initial_call.jl"

    @layout html_div() do
        html_h1("Advanced Callbacks"),
        dcc_markdown("""
        ## Catching errors with `PreventUpdate`

        In certain situations, you don't want to update the callback output. You can
        achieve this by throwing a `PreventUpdate` exception in the callback function."""),
        source"prevent_update_button",
        layout"prevent_update_button",
        dcc_markdown("""
        ## Displaying errors with `no_update()`

        This example illustrates how you can show an error while keeping the previous
        input, using `no_update()` to update the output partially.
        """),
        source"prevent_update",
        layout"prevent_update",
        dcc_markdown("""
        ## Determining which `Input` has fired with `callback_context()`

        In addition to event properties like `n_clicks`
        that change whenever an event happens (in this case a click), there is a
        function `callback_context()`, available only inside a callback.
        It has properties:
        - `triggered`: list of changed properties. This will be empty on initial
          load, unless an `Input` prop got its value from another initial callback.
          After a user action it is a length-1 list, unless two properties of a
          single component update simultaneously, such as a value and a timestamp
          or event counter.
        - `inputs` and `states`: allow you to access the callback params
          by id and prop instead of through the function args. These have the form
          of Dicts `Dict("component_id.prop_name" => value, "component_id2.prop_name" => value )`

        Here"s an example of how this can be done:"""),
        source"last_clicked_button",
        layout"last_clicked_button",
        dcc_markdown("""
        ## When Are Callbacks Executed?

        This section describes the circumstances under which the `dash-renderer` front-end client can make a request to the Dash back-end server (or the clientside callback code) to execute a callback function.

        ### When A Dash App First Loads

        All of the callbacks in a Dash app are executed with the initial value of their inputs when the app is first loaded. This is known as the "initial call" of the callback. To learn how to suppress this behavior, see the documentation for the [`prevent_initial_call`](#prevent-callbacks-from-being-executed-on-initial-load) attribute of Dash callbacks.

        It is important to note that when a Dash app is initially loaded in a web browser by the `dash-renderer` front-end client, its entire callback chain is introspected recursively.

        This allows the `dash-renderer` to predict the order in which callbacks will need to be executed, as callbacks are blocked when their inputs are outputs of other callbacks which have not yet fired. In order to unblock the execution of these callbacks, first callbacks whose inputs are immediately available must be executed. This process helps the `dash-renderer` to minimize the time and effort it uses, and avoid unnecessarily redrawing the page, by making sure it only requests that a callback is executed when all of the callback"s inputs have reached their final values.

        Examine the following Dash app:"""),
        source"callbacks_initial_call",
        layout"callbacks_initial_call",
        dcc_markdown("""
        Notice that when this app is finished being loaded by a web browser and ready for user interaction, the `html.Div` components do not say "callback not executed" as declared in the app"s layout, but rather "n_clicks is nothing," the result of the `change_text(n_clicks)` callback being executed. This is because the "initial call" of the callback occurred with `n_clicks` having the value of `nothing`.

        ### As A Direct Result of User Interaction

        Most frequently, callbacks are executed as a direct result of user interaction, such as clicking a button or selecting an item in a dropdown menu. When such interactions occur, Dash components communicate their new values to the `dash-renderer` front-end client, which then requests that the Dash server execute any callback function that has the newly changed value as input.

        If a Dash app has multiple callbacks, the `dash-renderer` requests callbacks to be executed based on whether or not they can be immediately executed with the newly changed inputs. If several inputs change simultaneously, then requests are made to execute them all.

        Whether or not these requests are executed in a synchronous or asyncrounous manner depends on the specific setup of the Dash back-end server. If it is running in a multi-threaded environment, then all of the callbacks can be executed simultaneously, and they will return values based on their speed of execution. In a single-threaded environment however, callbacks will be executed one at a time in the order they are received by the server.

        In the example application above, clicking the button results in the callback being executed.

        ### As An Indirect Result of User Interaction

        When a user interacts with a component, the resulting callback might have outputs that are themselves the input of other callbacks. The `dash-renderer` will block the execution of such a callback until the callback whose output is its input has been executed.

        Take the following Dash app:"""),
        source"callbacks_user_interaction",
        layout"callbacks_user_interaction",
        dcc_markdown("""

        The above Dash app demonstrates how callbacks chain together. Notice that if you first click "execute slow callback" and then click "execute fast callback", the third callback is not executed until after the slow callback finishes executing. This is because the third callback has the second callback"s output as its input, which lets the `dash-renderer` know that it should delay its execution until after the second callback finishes.


        ### When Dash Components Are Added To The Layout

        It is possible for a callback to insert new Dash components into a Dash app"s layout. If these new components are themselves the inputs to other callback functions, then their appearance in the Dash app"s layout will trigger those callback functions to be executed.

        In this circumstance, it is possible that multiple requests are made to execute the same callback function. This would occur if the callback in question has already been requested and its output returned before the new components which are also its inputs are added to the layout.

        """),
        dcc_markdown("""
        ## Prevent Callback Execution Upon Initial Component Render

        You can use the `prevent_initial_call` attribute to prevent callbacks from firing when their inputs initially appear in the layout of your Dash application.

        This attribute applies when the layout of your Dash app is initially loaded, and also when new components are introduced into the layout when a callback has been triggered.

        """),
        source"callbacks_prevent_initial_call",
        layout"callbacks_prevent_initial_call",
        dcc_markdown("""

        However, the above behavior only applies if both the callback output and input are present in the app layout upon initial load of the application.

        It is important to note that `prevent_initial_call` will not prevent a callback from firing in the case where the callback"s input is inserted into the layout as the result of another callback after the app initially loads **unless the output is inserted alongside that input**!

        In other words, if the output of the callback is already present in the app layout before its input is inserted into the layout, `prevent_initial_call` will not prevent its execution when the input is first inserted into the layout.

        Consider the following example:
        ```julia
        using Dash, DashHtmlComponents, DashCoreComponents, Dates

        external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]

        app = dash(external_stylesheets=external_stylesheets, suppress_callback_exceptions=true)

        app.layout = html_div() do
            dcc_location(id="url"),
            html_div(id="layout-div"),
            html_div(id="content")
        end

        callback!(
            app,
            Output("content", "children"),
            Input("url", "pathname")
        ) do pathanme
            html_div([
                dcc_input(id="input", value="hello world"),
                html_div(id="output")
            ])
        end

        callback!(
            app,
            Output("output", "children"),
            Input("input", "value"),
            prevent_initial_call=true
        ) do value
            println(">>> update_output")
            value
        end

        callback!(
            app,
            Output("layout-div", "children"),
            Input("input", "value"),
            prevent_initial_call=true
        )  do value
            println(">>> update_layout_div")
            value
        end
        ```
        In this case, `prevent_initial_call` will prevent the `update_output()` callback from firing when its input is first inserted into the app layout as a result of the `display_page()` callback. This is because both the input and output of the callback are already contained within the app layout when the callback executes.

        However, because the app layout contains only the output of the callback, and not its input, `prevent_initial_call` will not prevent the `update_layout_div()` callback from firing. Since `suppress_callback_exceptions=True` is specified here, Dash has to assume that the input is present in the app layout when the app is initialized. From the perspective of the output element in this example, the new input component is handled as if an existing input had been provided a new value, rather than treating it as initially rendered.""")
    end
end

