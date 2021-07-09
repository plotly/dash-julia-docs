module chapters_dash_daq_tank

using Dash, DashHtmlComponents, DashCoreComponents

include("../../../utils.jl")

export examples

examples_path = joinpath(@__DIR__, "examples")

tank_default = LoadExampleCode(string(examples_path, "/default.jl"))

tank_customscales = LoadExampleCode(string(examples_path, "/custom_scales.jl"))

tank_heightwidth = LoadExampleCode(string(examples_path, "/height_width.jl"))

tank_label = LoadExampleCode(string(examples_path, "/label.jl"))

tank_log = LoadExampleCode(string(examples_path, "/log.jl"))

tank_valunits = LoadExampleCode(string(examples_path, "/val_units.jl"))

examples = [
  tank_default
]
app =  dash()

tank_default.callback!(app) 

app.layout = html_div() do

    html_h1("Tank Examples and Reference"),

    html_h3("Default Tank"),

    dcc_markdown("An example of a default tank without any extra properties."),

    tank_default.source_code,
    tank_default.layout,

    html_h3("Current value with units"),

    dcc_markdown("""Display the current value, along with optional units with the `units` and `showCurrentValue` properties."""),

    tank_valunits.source_code,
    tank_valunits.layout,

    html_h3("Height and width"),

    dcc_markdown("""
    Control the size of the tank by setting `height` and `width`..
    """),

    tank_heightwidth.source_code,
    tank_heightwidth.layout,

    html_h3("Label"),

    dcc_markdown("""
    Display a label alongside your tank in the specified position with `label` and `labelPosition`.
    """),

    tank_label.source_code,
    tank_label.layout,

    html_h3("Custom scales"),

    dcc_markdown("""
    Control the intervals at which labels are displayed, as well as the labels themselves with the `scale` property.
    """),

    tank_customscales.source_code,
    tank_customscales.layout,

    html_h3("Logarithmic"),

    dcc_markdown("""
    Use a logarithmic scale for the tank with the specified base by setting `logarithmic=true`.
    """),

    tank_log.source_code,
    tank_log.layout,

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