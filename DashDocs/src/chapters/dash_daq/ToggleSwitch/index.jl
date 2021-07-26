@doc_chapter "/dash_daq/toggle_switch" begin

@example toggleswitch_default "default.jl"
@example toggleswitch_label "label.jl"
@example toggleswitch_size "size.jl"
@example toggleswitch_vertical "vertical.jl"

@layout html_div() do

    html_h1("Toggle Switch Examples and Reference"),

    html_h3("Default Toggle Switch"),

    dcc_markdown("An example of a default toggle switch without any extra properties."),

    source"toggleswitch_default",
    layout"toggleswitch_default",

    html_h3("Vertical orientation"),

    dcc_markdown("""Make the switch display vertically by setting `vertical=true`."""),

    source"toggleswitch_vertical",
    layout"toggleswitch_vertical",

    html_h3("Size"),

    dcc_markdown("""
    Adjust the size of the toggle switch with `size`.
    """),

    source"toggleswitch_size",
    layout"toggleswitch_size",

    html_h3("Label"),

    dcc_markdown("""
    Display a label alongside your tank in the specified position with `label` and `labelPosition`.
    """),

    source"toggleswitch_label",
    layout"toggleswitch_label",

    html_h3("Toggle Switch Properties"),
    dcc_markdown("""
    Access this documentation in your Julia REPL with:
    ```julia    
    ?help daq_toggleswitch
    ```
    Our recommended IDE for writing Dash apps is Dash
      Enterprise's [Data Science Workspaces](https://plotly.com/dash/workspaces/),
       which has typeahead support for Dash Component Properties. [Find out if your company is using Dash Enterprise](https://go.plotly.com/company-lookup).
    """),
    dcc_markdown("""
    * `id` (String; optional): The ID used to identify this compnent in Dash callbacks.
 
    * `className` (String; optional): Class to apply to the root component element.
    
    * `color` (String; optional): Color to highlight button/indicator.
    
    * `disabled` (Bool; optional): If true, switch cannot be clicked.
    
    * `label` (Dict; optional): Description to be displayed alongside the control. To control styling, pass an object with label and style properties. label is a String | Dict with keys:
    
        * `label` (String; optional)

        * `style` (Dict; optional) Or list of String | Dict with keys:

        * `label` (String; optional)

        * `style` (Dict; optional)s
    
    * `labelPosition` (a value equal to: 'top', 'bottom'; default 'top'): Where the component label is positioned.
    
    * `persisted_props` (list of a value equal to: 'value's; default 'value'): Properties whose user interactions will persist after refreshing the component or the page. Since only value is allowed this prop can normally be ignored.
    
    * `persistence` (Bool | String | Number; optional): Used to allow user interactions in this component to be persisted when the component - or the page - is refreshed. If persisted is truthy and hasn't changed from its previous value, a value that the user has changed while using the app will keep that change, as long as the new value also matches what was given originally. Used in conjunction with persistence_type.
    
    * `persistence_type` (a value equal to: 'local', 'session', 'memory'; default 'local'): Where persisted user changes will be stored: memory: only kept in memory, reset on page refresh. local: window.localStorage, data is kept after the browser quit. session: window.sessionStorage, data is cleared once the browser quit.
    
    * `size` (Number; optional): The size of the switch.
    
    * `style` (Dict; optional): Style to apply to the root object.
    
    * `theme` (Dict; default light): Theme configuration to be set by a ThemeProvider.
    
    * `value` (Bool; default False): The state of the switch.
    
    * `vertical` (Bool; default False): If true, switch will be vertical instead of horizontal.
    """)

end

end