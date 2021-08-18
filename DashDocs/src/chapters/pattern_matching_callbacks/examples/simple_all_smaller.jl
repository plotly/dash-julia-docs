using Dash, DashHtmlComponents, DashCoreComponents
using HTTP, CSV, DataFrames

external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]

app = dash(external_stylesheets=external_stylesheets, suppress_callback_exceptions=true)

read_remote_csv(url) = DataFrame(CSV.File(HTTP.get(url).body))
df = read_remote_csv("https://raw.githubusercontent.com/plotly/datasets/master/gapminderDataFiveYear.csv")

available_countries = unique(df.country)

app.layout = html_div() do
    html_button("Add Filter", id="add-filter-ex3", n_clicks=0),
    html_div(id="container-ex3", children=[])
end

callback!(
    app,
    Output("container-ex3", "children"),
    Input("add-filter-ex3", "n_clicks"),
    State("container-ex3", "children"),
) do n_clicks, children
    i = n_clicks + 1
    new_dropdown = dcc_dropdown(
        id=(type = "filter-dropdown-ex3", index = i),
        options=[(label = i, value = i) for i in available_countries],
        value=available_countries[i]
    )
    new_div = html_div([
        new_dropdown,
        html_div(id=(type = "output-ex3", index = i))
    ])
    push!(children, new_div)
    children
end

callback!(
    app,
    Output((type = "output-ex3", index = MATCH), "children"),
    Input((type = "filter-dropdown-ex3", index = MATCH), "value"),
    Input((type = "filter-dropdown-ex3", index = ALLSMALLER), "value"),
) do matching_value, previous_values
    previous_values_reversed = reverse(collect(previous_values))
    all_values = vcat(matching_value, previous_values_reversed)
    dff = df[in.(df.country, Ref(all_values)), :]
    avg = sum(dff.lifeExp) / size(dff, 1)

    if length(all_values) == 1
        return html_div("$(round(avg, digits=2)) is the life expectancy of $(matching_value)")
    elseif length(all_values) == 2
        return html_div(
            "$(round(avg, digits=2)) is the average life expectancy of $(all_values[1]) and $(all_values[2])"
        )
    else
        return html_div(
            "$(round(avg, digits=2)) is the average life expectancy of $(join(all_values, ", ", ", and "))"
        )
    end
end

run_server(app, "0.0.0.0", debug=true)
