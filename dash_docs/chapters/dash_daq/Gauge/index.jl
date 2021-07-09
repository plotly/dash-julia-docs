module chapters_dash_daq_gauge

using Dash, DashHtmlComponents, DashCoreComponents

include("../../../utils.jl")

export examples

examples_path = joinpath(@__DIR__, "examples")

gauge_default = LoadExampleCode(string(examples_path, "/default.jl"))

gauge_colorgrad = LoadExampleCode(string(examples_path, "/color_grad.jl"))

gauge_color = LoadExampleCode(string(examples_path, "/color.jl"))

gauge_loggauge = LoadExampleCode(string(examples_path, "/log_gauge.jl"))

gauge_minmax = LoadExampleCode(string(examples_path, "/min_max.jl"))

gauge_scale = LoadExampleCode(string(examples_path, "/scale.jl"))

gauge_size = LoadExampleCode(string(examples_path, "/size.jl"))

gauge_valunits = LoadExampleCode(string(examples_path, "/val_units.jl"))

examples = [
  gauge_default
]
app =  dash()

gauge_default.callback!(app) 

app.layout = html_div() do

    html_h1("Gauge Examples and Reference"),

    html_h3("Default Gauge"),

    dcc_markdown("An example of a default Gauge without any extra properties."),

    gauge_default.source_code,
    gauge_default.layout,

    html_h3("Minimum and Maximum"),

    dcc_markdown("""
    Specify the minimum and maximum values of the gauge,
     using the `min` and `max` properties. If the scale is
      logarithmic the minimum and maximum will represent
       an exponent.
    """),

    gauge_minmax.source_code,
    gauge_minmax.layout,

    html_h3("Current Value and Units"),

    dcc_markdown("""
    Show the current value of the gauge and the
    units with `showCurrentValue=true` and `units=<units>`.
    """),

    gauge_valunits.source_code,
    gauge_valunits.layout,

    html_h3("Logarithmic Gauge"),

    dcc_markdown("""
    To set the scale of the gauge to
     logarithmic use the property `logarithmic=true`.
    """),

    gauge_loggauge.source_code,
    gauge_loggauge.layout,

    html_h3("Color"),

    dcc_markdown("""
    Set the color of the gauge by using the property
     `color=<hex_color>`.
    """),

    gauge_color.source_code,
    gauge_color.layout,

    html_h3("Color Gradient"),

    dcc_markdown("""
    Apply a color gradient to the gauge with the `property=>
    color=Dict('gradient'=>True,'ranges'=>Dict('<color>'=>[<value>,
    <value>],'<color>'=>[<value>, <value>],'<color>'=>[<value>, <value>]))`
    """),

    gauge_colorgrad.source_code,
    gauge_colorgrad.layout,

    html_h3("Size"),

    dcc_markdown("""
    Adjust the size of the gauge in pixels `size=200`.
    """),

    gauge_size.source_code,
    gauge_size.layout,

    html_h3("Scale"),

    dcc_markdown("""
    Modify where the scale starts, the label interval, and
     actual interval with the `scale` property.
    """),

    gauge_scale.source_code,
    gauge_scale.layout,

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