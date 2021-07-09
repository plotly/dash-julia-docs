module chapters_dash_daq_booleanswitch

using Dash, DashHtmlComponents, DashCoreComponents

include("../../../utils.jl")

export examples

examples_path = joinpath(@__DIR__, "examples")

booleanswitch_default = LoadExampleCode(string(examples_path, "/default.jl"))

booleanswitch_color = LoadExampleCode(string(examples_path, "/color.jl"))

booleanswitch_disabled_switch = LoadExampleCode(string(examples_path, "/disabled_switch.jl"))

booleanswitch_label = LoadExampleCode(string(examples_path, "/label.jl"))

booleanswitch_vertical_switch = LoadExampleCode(string(examples_path, "/vertical_switch.jl"))

examples = [
  booleanswitch_default
]
app =  dash()

booleanswitch_default.callback!(app) 

app.layout = html_div() do

    html_h1("Boolean Switch Examples and Reference"),

    html_h3("Default Boolean Switch"),

    dcc_markdown("An example of a default boolean switch without any extra properties."),

    booleanswitch_default.source_code,
    booleanswitch_default.layout,

    html_h3("Color"),

    dcc_markdown("""Set the color of the boolean switch with `color=#<hex_value>`."""),

    booleanswitch_color.source_code,
    booleanswitch_color.layout,

    html_h3("label"),

    dcc_markdown("""
    Set the label and label position using the label
     and labelPosition properties.
    """),

    booleanswitch_label.source_code,
    booleanswitch_label.layout,

    html_h3("Vertical Switch"),
    dcc_markdown("""
    Create a vertical oriented switch by setting `vertical=True`.
    """),
    booleanswitch_vertical_switch.source_code,
    booleanswitch_vertical_switch.layout,

    html_h3("Disabled Switch"),

    dcc_markdown("""
    To disable the Boolean Switch set the property `disabled` to `true`.
    """),

    booleanswitch_disabled_switch.source_code,
    booleanswitch_disabled_switch.layout,

    html_h3("Boolean Switch Properties"),
    dcc_markdown("""
    Access this documentation in your Julia REPL with:
    ```julia    
    ?help daq_booleanswitch
    ```
    Our recommended IDE for writing Dash apps is Dash
      Enterprise's [Data Science Workspaces](https://plotly.com/dash/workspaces/),
       which has typeahead support for Dash Component Properties. [Find out if your company is using Dash Enterprise](https://go.plotly.com/company-lookup).
    """),
    dcc_markdown("""
    * `id` (String; optional): The ID used to identify this compnent in Dash callbacks.
 
    * `className` (String; optional): Class to apply to the root component element.
    
    * `color` (String; optional): Color to highlight active switch background.
    
    * `disabled` (Boolean; optional): If `true`, switch cannot be clicked.
    
    * `label` (Dict; optional): Description to be displayed alongside the control. To control styling, pass an object with label and `style` properties.
    
    * `label` is a String | Dict with keys:
    
        * `label` (String; optional)
        
        * `style` (Dict; optional)
    * 
    * `labelPosition` (a value equal to: 'top', 'bottom'; default 'top'): Where the component label is positioned.
    
    * `on` (Boolean; default false): Whether or not the switch is on.
    
    * `persisted_props` (list of a value equal to: 'on's; default `on`): Properties whose user interactions will persist after refreshing the component or the page. Since only on is allowed this prop can normally be ignored.
    
    * `persistence` (Boolean | String | Number; optional): Used to allow user interactions in this component to be persisted when the component - or the page - is refreshed. If persisted is truthy and hasn't changed from its previous value, a value that the user has changed while using the app will keep that change, as long as the new value also matches what was given originally. Used in conjunction with persistence_type.
    
    * `persistence_type` (a value equal to: 'local', 'session', 'memory'; default 'local'): Where persisted user changes will be stored: memory: only kept in memory, reset on page refresh. local: window.localStorage, data is kept after the browser quit. session: window.sessionStorage, data is cleared once the browser quit.
    
    * `style` (Dict; optional): Style to apply to the root object.
    
    * `theme` (Dict; default light): Theme configuration to be set by a ThemeProvider.
    
    * `vertical` (Boolean; default false): If `true`, switch will be vertical instead of horizontal.B
    """)

end

end