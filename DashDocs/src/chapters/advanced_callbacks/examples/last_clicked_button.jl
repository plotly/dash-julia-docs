using Dash, DashHtmlComponents, DashCoreComponents, JSON

external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]

app = dash(external_stylesheets=external_stylesheets)

app.layout = html_div() do
    html_button("Button 1", id="btn-1"),
    html_button("Button 2", id="btn-2"),
    html_button("Button 3", id="btn-3"),
    html_div(id="container")
end

callback!(
    app,
    Output("container", "children"),
    Input("btn-1", "n_clicks"),
    Input("btn-2", "n_clicks"),
    Input("btn-3", "n_clicks"),
) do btn1, btn2, btn3
    ctx = callback_context()

    if length(ctx.triggered) == 0
        button_id = "No clicks yet"
    else
        button_id = split(ctx.triggered[1].prop_id, ".")[1]
    end

    ctx_msg = Dict(
        :states => ctx.states,
        :triggered => ctx.triggered,
        :inputs => ctx.inputs,
    )
    io = IOBuffer()
    JSON.print(io, ctx_msg, 2)
    ctx_msg_string = String(take!(io))

    html_div() do
        html_table() do
            html_tr() do
                html_th("Button 1"),
                html_th("Button 2"),
                html_th("Button 3"),
                html_th("Most Recent Click")
            end,
            html_tr() do
                html_td(isnothing(btn1) ? 0 : btn1),
                html_td(isnothing(btn2) ? 0 : btn2),
                html_td(isnothing(btn3) ? 0 : btn3),
                html_td(button_id)
            end
        end,
        html_pre(ctx_msg_string)
    end
end

run_server(app, "0.0.0.0", debug=true)
