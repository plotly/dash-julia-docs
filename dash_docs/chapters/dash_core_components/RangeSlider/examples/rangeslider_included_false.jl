using Dash, DashHtmlComponents, DashCoreComponents


app = dash()

# RangeSlider has included=True by default
app.layout = html_div() do
    dcc_rangeslider(
        min=0,
        max=100,
        value=[10, 65],
        marks=Dict(
            0 => Dict("label" => "0 °C", "style" => Dict("color" => "#77b0b1")),
            26 => Dict("label" => "26 °C"),
            37 => Dict("label" => "37 °C"),
            100 => Dict("label" => "100 °C", "style" => Dict("color" => "#f50")),
        ),
        included=false,
    )
end


run_server(app, "0.0.0.0", debug=true)
