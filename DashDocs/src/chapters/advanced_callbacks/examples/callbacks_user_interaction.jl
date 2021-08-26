using Dash, DashHtmlComponents, DashCoreComponents, Dates

external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]

app = dash(external_stylesheets=external_stylesheets)

app.layout = html_div() do
    html_button("execute fast callback", id="button_3"),
    html_button("execute slow callback", id="button_4"),
    html_div(children="callback not executed", id="first_output_3"),
    html_div(children="callback not executed", id="second_output_3"),
    html_div(children="callback not executed", id="third_output_3")
end

callback!(
    app,
    Output("first_output_3", "children"),
    Input("button_3", "n_clicks"),
) do n
    "in the fast callback it is $(Dates.format(now(), "HH:MM:SS"))"
end

callback!(
    app,
    Output("second_output_3", "children"),
    Input("button_4", "n_clicks"),
) do n
    sleep(5)
    "in the slow callback it is $(Dates.format(now(), "HH:MM:SS"))"
end

callback!(
    app,
    Output("third_output_3", "children"),
    Input("first_output_3", "children"),
    Input("second_output_3", "children"),
) do n, m
    "in the third callback it is $(Dates.format(now(), "HH:MM:SS"))"
end

run_server(app, "0.0.0.0", debug=true)
