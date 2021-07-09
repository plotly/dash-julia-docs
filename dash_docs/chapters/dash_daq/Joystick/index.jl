module chapters_dash_daq_joystick

using Dash, DashHtmlComponents, DashCoreComponents

include("../../../utils.jl")

export examples

examples_path = joinpath(@__DIR__, "examples")

joystick_default = LoadExampleCode(string(examples_path, "/default.jl"))

joystick_label = LoadExampleCode(string(examples_path, "/label.jl"))

joystick_size = LoadExampleCode(string(examples_path, "/size.jl"))

examples = [
  joystick_default
]
app =  dash()

joystick_default.callback!(app) 

app.layout = html_div() do

    html_h1("Joystick Examples and Reference"),

    html_h3("Default Joystick"),

    dcc_markdown("An example of a default Joystick without any extra properties."),

    joystick_default.source_code,
    joystick_default.layout,

    html_h3("Label"),

    dcc_markdown("""
    Change the label and label orientation with `label` and `labelPosition`.
    """),

    joystick_label.source_code,
    joystick_label.layout,

    html_h3("Size"),

    dcc_markdown("""
    Change the size of the joystick with `size`.
    """),

    joystick_size.source_code,
    joystick_size.layout,

    html_h3("Joystick Properties"),
    dcc_markdown("""
    Access this documentation in your Julia REPL with:
    ```julia    
    ?help daq_joystick
    ```
    Our recommended IDE for writing Dash apps is Dash
      Enterprise's [Data Science Workspaces](https://plotly.com/dash/workspaces/),
       which has typeahead support for Dash Component Properties. [Find out if your company is using Dash Enterprise](https://go.plotly.com/company-lookup).
    """),
    dcc_markdown("""
    `id` (String; optional): The ID used to identify the color picker in Dash callbacks.

    `angle` (Number; optional): Joystick angle in degrees, 0 = right, 90 = up, 180 = left, 270 = down.

    `className` (String; optional): Class to apply to the root component element.

    `disabled` (Bool; optional): If True, color cannot be picked.

    `force` (Number; optional): Joystick force: distance between cursor and center in big-circle radii.

    `label` (Dict; optional): Description to be displayed alongside the control. To control styling, pass an object with label and style properties.

    `label` is a String | Dict with keys:

        * `label` (String; optional)

        * `style` (Dict; optional)

    `labelPosition` (a value equal to: 'top', 'bottom'; default 'top'): Where the indicator label is positioned.

    `size` (Number; default 100): Size (width) of the component in pixels.

    `style` (Dict; optional): Style to apply to the root component element.

    `theme` (Dict; default light): Theme configuration to be set by a ThemeProvider.
    """)

end

end