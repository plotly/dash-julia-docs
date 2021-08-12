using Dash, DashHtmlComponents, DashCoreComponents
using HTTP, CSV, DataFrames

external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]

app = dash(external_stylesheets=external_stylesheets, suppress_callback_exceptions=true)

read_remote_csv(url) = DataFrame(CSV.File(HTTP.get(url).body))
df = read_remote_csv("https://raw.githubusercontent.com/plotly/datasets/master/gapminderDataFiveYear.csv")

available_countries = unique(df.country)

app.layout = html_div() do
    html_div("Dash To-Do list"),
    dcc_input(id="new-item"),
    html_button("Add", id="add"),
    html_button("Clear Done", id="clear-done"),
    html_div(id="list-container"),
    html_div(id="totals")
end

style_todo = (display = "inline", margin = "10px")
style_done = (style_todo..., textDecoration = "line-through", color = "#888")

isdone(x) = false
isdone(x::Bool) = x
isdone(x::String) = x === "done"
isdone(x::Vector) = length(x) == 0 ? false : isdone(x[1])

function edit_list(add, add2, clear, new_item, items, items_done)
    ctx = callback_context()
    triggered = [t.prop_id for t in ctx.triggered]

    is_adding = any(in.(triggered, Ref(["add.n_clicks", "new-item.n_submit"])))
    is_clearing = any(isequal("clear-done.n_clicks"), triggered)
    new_spec = Any[
        (text, done) for (text, done) in zip(items, items_done) if !(is_clearing && isdone(done))
    ]

    if is_adding
        push!(new_spec, (new_item, []))
    end

    new_list = [
        html_div([
            dcc_checklist(
                id=(index = i, type = "done"),
                options=[(label = "", value = "done")],
                value=done,
                style=(display = "inline",),
                labelStyle=(display = "inline",),
            ),
            html_div(text, id=(index = i,), style=isdone(done) ? style_done : style_todo)
        ], style=(clear = "both",))
        for (i, (text, done)) in enumerate(new_spec)
    ]

    return [new_list, is_adding ? "" : new_item]
end


callback!(
    edit_list,
    app,
    [Output("list-container", "children"), Output("new-item", "value")],
    [
        Input("add", "n_clicks"),
        Input("new-item", "n_submit"),
        Input("clear-done", "n_clicks"),
    ],
    [
        State("new-item", "value"),
        State((index = ALL,), "children"),
        State((index = ALL, type = "done"), "value"),
    ],
)

callback!(
    done -> isdone(done) ? style_done : style_todo,
    app,
    Output((index = MATCH,), "style"),
    Input((index = MATCH, type = "done"), "value"),
)

callback!(
    app,
    Output("totals", "children"),
    Input((index = ALL, type = "done"), "value"),
) do done
    count_all = length(done)
    count_done = count_all == 0 ? 0 : sum(isdone.(done))
    result = "$(count_done) of $count_all items completed"

    if count_all > 0
        result *= " - $(round(Int, 100 * count_done / count_all))%"
    end
    return result
end



run_server(app, "0.0.0.0", debug=true)
