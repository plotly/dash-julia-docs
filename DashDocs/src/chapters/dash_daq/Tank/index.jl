@doc_chapter "/dash_daq/tank" begin

@example tank_default "default.jl"
@example tank_customscales "custom_scales.jl"
@example tank_heightwidth "height_width.jl"
@example tank_label "label.jl"
@example tank_log "log.jl"
@example tank_valunits "val_units.jl"

@layout html_div() do
    

    html_h1("Tank Examples and Reference"),

    html_h3("Default Tank"),

    dcc_markdown("An example of a default tank without any extra properties."),

    source"tank_default",
    layout"tank_default",

    html_h3("Current value with units"),

    dcc_markdown("""Display the current value, along with optional units with the `units` and `showCurrentValue` properties."""),

    source"tank_valunits",
    layout"tank_valunits",

    html_h3("Height and width"),

    dcc_markdown("""
    Control the size of the tank by setting `height` and `width`..
    """),

    source"tank_heightwidth",
    layout"tank_heightwidth",

    html_h3("Label"),

    dcc_markdown("""
    Display a label alongside your tank in the specified position with `label` and `labelPosition`.
    """),

    source"tank_label",
    layout"tank_label",

    html_h3("Custom scales"),

    dcc_markdown("""
    Control the intervals at which labels are displayed, as well as the labels themselves with the `scale` property.
    """),

    source"tank_customscales",
    layout"tank_customscales",

    html_h3("Logarithmic"),

    dcc_markdown("""
    Use a logarithmic scale for the tank with the specified base by setting `logarithmic=true`.
    """),

    source"tank_log",
    layout"tank_log",

    html_h3("Tank Properties"),
    dcc_markdown("""
    Access this documentation in your Julia REPL with:
    ```julia    
    ?help daq_tank
    ```
    Our recommended IDE for writing Dash apps is Dash
      Enterprise's [Data Science Workspaces](https://plotly.com/dash/workspaces/),
       which has typeahead support for Dash Component Properties. [Find out if your company is using Dash Enterprise](https://go.plotly.com/company-lookup).
    """),
    dcc_markdown("""
    * `id` (String; optional): The ID used to identify this component in Dash callbacks.
 
    * `base` (Number; default 10): Base to be used in logarithmic scale.
    
    * `className` (String; optional): Class to apply to the root component element.
    
    * `color` (String; optional): The color of tank fill.
    
    * `height` (Number; default 192): The height of the tank in pixels.
    
    * `label` (Dict; optional): Description to be displayed alongside the control. To control styling, pass an object with label and style properties. `label` is a String | Dict with keys:
    
        * `label` (String; optional)

        * `style` (Dict; optional)
    
    * `labelPosition` (a value equal to: 'top', 'bottom'; default 'top'): Where the component label is positioned.
    
    * `logarithmic` (Bool; optional): If set to true, a logarithmic scale will be used.
    
    * `max` (Number; default 10): The maximum value of the tank. If logarithmic, represents the maximum exponent.
    
    * `min` (Number; default 0): The minimum value of the tank. If logarithmic, represents minimum exponent.
    
    * `scale` (Dict; optional): Configuration for the component scale. scale is a Dict with keys:
    
        * `custom` (Dict; optional): Custom scale marks. The key determines the position and the value determines what will show. If you want to set the style of a specific mark point, the value should be an object which contains style and label properties.`custom` is a Number Or Dict with keys:

            * `label` (String; optional)

            * `style` (String; optional)
    
        * `interval` (Number; optional): Interval by which the scale goes up. Attempts to dynamically divide min-max range by default.

        * `labelInterval` (Number; optional): Interval by which labels are added to scale marks. Defaults to 2 (every other mark has a label).

        * `start` (Number; optional): Value to start the scale from. Defaults to min.
    
    * `showCurrentValue` (Bool; optional): If true, the current value of the tank will be displayed.
    
    * `style` (Dict; optional): Style to apply to the root component element.
    
    * `units` (String; optional): Label for the current value.
    
    * `value` (Number; optional): The value of tank. If logarithmic, the displayed value will be the logarithm of the inputted value.
    
    * `width` (Number; default 112): The width of the tank in pixels.
    """)

end

end