using Dash, DashHtmlComponents, DashCoreComponents

app = dash()

app.layout = html_div() do
    dcc_tabs(
        id="tabs-2",
        value="tab-1",
        children=[
            dcc_tab(label="Tab one", value="tab-1"),
            dcc_tab(label="Tab two", value="tab-2")
        ]
    ),
    html_div(id="tabs-content-1")
      
end


callback!(
    app,
    Output("tabs-content-1", "children"),
    Input("tabs-2", "value"),
) do tab

    if tab == "tab-1"
        return html_div(
            html_h3("Tab content 1")
        )
    elseif tab == "tab-2" 
        return html_div(
            html_h3("Tab content 2")
        )
    end
    
end

run_server(app, "0.0.0.0", debug=true)