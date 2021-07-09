module chapters_dash_daq_leddisplay

using Dash, DashHtmlComponents, DashCoreComponents

include("../../../utils.jl")

export examples

examples_path = joinpath(@__DIR__, "examples")

leddisplay_default = LoadExampleCode(string(examples_path, "/default.jl"))

leddisplay_backgroundcolor = LoadExampleCode(string(examples_path, "/background_color.jl"))

leddisplay_color = LoadExampleCode(string(examples_path, "/color.jl"))

leddisplay_label = LoadExampleCode(string(examples_path, "/label.jl"))

leddisplay_size = LoadExampleCode(string(examples_path, "/size.jl"))

examples = [
  leddisplay_default
]
app =  dash()

leddisplay_default.callback!(app) 

app.layout = html_div() do

    html_h1("LED display Examples and Reference"),

    html_h3("Default LED display"),

    dcc_markdown("An example of a default LED display without any extra properties."),

    leddisplay_default.source_code,
    leddisplay_default.layout,

    html_h3("Label"),

    dcc_markdown("""Set the label and label position with `label` and `labelPosition`."""),

    leddisplay_label.source_code,
    leddisplay_label.layout,

    html_h3("Size"),

    dcc_markdown("""
    Adjust the size of the LED display with `size`.
    """),

    leddisplay_size.source_code,
    leddisplay_size.layout,

    html_h3("Color"),

    dcc_markdown("""
    Adjust the color of the LED display with `color=#<hex_color>`
    """),

    leddisplay_color.source_code,
    leddisplay_color.layout,

    html_h3("Background Color"),

    dcc_markdown("""
    Adjust the background color of the LED display using: `backgroundColor=#<hex_color>`
    """),

    leddisplay_backgroundcolor.source_code,
    leddisplay_backgroundcolor.layout,

    html_h3("LED Display Properties"),
    dcc_markdown("""
    Access this documentation in your Julia REPL with:
    ```julia    
    ?help daq_leddisplay
    ```
    Our recommended IDE for writing Dash apps is Dash
      Enterprise's [Data Science Workspaces](https://plotly.com/dash/workspaces/),
       which has typeahead support for Dash Component Properties. [Find out if your company is using Dash Enterprise](https://go.plotly.com/company-lookup).
    """),
    dcc_markdown("""
    * `id` (String; optional): The ID used to identify the display in Dash callbacks.
 
    * `backgroundColor` (String; default '#fff'): Color of the display's background.
    
    * `className` (String; optional): Class to apply to the root component element.
    
    * `color` (String; default colors.PRIMARY): Color of the display.
    
    * `label` (Dict; optional): Description to be displayed alongside the control. To control styling, pass an object with label and style properties. `label` is a String | Dict with keys:
    
        * `label` (String; optional)

        * `style` (Dict; optional)
    
    * `labelPosition` (a value equal to: 'top', 'bottom'; default 'top'): Where the display label is positioned.
    
    * `size` (Number; default 42): Size of the display.
    
    * `style` (Dict; optional): Style to apply to the root component element.
    
    * `theme` (Dict; default light): Theme configuration to be set by a ThemeProvider.
    
    * `value` (Number | String; optional): Value to be displayed. A Number or a String containing only digits (0-9), periods, and colons, and possibly starting with a minus sign.
    """)

end

end