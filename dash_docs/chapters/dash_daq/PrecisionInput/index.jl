module chapters_dash_daq_precisioninput

using Dash, DashHtmlComponents, DashCoreComponents

include("../../../utils.jl")

export examples

examples_path = joinpath(@__DIR__, "examples")

precisioninput_default = LoadExampleCode(string(examples_path, "/default.jl"))

precisioninput_disabled = LoadExampleCode(string(examples_path, "/disabled.jl"))

precisioninput_label = LoadExampleCode(string(examples_path, "/label.jl"))

precisioninput_maxmin = LoadExampleCode(string(examples_path, "/max_min.jl"))

precisioninput_precision = LoadExampleCode(string(examples_path, "/precision.jl"))

precisioninput_size = LoadExampleCode(string(examples_path, "/size.jl"))

examples = [
  precisioninput_default
]
app =  dash()

precisioninput_default.callback!(app) 

app.layout = html_div() do

    html_h1("Precision Input Examples and Reference"),

    html_h3("Default Precision Input"),

    dcc_markdown("An example of a default precision input without any extra properties."),

    precisioninput_default.source_code,
    precisioninput_default.layout,

    html_h3("Label"),

    dcc_markdown("""Set the label and label position with `label` and `labelPosition`."""),

    precisioninput_label.source_code,
    precisioninput_label.layout,

    html_h3("Precision"),

    dcc_markdown("""
    The `precision` property is mandatory for this component. The `precision` property indicates the accuracy of the specified number.
    """),

    precisioninput_precision.source_code,
    precisioninput_precision.layout,

    html_h3("Max and Min"),

    dcc_markdown("""
    Set the maximum and minimum value of the numeric input with `max` and `min`.
    """),

    precisioninput_maxmin.source_code,
    precisioninput_maxmin.layout,

    html_h3("Size"),

    dcc_markdown("""
    Set the length (in pixels) of the numeric input `size`.
    """),

    precisioninput_size.source_code,
    precisioninput_size.layout,

    html_h3("Disabled"),

    dcc_markdown("""
    Disable the precision input by setting `disabled=true`.
    """),

    precisioninput_disabled.source_code,
    precisioninput_disabled.layout,

    html_h3("Precision Input Properties"),
    dcc_markdown("""
    Access this documentation in your Julia REPL with:
    ```julia    
    ?help daq_precisioninput
    ```
    Our recommended IDE for writing Dash apps is Dash
      Enterprise's [Data Science Workspaces](https://plotly.com/dash/workspaces/),
       which has typeahead support for Dash Component Properties. [Find out if your company is using Dash Enterprise](https://go.plotly.com/company-lookup).
    """),
    dcc_markdown("""
    * `id` (String; optional): The ID used to identify this compnent in Dash callbacks.
 
    * `className` (String; optional): Class to apply to the root component element.
    
    * `disabled` (Bool; optional): If true, numeric input cannot be changed.
    
    * `label` (Dict; optional): Description to be displayed alongside the scientific notation. To control styling, pass an object with label and style properties.label is a String | Dict with keys:
    
        * `label` (String; optional)

        * `style` (Dict; optional)
    
    * `labelPosition` (a value equal to: 'top', 'bottom'; default 'top'): Where the numeric input label is positioned.
    
    * `max` (Number; default Number.MAX_SAFE_INTEGER): The maximum value of the numeric input.
    
    * `min` (Number; default 0): The minimum value of the numeric input.
    
    * `persisted_props` (list of a value equal to: 'value's; default 'value'): Properties whose user interactions will persist after refreshing the component or the page. Since only value is allowed this prop can normally be ignored.
    
    * `persistence` (Bool | String | Number; optional): Used to allow user interactions in this component to be persisted when the component - or the page - is refreshed. If persisted is truthy and hasn't changed from its previous value, a value that the user has changed while using the app will keep that change, as long as the new value also matches what was given originally. Used in conjunction with persistence_type.
    
    * `persistence_type` (a value equal to: 'local', 'session', 'memory'; default 'local'): Where persisted user changes will be stored: memory: only kept in memory, reset on page refresh. local: window.localStorage, data is kept after the browser quit. session: window.sessionStorage, data is cleared once the browser quit.
    
    * `precision` (Number; default 2): Number of significant figures.
    
    * `size` (Number; optional): The size (length) of the numeric input in pixels.
    
    * `style` (Dict; optional): Style to apply to the root component element.
    
    * `theme` (Dict; default light): Theme configuration to be set by a ThemeProvider.
    
    * `value` (Number; optional): The value of numeric input.
    """)

end

end