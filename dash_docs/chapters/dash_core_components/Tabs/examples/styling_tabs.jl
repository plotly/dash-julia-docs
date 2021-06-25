using Dash, DashHtmlComponents, DashCoreComponents

app = dash()

app.layout = html_div() do
    dcc_tabs(
        id="tabs-with-classes",
        value="tab-2",
        parent_className="custom-tabs",
        className="custom-tabs-container",
        children=[
            dcc_tab(
                label="Tab one", 
                value="tab-1",
                className="custom-tab",
                selected_className="custom-tab--selected"
            ),
            dcc_tab(
                label="Tab two", 
                value="tab-2",
                className="custom-tab",
                selected_className="custom-tab--selected"
            ),
            dcc_tab(
                label="Tab three, multiline", 
                value="tab-3",
                className="custom-tab",
                selected_className="custom-tab--selected"
            ),
            dcc_tab(
                label="Tab four", 
                value="tab-4",
                className="custom-tab",
                selected_className="custom-tab--selected"
            ),
        ]
    ),
    html_div(id="tabs-content-classes")
    
end


callback!(
    app,
    Output("tabs-content-classes", "children"),
    Input("tabs-with-classes", "value"),
) do tab

    if tab == "tab-1"
        return html_div(
            html_h3("Tab content 1")
        )
    elseif tab == "tab-2" 
        return html_div(
            html_h3("Tab content 2")
        )
    elseif tab == "tab-3" 
        return html_div(
            html_h3("Tab content 3")
        )
    elseif tab == "tab-4" 
        return html_div(
            html_h3("Tab content 4")
        )
    end
    
end

run_server(app, "0.0.0.0", debug=true)