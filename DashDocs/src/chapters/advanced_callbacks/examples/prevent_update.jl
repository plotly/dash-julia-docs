using Dash, DashHtmlComponents, DashCoreComponents

external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]

app = dash(external_stylesheets=external_stylesheets)

app.layout = html_div() do
    html_p("Enter a composite number to see its prime factors"),
    dcc_input(id="num", type="number", debounce=true, min=1, step=1),
    html_p(id="err", style=Dict(:color => "red")),
    html_p(id="out")
end

callback!(
    app,
    Output("out", "children"),
    Output("err", "children"),
    Input("num", "value")
) do num
    if isnothing(num)
        # PreventUpdate prevents ALL outputs updating
        throw(PreventUpdate())
    end

    factors = prime_factors(num)
    if length(factors) == 1
        # dash.no_update prevents any single output updating
        # (note: it"s OK to use for a single-output callback too)
        return no_update(), "$(num) is prime!"
    end

    return "$num is $(join(string.(factors), " * "))", ""
end

function prime_factors(num::Int)
    n, i, out = num, 2, Int[]
    while i * i <= n
        if n % i == 0
            n = Int(n / i)
            push!(out, i)
        else
            i = i + (i == 2 ? 1 : 2)
        end
    end
    push!(out, n)
    return out
end

run_server(app, "0.0.0.0", debug=true)
