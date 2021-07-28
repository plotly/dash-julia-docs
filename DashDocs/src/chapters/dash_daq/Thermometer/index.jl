@doc_chapter "/dash_daq/thermometer" begin

@example thermometer_default "default.jl"
@example thermometer_customscales "custom_scales.jl"
@example thermometer_heightwidth "height_width.jl"
@example thermometer_label "label.jl"
@example thermometer_valunits "val_units.jl"

@layout html_div() do
    

    html_h1("Thermometer Examples and Reference"),

    html_h3("Default Thermometer"),

    dcc_markdown("An example of a default Thermometer without any extra properties."),

    source"thermometer_default",
    layout"thermometer_default",

    html_h3("Current value with units"),

    dcc_markdown("""Display the current value, along with optional units with the `units` and `showCurrentValue` properties."""),

    source"thermometer_valunits",
    layout"thermometer_valunits",

    html_h3("Height and width"),

    dcc_markdown("""
    Control the size of the thermometer  by setting `height` and `width`..
    """),

    source"thermometer_heightwidth",
    layout"thermometer_heightwidth",

    html_h3("Label"),

    dcc_markdown("""
    Display a label alongside your tank in the specified position with `label` and `labelPosition`.
    """),

    source"thermometer_label",
    layout"thermometer_label",

    html_h3("Custom scales"),

    dcc_markdown("""
    Control the intervals at which labels are displayed, as well as the labels themselves with the `scale` property.
    """),

    source"thermometer_customscales",
    layout"thermometer_customscales",

    html_h3("Thermometer Properties"),
    dcc_markdown("""
    Access this documentation in your Julia REPL with:
    ```julia    
    ?help daq_thermometer
    ```
    Our recommended IDE for writing Dash apps is Dash
      Enterprise's [Data Science Workspaces](https://plotly.com/dash/workspaces/),
       which has typeahead support for Dash Component Properties. [Find out if your company is using Dash Enterprise](https://go.plotly.com/company-lookup).
    """),
    dcc_markdown("""
    * `id` (string; optional): The ID used to identify this compnent in Dash callbacks.
 
    * `base` (number; default 10): Base to be used in logarithmic scale.
    
    * `className` (string; optional): Class to apply to the root component element.
    
    * `color` (string; optional): The color of the thermometer fill/current value text.
    
    * `height` (number; default 192): The height of the thermometer in pixels.
    
    * `label` (dict; optional): Description to be displayed alongside the control. To control styling, pass an object with label and style properties. `label` is a string | dict with keys:
    
        * `label` (string; optional)

        * `style` (dict; optional)
    
    * `labelPosition` (a value equal to: 'top', 'bottom'; default 'top'): Where the component label is positioned.
    
    * `logarithmic` (boolean; optional): If set to True, a logarithmic scale will be used.
    
    * `max` (number; default 10): The maximum value of the thermometer. If logarithmic, represents the maximum exponent.
    
    * `min` (number; default 0): The minimum value of the thermometer. If logarithmic, represents the minimum exponent.
    
    * `scale` (dict; optional): Configuration for the component scale. scale is a dict with keys:
    
        * `custom` (dict; optional): Custom scale marks. The key determines the position and the value determines what will show. If you want to set the style of a specific mark point, the value should be an object which contains style and label properties. `custom` is a number Or dict with keys:

            * `label` (string; optional)

            * `style` (string; optional)

        * `interval` (number; optional): Interval by which the scale goes up. Attempts to dynamically divide min-max range by default.

        * `labelInterval` (number; optional): Interval by which labels are added to scale marks. Defaults to 2 (every other mark has a label).

        * `start` (number; optional): Value to start the scale from. Defaults to min.
    
    * `showCurrentValue` (boolean; optional): If True, the current value of the thermometer will be displayed.
    
    * `style` (dict; optional): Style to apply to the root component element.
    
    * `theme` (dict; default light): Theme configuration to be set by a ThemeProvider.
    
    * `units` (string; optional): Label for the current value.
    
    * `value` (number; optional): The value of thermometer. If logarthmic, the value displayed will be the logarithm of the inputted value.
    
    * `width` (number; default 20): The width of the thermometer in pixels.
    """)

end

end