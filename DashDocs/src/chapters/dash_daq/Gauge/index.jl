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
    dcc_markdown("""
    * `id` (String; optional): The ID used to identify this compnent in Dash callbacks.
 
    * `base` (Number; default 10): Base to be used in logarithmic scale.
    
    * `className` (String; optional): Class to apply to the root component element.
    
    * `color` (Dict; optional): Color configuration for the gauge's track.
    
    * `color` is a String | Dict with keys:
    
        * `default` (String; optional): Color used for current value text and other minor accents.

        * `gradient` (Boolean; optional): Display ranges as a gradient between given colors.

        * `ranges` (Dict; optional): Define multiple color ranges on the gauge's track. The key determines the color of the range and the value is the start,end of the range itself. Ranges must be contiguous along the entirety of the gauge's range of values.

        * `ranges` is a Dict with keys:

            * `color` (list of numbers; optional)
    * `label` (Dict; optional): Description to be displayed alongside the control. To control styling, pass an object with label and style properties.
    
    * `label` is a String | Dict with keys:
    
        * `label` (String; optional)

        * `style` (Dict; optional)
    
    * `labelPosition` (a value equal to: 'top', 'bottom'; default 'top'): Where the component label is positioned.
    
    * `logarithmic` (Boolean; optional): If set to True, a logarithmic scale will be used.
    
    * `max` (Number; default 10): The maximum value of the gauge. If logarithmic, represents the maximum exponent.
    
    * `min` (Number; default 0): The minimum value of the gauge. If logarithmic, represents the minimum exponent.
    
    * `scale` (Dict; optional): Configuration for the component scale. scale is a Dict with keys:
    * `custom` (Dict; optional): Custom scale marks. The key determines the position and the value determines what will show. If you want to set the style of a specific mark point, the value should be an object which contains style and label properties.`custom` is a Number Or Dict with keys:

        * `label` (String; optional)

        * `style` (String; optional)

    * `interval` (Number; optional): Interval by which the scale goes up. Attempts to dynamically divide min-max range by default.

    * `labelInterval` (Number; optional): Interval by which labels are added to scale marks. Defaults to 2 (every other mark has a label).

    * `start` (Number; optional): Value to start the scale from. Defaults to min.
    

    * `showCurrentValue` (Boolean; optional): If True, the current value of the gauge will be displayed.
    
    * `size` (Number; optional): The size (diameter) of the gauge in pixels.
    
    * `style` (Dict; optional): Style to apply to the root component element.
    
    * `theme` (Dict; default light): Theme configuration to be set by a ThemeProvider.
    
    * `units` (String; optional): Label for the current value.
    
    * `value` (Number; optional): The value of gauge. If logarithmic, the displayed value will be the logarithm of the inputted value.
    """)

end

end