module chapters_dash_daq_indicator

using Dash, DashHtmlComponents, DashCoreComponents

include("../../../utils.jl")

export examples

examples_path = joinpath(@__DIR__, "examples")

indicator_default = LoadExampleCode(string(examples_path, "/default.jl"))

indicator_boolindicatoroff = LoadExampleCode(string(examples_path, "/bool_indicator_off.jl"))

indicator_color = LoadExampleCode(string(examples_path, "/color.jl"))

indicator_label = LoadExampleCode(string(examples_path, "/label.jl"))

indicator_square = LoadExampleCode(string(examples_path, "/square.jl"))

examples = [
  indicator_default
]
app =  dash()

indicator_default.callback!(app) 

app.layout = html_div() do

    html_h1("Indicator Examples and Reference"),

    html_h3("Default Indicator"),

    dcc_markdown("An example of a default Indicator without any extra properties."),

    indicator_default.source_code,
    indicator_default.layout,

    html_h3("Label"),

    dcc_markdown("""
    Define the label and label orientation with `label` and `labelPosition`.
    """),

    indicator_label.source_code,
    indicator_label.layout,

    html_h3("Boolean Indicator Off"),

    dcc_markdown("""
    A boolean indicator set to off `value=false`.
    """),

    indicator_boolindicatoroff.source_code,
    indicator_boolindicatoroff.layout,

    html_h3("Square"),
    dcc_markdown("""
    Create a square boolean indicator by setting the `width` and `height` to the same value.
    """),
    indicator_square.source_code,
    indicator_square.layout,

    html_h3("Color"),

    dcc_markdown("""
    Define the color of the boolean indicator with `color='#<color>'`.
    """),

    indicator_color.source_code,
    indicator_color.layout,

    html_h3("Indicator Properties"),
    dcc_markdown("""
    Access this documentation in your Julia REPL with:
    ```julia    
    ?help daq_indicator
    ```
    Our recommended IDE for writing Dash apps is Dash
      Enterprise's [Data Science Workspaces](https://plotly.com/dash/workspaces/),
       which has typeahead support for Dash Component Properties. [Find out if your company is using Dash Enterprise](https://go.plotly.com/company-lookup).
    """),
    dcc_markdown("""
    `id` (String; optional): The ID used to identify the indicator in Dash callbacks.

    `className` (String; optional): Class to apply to the root component element.

    `color` (String; default colors.DARKER_PRIMARY): Color of the indicator.

    `height` (Number; optional): Height of the component. Set both width and height for a rectangular indicator.

    `label` (Dict; optional): Description to be displayed alongside the control. To control styling, pass an object with label and style properties.

    `label` is a String | Dict with keys:

      * `label` (String; optional)

      * `style` (Dict; optional)

    `labelPosition` (a value equal to: 'top', 'bottom', 'right', 'left'; default 'top'): Where the indicator label is positioned.

    `size` (Number; default 15): Size of the component. Either use this or width and height.

    `style` (Dict; optional): Style to apply to the root component element.

    `theme` (Dict; default light): Theme configuration to be set by a ThemeProvider.

    `value` (Bool; optional): If true, indicator is illuminated.

    `width` (Number; optional): Width of the component. Set both width and height for a rectangular indicator.
    """)

end

end