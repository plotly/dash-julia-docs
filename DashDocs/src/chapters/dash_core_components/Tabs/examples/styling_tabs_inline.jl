using Dash, DashHtmlComponents, DashCoreComponents

app = dash()

tabs_styles = (
    height = "44px",
)

tabs_style = (
    borderBottom = "1px solid #d6d6d6",
    padding = "6px",
    fontWeight = "bold",
)

tabs_selected_style = (
    borderTop = "1px solid #d6d6d6",
    borderBottom = "1px solid #d6d6d6",
    backgroundColor = "#119DFF",
    color = "white",
    padding = "6px",
)

app.layout = html_div() do
    dcc_tabs(
        id="tabs-styled-inline",
        value="tab-1",
        style=tabs_styles,
        children=[
            dcc_tab(label="Tab 1", value="tab-1", style=tabs_style, selected_style=tabs_selected_style),
            dcc_tab(label="Tab 2", value="tab-2", style=tabs_style, selected_style=tabs_selected_style),
            dcc_tab(label="Tab 3", value="tab-3", style=tabs_style, selected_style=tabs_selected_style),
            dcc_tab(label="Tab 4", value="tab-4", style=tabs_style, selected_style=tabs_selected_style),
        ]
    ),
    html_div(id="tabs-content-inline")
    
end


callback!(
    app,
    Output("tabs-content-inline", "children"),
    Input("tabs-styled-inline", "value"),
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