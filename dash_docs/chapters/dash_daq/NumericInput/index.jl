module chapters_dash_daq_numericinput

using Dash, DashHtmlComponents, DashCoreComponents

include("../../../utils.jl")

export examples

examples_path = joinpath(@__DIR__, "examples")

numericinput_default = LoadExampleCode(string(examples_path, "/default.jl"))

numericinput_disable = LoadExampleCode(string(examples_path, "/disable.jl"))

numericinput_label = LoadExampleCode(string(examples_path, "/label.jl"))

numericinput_maxmin = LoadExampleCode(string(examples_path, "/max_min.jl"))

numericinput_size = LoadExampleCode(string(examples_path, "/size.jl"))

examples = [
  numericinput_default
]
app =  dash()

numericinput_default.callback!(app) 

app.layout = html_div() do

    html_h1("Numeric Input Examples and Reference"),

    html_h3("Default Numeric Input"),

    dcc_markdown("An example of a default numeric input without any extra properties."),

    numericinput_default.source_code,
    numericinput_default.layout,

    html_h3("Label"),

    dcc_markdown("""Set the label and label position with `label` and `labelPosition`."""),

    numericinput_label.source_code,
    numericinput_label.layout,

    html_h3("Size"),

    dcc_markdown("""
    Extend the size with `size`.
    """),

    numericinput_size.source_code,
    numericinput_size.layout,

    html_h3("Max and Min"),

    dcc_markdown("""
    Set the minimum and maximum bounds with `min` and `max`.
    """),

    numericinput_maxmin.source_code,
    numericinput_maxmin.layout,

    html_h3("Disable"),

    dcc_markdown("""
    Disable the numeric input by setting `disabled=true`.
    """),

    numericinput_disable.source_code,
    numericinput_disable.layout,

    html_h3("Numeric Input Properties"),
    dcc_markdown("""
    Access this documentation in your Julia REPL with:
    ```julia    
    ?help daq_numericinput
    ```
    Our recommended IDE for writing Dash apps is Dash
      Enterprise's [Data Science Workspaces](https://plotly.com/dash/workspaces/),
       which has typeahead support for Dash Component Properties. [Find out if your company is using Dash Enterprise](https://go.plotly.com/company-lookup).
    """),
    dcc_markdown("""
    * `id` (String; optional): The ID used to identify this compnent in Dash callbacks.
 
    * `className` (String; optional): Class to apply to the root component element.
    
    * `disabled` (Bool; optional): If true, numeric input cannot changed.
    
    * `label` (Dict; optional): Description to be displayed alongside the control. To control styling, pass an object with label and style properties. `label` is a String | Dict with keys:
    
        * `label` (String; optional)

        * `style` (Dict; optional)
    
    * `labelPosition` (a value equal to: 'top', 'bottom'; default 'top'): Where the numeric input label is positioned.
    
    * `max` (Number; default 10): The maximum value of the numeric input.
    
    * `min` (Number; default 0): The minimum value of the numeric input.
    
    * `persisted_props` (list of a value equal to: 'value's; default 'value'): Properties whose user interactions will persist after refreshing the component or the page. Since only value is allowed this prop can normally be ignored.
    
    * `persistence` (Bool | String | Number; optional): Used to allow user interactions in this component to be persisted when the component - or the page - is refreshed. If persisted is truthy and hasn't changed from its previous value, a value that the user has changed while using the app will keep that change, as long as the new value also matches what was given originally. Used in conjunction with persistence_type.
    
    * `persistence_type` (a value equal to: 'local', 'session', 'memory'; default 'local'): Where persisted user changes will be stored: memory: only kept in memory, reset on page refresh. local: window.localStorage, data is kept after the browser quit. session: window.sessionStorage, data is cleared once the browser quit.
    
    * `size` (Number; optional): The size (length) of the numeric input in pixels.
    
    * `style` (Dict; optional): Style to apply to the root component element.
    
    * `theme` (Dict; default light): Theme configuration to be set by a ThemeProvider.
    
    * `value` (Number; optional): The value of numeric input.
    """)

end

end