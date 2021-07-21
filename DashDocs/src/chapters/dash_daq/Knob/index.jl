@doc_chapter "/dash_daq/knob" begin

@example knob_default "default.jl"
@example knob_colorgradient "color_gradient.jl"
@example knob_colorranges "color_ranges.jl"
@example knob_max "max.jl"
@example knob_scale "scale.jl"
@example knob_size "size.jl"

@layout html_div() do

    html_h1("Knob Examples and Reference"),

    html_h3("Default Knob"),

    dcc_markdown("An example of a default Knob without any extra properties."),

    source"knob_default",
    layout"knob_default",

    html_h3("Size"),

    dcc_markdown("""Set the size(diameter) of the knob in pixels with `size`."""),

    source"knob_size",
    layout"knob_size",

    html_h3("Max"),

    dcc_markdown("""
    Set the maximum value of the knob using `max`.
    """),

    source"knob_max",
    layout"knob_max",

    html_h3("Color Ranges"),

    dcc_markdown("""
    Control color ranges with
    `color=Dict('ranges'=>Dict('<color>'=>[<value>,<value>],'<color>'=>[<value>,<value>], '<color>'=>[<value>,<value>]))`.
    """),

    source"knob_colorranges",
    layout"knob_colorranges",

    html_h3("Color Gradient"),

    dcc_markdown("""
    Set up a color gradient with:
    `color=Dict('gradient'=>true,'ranges'=>Dict('<color>'=>[<value>,<value>],'<color>'=>[<value>,<value>], '<color>'=>[<value>,<value>]))`.
    """),

    source"knob_colorgradient",
    layout"knob_colorgradient",

    html_h3("Scale"),

    dcc_markdown("""
    Adjust the scale interval, label interval, and start of the scale with `scale`.
    """),

    source"knob_scale",
    layout"knob_scale",

    html_h3("Knob Properties"),
    dcc_markdown("""
    Access this documentation in your Julia REPL with:
    ```julia    
    ?help daq_knob
    ```
    Our recommended IDE for writing Dash apps is Dash
      Enterprise's [Data Science Workspaces](https://plotly.com/dash/workspaces/),
       which has typeahead support for Dash Component Properties. [Find out if your company is using Dash Enterprise](https://go.plotly.com/company-lookup).
    """),
    dcc_markdown("""
    * `id` (String; optional): The ID used to identify this compnent in Dash callbacks.
 
    * `className` (String; optional): Class to apply to the root component element.
    
    * `color` (Dict; optional): Color configuration for the knob's track. `color` is a String | Dict with keys:
    
        * `default` (String; optional): Color used for current value text and other minor accents.

        * `gradient` (Bool; optional): Display ranges as a gradient between given colors.

        * `ranges` (Dict; optional): Define multiple color ranges on the knob's track. The key determines the color of the range and the value is the start,end of the range itself. Ranges must be contiguous along the entirety of the knob's range of values.

        * `ranges` is a Dict with keys:

            * `color` (list of Numbers; optional)
    * disabled (Bool; optional): If True, knob cannot be moved.
    
    * `label` (Dict; optional): Description to be displayed alongside the control. To control styling, pass an object with label and style properties. `label` is a String | Dict with keys:
    
        * `label` (String; optional)

        * `style` (Dict; optional)
    
    * `labelPosition` (a value equal to: 'top', 'bottom'; default 'top'): Where the knob label is positioned.
    
    * `max` (Number; default 10): The maximum value of the knob.
    
    * `min` (Number; default 0): The minimum value of the knob.
    
    * `persisted_props` (list of a value equal to: 'value's; default 'value'): Properties whose user interactions will persist after refreshing the component or the page. Since only value is allowed this prop can normally be ignored.
    
    * `persistence` (Bool | String | Number; optional): Used to allow user interactions in this component to be persisted when the component - or the page - is refreshed. If persisted is truthy and hasn't changed from its previous value, a value that the user has changed while using the app will keep that change, as long as the new value also matches what was given originally. Used in conjunction with persistence_type.
    
    * `persistence_type` (a value equal to: 'local', 'session', 'memory'; default 'local'): Where persisted user changes will be stored: memory: only kept in memory, reset on page refresh. local: window.localStorage, data is kept after the browser quit. session: window.sessionStorage, data is cleared once the browser quit.
    
    * `scale` (Dict; optional): Configuration for the component scale. `scale` is a Dict with keys:
    
        * `custom` (Dict; optional): Custom scale marks. The key determines the position and the value determines what will show. If you want to set the style of a specific mark point, the value should be an object which contains style and label properties.

        * `custom` is a Number Or Dict with keys:

            * `label` (String; optional)

            * `style` (String; optional)

        * `interval` (Number; optional): Interval by which the scale goes up. Attempts to dynamically divide min-max range by default.

        * `labelInterval` (Number; optional): Interval by which labels are added to scale marks. Defaults to 2 (every other mark has a label).

        * `start` (Number; optional): Value to start the scale from. Defaults to min.
    
    * `size` (Number; optional): The size (diameter) of the knob in pixels.
    
    * `style` (Dict; optional): Style to apply to the root component element.
    
    * `theme` (Dict; default light): Theme configuration to be set by a ThemeProvider.
    
    * `value` (Number; optional): The value of knob.
    """)

end

end