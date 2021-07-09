module chapters_dash_daq_graduatebar

using Dash, DashHtmlComponents, DashCoreComponents

include("../../../utils.jl")

export examples

examples_path = joinpath(@__DIR__, "examples")

graduatebar_default = LoadExampleCode(string(examples_path, "/default.jl"))

colorpicker_disabled = LoadExampleCode(string(examples_path, "/disabled.jl"))

colorpicker_hexcolors = LoadExampleCode(string(examples_path, "/hex_colors.jl"))

colorpicker_label = LoadExampleCode(string(examples_path, "/label.jl"))

colorpicker_rgbcolors = LoadExampleCode(string(examples_path, "/rgb_colors.jl"))

colorpicker_size = LoadExampleCode(string(examples_path, "/size.jl"))

examples = [
  colorpicker_default
]
app =  dash()

colorpicker_default.callback!(app) 

app.layout = html_div() do

    html_h1("Color Picker Examples and Reference"),

    html_h3("Default Color Picker"),

    dcc_markdown("An example of a default Color Picker without any extra properties."),

    colorpicker_default.source_code,
    colorpicker_default.layout,

    html_h3("Size"),

    dcc_markdown("""Set the size (width) of the color picker in pixels using the `size` property."""),

    colorpicker_size.source_code,
    colorpicker_size.layout,

    html_h3("Label"),

    dcc_markdown("""
    Define the label and label position 
    using the `label` and `labelPosition` properties.
    """),

    colorpicker_label.source_code,
    colorpicker_label.layout,

    html_h3("Disabled"),
    dcc_markdown("""
    To disable the Color Picker set `disabled` to `true`.
    """),
    colorpicker_disabled.source_code,
    colorpicker_disabled.layout,

    html_h3("Hex Colors"),

    dcc_markdown("""
    Use hex values with the Color Picker by setting `value=(hex='#<hex_color>')`
    """),

    colorpicker_hexcolors.source_code,
    colorpicker_hexcolors.layout,

    html_h3("RGB Colors"),

    dcc_markdown("""
    Use RGB color values with the Color Picker by setting:
    `value=(rgb=(r=<r_value>, g=<g_value>, b=<b_value>, a=<a_value>)`
    """),

    colorpicker_rgbcolors.source_code,
    colorpicker_rgbcolors.layout,

    html_h3("Color Picker Properties"),
    dcc_markdown("""
    Access this documentation in your Julia REPL with:
    ```julia    
    ?help daq_colorpicker
    ```
    Our recommended IDE for writing Dash apps is Dash
      Enterprise's [Data Science Workspaces](https://plotly.com/dash/workspaces/),
       which has typeahead support for Dash Component Properties. [Find out if your company is using Dash Enterprise](https://go.plotly.com/company-lookup).
    """),
    dcc_markdown("""
    * id (String; optional): The ID used to identify the color picker in Dash callbacks.
 
    * className (String; optional): Class to apply to the root component element.
    
    * `disabled` (Boolean; optional): If True, color cannot be picked.
    
    * `label` (Dict; optional): Description to be displayed alongside the control. To control styling, pass an object with label and style properties.
    
    * `label` is a String | Dict with keys:
    
    * `label` (String; optional)
    
    * `style` (Dict; optional)
    
    * `labelPosition` (a value equal to: 'top', 'bottom'; default 'top'): Where the indicator label is positioned.
    
    * `persisted_props` (list of a value equal to: 'value's; default 'value'): Properties whose user interactions will persist after refreshing the component or the page. Since only value is allowed this prop can normally be ignored.
    
    * `persistence` (Boolean | String | Number; optional): Used to allow user interactions in this component to be persisted when the component - or the page - is refreshed. If persisted is truthy and hasn't changed from its previous value, a value that the user has changed while using the app will keep that change, as long as the new value also matches what was given originally. Used in conjunction with persistence_type.
    
    * `persistence_type` (a value equal to: 'local', 'session', 'memory'; default 'local'): Where persisted user changes will be stored: memory: only kept in memory, reset on page refresh. local: window.localStorage, data is kept after the browser quit. session: window.sessionStorage, data is cleared once the browser quit.
    
    * `size` (Number; default 225): Size (width) of the component in pixels.
    
    * `style` (Dict; optional): Style to apply to the root component element.
    
    * `theme` (Dict; default light): Theme configuration to be set by a ThemeProvider.
    
    * `value` (Dict; optional): Color value of the picker.

    * `value` is a Dict with keys:
    
        * `hex` (String; optional): Hex String.
        
        * `rbg` (Dict; optional): RGB/RGBA object.
        
        * `rbg` is a Dict with keys:
        
            * `a` (Number; optional)
            * 
            * `b` (Number; optional)
            * 
            * `g` (Number; optional)
            * 
            * `r` (Number; optional)
    """)

end

end