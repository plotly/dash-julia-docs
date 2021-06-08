using Dash, DashHtmlComponents, DashCoreComponents

app = dash()

app.layout = html_div() do
    html_i("Try typing in input 1 & 2, and observe how debounce is impacting the callbacks. Press Enter and/or Tab key in Input 2 to cancel the delay."),
    html_br(),
    dcc_input(id="input-no-debounce", type="text", value=""),
    dcc_input(id="input-debounce", type="text", value="", debounce=true),
    html_div(id = "output-keywords1")
end

callback!(
    app,
    Output("output-keywords1", "children"),
    Input("input-no-debounce", "value"),
    Input("input-debounce", "value"),
) do input_1, input_2
    return "Input 1 is \"$input_1\" and Input 2 is \"$input_2\""
end

run_server(app, "0.0.0.0", debug=true)
