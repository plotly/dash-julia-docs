using Dash, DashHtmlComponents, DashCoreComponents, Dates

external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]

app = dash(external_stylesheets=external_stylesheets, suppress_callback_exceptions=true)

app.layout = html_div() do
    dcc_location(id="url"),
    html_div(id="layout-div"),
    html_div(id="content")
end

display_page(pathname) = html_div([
    dcc_input(id="input", value="hello world"),
    html_div(id="output")
])

callback!(
    display_page,
    app,
    Output("content", "children"),
    Input("url", "pathname")
)

function update_output(value)
    println(">>> update_output")
    value
end

callback!(
    update_output,
    app,
    Output("output", "children"),
    Input("input", "value"),
    prevent_initial_call=true
)


function update_layout_div(value)
    println(">>> update_layout_div")
    value
end

callback!(
    update_layout_div,
    app,
    Output("layout-div", "children"),
    Input("input", "value"),
    prevent_initial_call=true
)

run_server(app, "0.0.0.0", debug=true)
