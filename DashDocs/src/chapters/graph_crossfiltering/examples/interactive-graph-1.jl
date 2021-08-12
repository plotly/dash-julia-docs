using Dash, DashHtmlComponents, DashCoreComponents, PlotlyJS, JSON

app = dash()
fig = plot(
    [
        scatter(
            x=1:4, y=rand(1:5, 4), name="trace1",
            text=string.('a':'d'), customdata=string.('A':'D')
        ),
        scatter(
            x=1:4, y=rand(1:10, 4), name="trace2",
            text=string.('w':'z'), customdata=string.('W':'Z')
        )
    ],
    Layout(
        clickmode="event+select",
        template=Template(data=attr(
            scatter=fill(attr(mode="markers", marker_size=12), 10)
        ))
    )
)
app.layout = html_div() do
    dcc_graph(id = "basic-interactions", figure=fig),
    html_div(
        children = [
            html_div(
                children = [
                    dcc_markdown("
                    **Hover Data**

                    Mouse over values in the graph.
                    "),
                    html_pre(id = "hover-data"),
                ],
            ),
            html_div(
                children = [
                    dcc_markdown("
                    **Click Data**

                    Click on points in the graph.
                    "),
                    html_pre(id = "click-data"),
                ],
            ),
            html_div(
                children = [
                    dcc_markdown("
                    **Selection Data**

                    Choose the lasso or rectangle tool in the graph's menu
                    bar and then select points in the graph.

                    Note that if `layout.clickmode = 'event+select'`, selection data also
                    accumulates (or un-accumulates) selected data if you hold down the shift
                    button while clicking.
                    "),
                    html_pre(id = "selected-data"),
                ],
            ),
            html_div(
                children = [
                    dcc_markdown("
                    **Zoom and Relayout Data**

                    Click and drag on the graph to zoom or click on the zoom
                    buttons in the graph's menu bar.
                    Clicking on legend items will also fire
                    this event.
                    "),
                    html_pre(id = "relayout-data"),
                ],
            ),
        ],
    )

end

callback!(
    JSON.json,
    app,
    Output("hover-data", "children"),
    Input("basic-interactions", "hoverData"),
)
callback!(
    JSON.json,
    app,
    Output("click-data", "children"),
    Input("basic-interactions", "clickData"),
)
callback!(
    JSON.json,
    app,
    Output("selected-data", "children"),
    Input("basic-interactions", "selectedData"),
)
callback!(
    JSON.json,
    app,
    Output("relayout-data", "children"),
    Input("basic-interactions", "relayoutData"),
)

run_server(app, "0.0.0.0", debug=true)
