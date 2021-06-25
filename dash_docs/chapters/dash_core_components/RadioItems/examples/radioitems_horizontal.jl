using Dash, DashHtmlComponents, DashCoreComponents

app = dash()

app.layout = html_div() do
    dcc_radioitems(
        options = [
            (label = "New York City", value = "NYC"),
            (label = "Montreal", value = "MTL"),
            (label = "San Francisco", value = "SF")
        ],
        value = "MTL",
        labelStyle = Dict("display" => "inline-block")
    )
end

run_server(app, "0.0.0.0", debug=true)
