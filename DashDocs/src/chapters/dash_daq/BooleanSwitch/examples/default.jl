using Dash, DashHtmlComponents
using DashDaq

external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]

app = dash(external_stylesheets=external_stylesheets)

app.layout = html_div([
    daq_booleanswitch(
        id="my-boolean-switch",
        on=false
    ),
    html_div(id="boolean-switch-output")
])


callback!(app,
    Output("boolean-switch-output", "children"),
    [Input("my-boolean-switch", "on")]) do on
    return "The switch is $on"
end

run_server(app, "0.0.0.0", debug=true)