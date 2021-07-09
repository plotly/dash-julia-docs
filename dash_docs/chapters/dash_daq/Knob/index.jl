module chapters_dash_daq_knob

using Dash, DashHtmlComponents, DashCoreComponents

include("../../../utils.jl")

export examples

examples_path = joinpath(@__DIR__, "examples")

knob_default = LoadExampleCode(string(examples_path, "/default.jl"))

knob_colorgradient = LoadExampleCode(string(examples_path, "/color_gradient.jl"))

knob_colorranges = LoadExampleCode(string(examples_path, "/color_ranges.jl"))

knob_max = LoadExampleCode(string(examples_path, "/max.jl"))

knob_scale = LoadExampleCode(string(examples_path, "/scale.jl"))

knob_size = LoadExampleCode(string(examples_path, "/size.jl"))

examples = [
  knob_default
]
app =  dash()

knob_default.callback!(app) 

app.layout = html_div() do

    html_h1("Knob Examples and Reference"),

    html_h3("Default Knob"),

    dcc_markdown("An example of a default Knob without any extra properties."),

    knob_default.source_code,
    knob_default.layout,

    html_h3("Size"),

    dcc_markdown("""Set the size(diameter) of the knob in pixels with `size`."""),

    knob_size.source_code,
    knob_size.layout,

    html_h3("Max"),

    dcc_markdown("""
    Set the maximum value of the knob using `max`.
    """),

    knob_max.source_code,
    knob_max.layout,

    html_h3("Color Ranges"),

    dcc_markdown("""
    Control color ranges with
    `color=Dict('ranges'=>Dict('<color>'=>[<value>,<value>],'<color>'=>[<value>,<value>], '<color>'=>[<value>,<value>]))`.
    """),

    knob_colorranges.source_code,
    knob_colorranges.layout,

    html_h3("Color Gradient"),

    dcc_markdown("""
    Set up a color gradient with:
    `color=Dict('gradient'=>true,'ranges'=>Dict('<color>'=>[<value>,<value>],'<color>'=>[<value>,<value>], '<color>'=>[<value>,<value>]))`.
    """),

    knob_colorgradient.source_code,
    knob_colorgradient.layout,

    html_h3("Scale"),

    dcc_markdown("""
    Adjust the scale interval, label interval, and start of the scale with `scale`.
    """),

    knob_scale.source_code,
    knob_scale.layout,

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