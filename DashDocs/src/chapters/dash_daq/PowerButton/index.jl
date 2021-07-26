@doc_chapter "/dash_daq/power_button" begin

@example powerbutton_default "default.jl"
@example powerbutton_color "color.jl"
@example powerbutton_label "label.jl"
@example powerbutton_size "size.jl"

@layout html_div() do

    html_h1("Power Button Examples and Reference"),

    html_h3("Default Power Button"),

    dcc_markdown("An example of a default power button without any extra properties."),

    source"powerbutton_default",
    layout"powerbutton_default",

    html_h3("Label"),

    dcc_markdown("""Set the label and label position with `label` and `labelPosition`."""),

    source"powerbutton_label",
    layout"powerbutton_label",

    html_h3("Size"),

    dcc_markdown("""
    Adjust the size (diameter in pixels) of the power button with `size`..
    """),

    source"powerbutton_size",
    layout"powerbutton_size",

    html_h3("Color"),

    dcc_markdown("""
    Set the color of the power button with `color`.
    """),

    source"powerbutton_color",
    layout"powerbutton_color",

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