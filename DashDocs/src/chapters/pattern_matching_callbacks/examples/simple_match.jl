using Dash, DashHtmlComponents, DashCoreComponents

external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]

app = dash(external_stylesheets=external_stylesheets, suppress_callback_exceptions=true)

app.layout = html_div() do
    html_button("Add Filter", id="dynamic-add-filter", n_clicks=0),
    html_div(id="dynamic-dropdown-container", children=[])
end

function display_dropdowns(n_clicks, children)
    new_element = html_div([
        dcc_dropdown(
            id=(type = "dynamic-dropdown", index = n_clicks),
            options=[(label = i, value = i) for i in ["NYC", "MTL", "LA", "TOKYO"]]
        ),
        html_div(id=(type = "dynamic-output", index = n_clicks))
    ])
    push!(children, new_element)
    children
end

callback!(
    display_dropdowns,
    app,
    Output("dynamic-dropdown-container", "children"),
    Input("dynamic-add-filter", "n_clicks"),
    State("dynamic-dropdown-container", "children"),
)

callback!(
    app,
    Output((type = "dynamic-output", index = MATCH), "children"),
    Input((type = "dynamic-dropdown", index = MATCH), "value"),
    State((type = "dynamic-dropdown", index = MATCH), "id"),
) do value, id
    html_div("Dropdown $(id.index + 1) = $(value)")
end

run_server(app, "0.0.0.0", debug=true)
