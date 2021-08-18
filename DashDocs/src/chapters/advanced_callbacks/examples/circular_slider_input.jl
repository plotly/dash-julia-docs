# TODO: as of 2021-08-11 this example does not work because circular updates
#       are not supported, even within the same callback
using Dash, DashHtmlComponents, DashCoreComponents, Dates

external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]

app = dash(external_stylesheets=external_stylesheets, suppress_callback_exceptions=true)

app.layout = html_div() do
    dcc_slider(
        id="slider-circular",
        min=0,
        max=20,
        marks=Dict(i => "$i" for i in 0:20),
        value=3,
    ),
    dcc_input(id="input-circular", type="number", min=0, max=20, value=3)
end

callback!(
    app,
    Output("input-circular", "value"),
    Output("slider-circular", "value"),
    Input("input-circular", "value"),
    Input("slider-circular", "value"),
) do input_value, slider_value
    ctx = callback_context()
    trigger_id = split(ctx.triggered[1].prop_id)[1]
    value = trigger_id == "input-circular" ? input_value : slider_value
    return value, value
end

run_server(app, "0.0.0.0", 8432, debug=true)
