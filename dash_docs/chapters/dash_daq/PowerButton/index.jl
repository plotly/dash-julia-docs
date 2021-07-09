module chapters_dash_daq_powerbutton

using Dash, DashHtmlComponents, DashCoreComponents

include("../../../utils.jl")

export examples

examples_path = joinpath(@__DIR__, "examples")

powerbutton_default = LoadExampleCode(string(examples_path, "/default.jl"))

powerbutton_color = LoadExampleCode(string(examples_path, "/color.jl"))

powerbutton_label = LoadExampleCode(string(examples_path, "/label.jl"))

powerbutton_size = LoadExampleCode(string(examples_path, "/size.jl"))


examples = [
  powerbutton_default
]
app =  dash()

powerbutton_default.callback!(app) 

app.layout = html_div() do

    html_h1("Power Button Examples and Reference"),

    html_h3("Default Power Button"),

    dcc_markdown("An example of a default power button without any extra properties."),

    powerbutton_default.source_code,
    powerbutton_default.layout,

    html_h3("Label"),

    dcc_markdown("""Set the label and label position with `label` and `labelPosition`."""),

    powerbutton_label.source_code,
    powerbutton_label.layout,

    html_h3("Size"),

    dcc_markdown("""
    Adjust the size (diameter in pixels) of the power button with `size`..
    """),

    powerbutton_size.source_code,
    powerbutton_size.layout,

    html_h3("Color"),

    dcc_markdown("""
    Set the color of the power button with `color`.
    """),

    powerbutton_color.source_code,
    powerbutton_color.layout,

    html_h3("Power Button Properties"),
    dcc_markdown("""
    Access this documentation in your Julia REPL with:
    ```julia    
    ?help daq_powerbutton
    ```
    Our recommended IDE for writing Dash apps is Dash
      Enterprise's [Data Science Workspaces](https://plotly.com/dash/workspaces/),
       which has typeahead support for Dash Component Properties. [Find out if your company is using Dash Enterprise](https://go.plotly.com/company-lookup).
    """),
    dcc_markdown("""
    * `id` (String; optional): The ID used to identify this compnent in Dash callbacks.
 
    * `className` (String; optional): Class to apply to the root component element.
    
    * `color` (String; optional): The indicator color to display when power button is on.
    
    * `disabled` (Bool; optional): If true, power button cannot be clicked.
    
    * `label` (Dict; optional): Description to be displayed alongside the button. To control styling, pass an object with label and style properties.label is a String | Dict with keys:
    
        * `label` (String; optional)

        * `style` (Dict; optional)
    
    * `labelPosition` (a value equal to: 'top', 'bottom'; default 'top'): Where the button label is positioned.
    
    * `on` (Bool; default false): Whether or not the power button is on.
    
    * `persisted_props` (list of a value equal to: 'on's; default ['on']): Properties whose user interactions will persist after refreshing the component or the page. Since only on is allowed this prop can normally be ignored.
    
    * `persistence` (Bool | String | Number; optional): Used to allow user interactions in this component to be persisted when the component - or the page - is refreshed. If persisted is truthy and hasn't changed from its previous value, a value that the user has changed while using the app will keep that change, as long as the new value also matches what was given originally. Used in conjunction with persistence_type.
    
    * `persistence_type` (a value equal to: 'local', 'session', 'memory'; default 'local'): Where persisted user changes will be stored: memory: only kept in memory, reset on page refresh. local: window.localStorage, data is kept after the browser quit. session: window.sessionStorage, data is cleared once the browser quit.
    
    * `size` (Number; default 48): The size (diameter) of the power button in pixels.
    
    * `style` (Dict; optional): Style to apply to the root component element.
    
    * `theme` (Dict; default light): Theme configuration to be set by a ThemeProvider.
    """)

end

end