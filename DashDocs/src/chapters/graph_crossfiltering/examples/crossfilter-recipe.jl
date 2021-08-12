using DataFrames, Dash, DashHtmlComponents, DashCoreComponents, PlotlyJS

df4 = DataFrame(rand(30, 6), :auto)

function create_figure(df4, x_col, y_col, selectedpoints, selectedpoints_local)
    return plot(
        df4, x=x_col, y=y_col,
        mode="markers+text",
        marker_size=20,
        text=1:size(df4)[1],
        customdata=1:size(df4)[1],
        selectedpoints=selectedpoints,
        unselected=(
            marker=(opacity=0.3, textfont_color = "rgba(0,0,0,0)")
        )
    )
end

app = dash()

app.layout = html_div() do
    html_div(
        dcc_graph(id = "graph1"),
        style = (width = "32%", display = "inline-block"),
    ),
    html_div(
        dcc_graph(id = "graph2"),
        style = (width = "32%", display = "inline-block"),
    ),
    html_div(
        dcc_graph(id = "graph3"),
        style = (width = "32%", display = "inline-block"),
    )
end

callback!(
    app,
    Output("graph1", "figure"),
    Output("graph2", "figure"),
    Output("graph3", "figure"),
    Input("graph1", "selectedData"),
    Input("graph2", "selectedData"),
    Input("graph3", "selectedData"),
) do selection1, selection2, selection3
    selectedpoints = 1:size(df4)[1]

    for selected_data in [selection1, selection2, selection3]
        if selected_data != nothing
            selectedpoints = [p[:customdata] - 1 for p in selected_data.points]
        end
    end

    return create_figure(df4, :x1, :x2, selectedpoints, selection1),
           create_figure(df4, :x3, :x4, selectedpoints, selection2),
           create_figure(df4, :x5, :x6, selectedpoints, selection3)
end

run_server(app, "0.0.0.0", debug=true)
