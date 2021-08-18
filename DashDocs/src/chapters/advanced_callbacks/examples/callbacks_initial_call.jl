using Dash, DashHtmlComponents, DashCoreComponents

external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]

app = dash(external_stylesheets=external_stylesheets)

app.layout = html_div() do
    html_button("execute callback", id="button_1"),
    html_div(children="callback not executed", id="first_output_1"),
    html_div(children="callback not executed", id="second_output_1")
end


function change_text(n_clicks)
    "n_clicks is $n_clicks", "n_clicks is $n_clicks"
end

callback!(
    change_text,
    app,
    Output("first_output_1", "children"),
    Output("second_output_1", "children"),
    Input("button_1", "n_clicks"),
)

run_server(app, "0.0.0.0", debug=true)
