@doc_chapter "/dash_daq/gauge" begin

@example gauge_default "default.jl"
@example gauge_colorgrad "color_grad.jl"
@example gauge_color "color.jl"
@example gauge_loggauge "log_gauge.jl"
@example gauge_minmax "min_max.jl"
@example gauge_scale "scale.jl"
@example gauge_size "size.jl"
@example gauge_valunits "val_units.jl"

@layout html_div() do

    html_h1("Gauge Examples and Reference"),

    html_h3("Default Gauge"),

    dcc_markdown("An example of a default Gauge without any extra properties."),

    source"gauge_default",
    layout"gauge_default",

    html_h3("Minimum and Maximum"),

    dcc_markdown("""
    Specify the minimum and maximum values of the gauge,
     using the `min` and `max` properties. If the scale is
      logarithmic the minimum and maximum will represent
       an exponent.
    """),

    source"gauge_minmax",
    layout"gauge_minmax",

    html_h3("Current Value and Units"),

    dcc_markdown("""
    Show the current value of the gauge and the
    units with `showCurrentValue=true` and `units=<units>`.
    """),

    source"gauge_valunits",
    layout"gauge_valunits",

    html_h3("Logarithmic Gauge"),

    dcc_markdown("""
    To set the scale of the gauge to
     logarithmic use the property `logarithmic=true`.
    """),

    source"gauge_loggauge",
    layout"gauge_loggauge",

    html_h3("Color"),

    dcc_markdown("""
    Set the color of the gauge by using the property
     `color=<hex_color>`.
    """),

    source"gauge_color",
    layout"gauge_color",

    html_h3("Color Gradient"),

    dcc_markdown("""
    Apply a color gradient to the gauge with the `property=>
    color=Dict('gradient'=>True,'ranges'=>Dict('<color>'=>[<value>,
    <value>],'<color>'=>[<value>, <value>],'<color>'=>[<value>, <value>]))`
    """),

    source"gauge_colorgrad",
    layout"gauge_colorgrad",

    html_h3("Size"),

    dcc_markdown("""
    Adjust the size of the gauge in pixels `size=200`.
    """),

    source"gauge_size",
    layout"gauge_size",

    html_h3("Scale"),

    dcc_markdown("""
    Modify where the scale starts, the label interval, and
     actual interval with the `scale` property.
    """),

    source"gauge_scale",
    layout"gauge_scale",

    html_h3("Color Picker Properties"),
    dcc_markdown("""
    Access this documentation in your Julia REPL with:
    ```julia    
    ?help daq_gauge
    ```
    Our recommended IDE for writing Dash apps is Dash
      Enterprise's [Data Science Workspaces](https://plotly.com/dash/workspaces/),
       which has typeahead support for Dash Component Properties. [Find out if your company is using Dash Enterprise](https://go.plotly.com/company-lookup).
    """),
    dcc_markdown(string(@doc daq_gauge))

end

end