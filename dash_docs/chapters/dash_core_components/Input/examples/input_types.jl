using Dash
using DashCoreComponents
using DashHtmlComponents

app = dash()

const ALLOWED_TYPES = [
    "text", "number", "password", "email", "search",
    "tel", "url", "range", "hidden",
]

app.layout = html_div(
    vcat(
        [
            dcc_input(
                id="input_$i",
                type=i,
                placeholder="input type $i",
            )
            for i in ALLOWED_TYPES
        ],
        [html_div(id="out-all-types")]
    )
)

callback!(app,
    Output("out-all-types", "children"),
    [Input("input_$i", "value") for i in ALLOWED_TYPES],
) do vals...
    return join(
        string.(Iterators.filter(v->!isnothing(v), vals)),
        " | "
        )
end

run_server(app, debug = true)
