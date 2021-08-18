using Dash, DashHtmlComponents, DashCoreComponents, Dates

external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]

app = dash(external_stylesheets=external_stylesheets)

app.layout = html_div() do
    html_button("execute callbacks", id="button_2"),
    html_div(children="callback not executed", id="first_output_2"),
    html_div(children="callback not executed", id="second_output_2"),
    html_div(children="callback not executed", id="third_output_2"),
    html_div(children="callback not executed", id="fourth_output_2")
end

callback!(
    app,
    Output("first_output_2", "children"),
    Output("second_output_2", "children"),
    Input("button_2", "n_clicks"),
    prevent_initial_call=true,
) do n
    s = "in the first callback it is $(Dates.format(now(), "HH:MM:SS"))"
    return s, s
end

callback!(
    app,
    Output("third_output_2", "children"),
    Input("second_output_2", "children"),
    prevent_initial_call=true,
) do n
    sleep(2)
    "in the second callback it is $(Dates.format(now(), "HH:MM:SS"))"
end

callback!(
    app,
    Output("fourth_output_2", "children"),
    Input("first_output_2", "children"),
    Input("third_output_2", "children"),
    prevent_initial_call=true,
) do n, m
    "in the third callback it is $(Dates.format(now(), "HH:MM:SS"))"
end

run_server(app, "0.0.0.0", debug=true)
