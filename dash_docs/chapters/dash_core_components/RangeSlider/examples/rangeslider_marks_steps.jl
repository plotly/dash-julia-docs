using Dash, DashHtmlComponents, DashCoreComponents

app = dash()

app.layout = html_div() do
    dcc_rangeslider(
        id="my-range-slider-1",
        step=nothing,
        min=0,
        max=10,
        value=[3, 7.65],
        marks=Dict(
            0 => Dict("label"=> "0 °F"),
            3 => Dict("label"=> "3°C"),
            5 => Dict("label"=> "5 °C"),
            7.65 => Dict("label"=> "7.65 °C"),
            10 => Dict("label"=> "10 °C"),
        )
    )
end


run_server(app, "0.0.0.0", debug=true)
