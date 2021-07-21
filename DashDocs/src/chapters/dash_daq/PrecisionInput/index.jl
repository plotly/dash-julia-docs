@doc_chapter "/dash_daq/precision_input" begin

@example precisioninput_default "default.jl"
@example precisioninput_disabled "disabled.jl"
@example precisioninput_label "label.jl"
@example precisioninput_maxmin "max_min.jl"
@example precisioninput_precision "precision.jl"
@example precisioninput_size "size.jl"

@layout html_div() do

    html_h1("Precision Input Examples and Reference"),

    html_h3("Default Precision Input"),

    dcc_markdown("An example of a default precision input without any extra properties."),

    source"precisioninput_default",
    layout"precisioninput_default",

    html_h3("Label"),

    dcc_markdown("""Set the label and label position with `label` and `labelPosition`."""),

    source"precisioninput_label",
    layout"precisioninput_label",

    html_h3("Precision"),

    dcc_markdown("""
    The `precision` property is mandatory for this component. The `precision` property indicates the accuracy of the specified number.
    """),

    source"precisioninput_precision",
    layout"precisioninput_precision",

    html_h3("Max and Min"),

    dcc_markdown("""
    Set the maximum and minimum value of the numeric input with `max` and `min`.
    """),

    source"precisioninput_maxmin",
    layout"precisioninput_maxmin",

    html_h3("Size"),

    dcc_markdown("""
    Set the length (in pixels) of the numeric input `size`.
    """),

    source"precisioninput_size",
    layout"precisioninput_size",

    html_h3("Disabled"),

    dcc_markdown("""
    Disable the precision input by setting `disabled=true`.
    """),

    source"precisioninput_disabled",
    layout"precisioninput_disabled",

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