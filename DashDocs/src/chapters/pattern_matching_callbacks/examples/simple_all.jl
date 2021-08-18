using Dash, DashHtmlComponents, DashCoreComponents

external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]

app = dash(external_stylesheets=external_stylesheets, suppress_callback_exceptions=true)

app.layout = html_div() do
    html_button("Add Filter", id="add-filter", n_clicks=0),
    html_div(id="dropdown-container", children=[]),
    html_div(id="dropdown-container-output")
end

callback!(
    app,
    Output("dropdown-container", "children"),
    Input("add-filter", "n_clicks"),
    State("dropdown-container", "children"),
) do n_clicks, children
    new_dropdown = dcc_dropdown(
        id=(type = "filter-dropdown", index = n_clicks),
        options=[(label = i, value = i) for i in ["NYC", "MTL", "LA", "TOKYO"]]
    )
    push!(children, new_dropdown)
    children
end

callback!(
    app,
    Output("dropdown-container-output", "children"),
    Input((type = "filter-dropdown", index = ALL), "value"),
) do values
    html_div([
        html_div("Dropdown $(i) = $(value)") for (i, value) in enumerate(values)
    ])
end

run_server(app, "0.0.0.0", debug=true)
