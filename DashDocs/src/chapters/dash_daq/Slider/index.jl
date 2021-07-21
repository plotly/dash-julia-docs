@doc_chapter "/dash_daq/slider" begin

@example slider_default "default.jl"
@example slider_handlelabel "handle_label.jl"
@example slider_marks "marks.jl"
@example slider_size "size.jl"
@example slider_step "step.jl"
@example slider_verticalorientation "vertical_orientation.jl"

@layout html_div() do

    html_h1("Slider Examples and Reference"),

    html_h3("Default Slider"),

    dcc_markdown("An example of a default slider without any extra properties."),

    source"slider_default",
    layout"slider_default",

    html_h3("Marks"),

    dcc_markdown("""Set custom marks on the slider using with `marks`."""),

    source"slider_marks",
    layout"slider_marks",

    html_h3("Size"),

    dcc_markdown("""
    Change the size of the slider using `size`.
    """),

    source"slider_size",
    layout"slider_size",

    html_h3("Handle Label"),

    dcc_markdown("""
    Set the labels for the handle that is dragged with `handleLabel`.
    """),

    source"slider_handlelabel",
    layout"slider_handlelabel",

    html_h3("Step"),

    dcc_markdown("""
    Change the value of increments or decrements using `step`.
    """),

    source"slider_step",
    layout"slider_step",

    html_h3("Vertical orientation"),

    dcc_markdown("""
    Make the slider display vertically by setting `vertical=true`.
    """),

    source"slider_verticalorientation",
    layout"slider_verticalorientation",

    html_h3("Slider Properties"),
    dcc_markdown("""
    Access this documentation in your Julia REPL with:
    ```julia    
    ?help daq_slider
    ```
    Our recommended IDE for writing Dash apps is Dash
      Enterprise's [Data Science Workspaces](https://plotly.com/dash/workspaces/),
       which has typeahead support for Dash Component Properties. [Find out if your company is using Dash Enterprise](https://go.plotly.com/company-lookup).
    """),
    dcc_markdown("""
    * `id` (String; optional): The ID used to identify this component in Dash callbacks.
 
    * `className` (String; optional): Additional CSS class for the root DOM node.
    
    * `color` (Dict; default colors.DARKER_PRIMARY): Color configuration for the slider's track. color is a String | Dict with keys:
    
        * `default` (String; optional): Fallback color to use when color.ranges has gaps.

        * `gradient` (Bool; optional): Display ranges as a gradient between given colors. Requires color.ranges to be contiguous along the entirety of the gauge's range of values.

        * `ranges` (Dict; optional): Define multiple color ranges on the slider's track. The key determines the color of the range and the value is the start,end of the range itself. `ranges` is a Dict with keys:

            * `color` (list of Numbers; optional)
    * disabled (Bool; optional): If true, the handles can't be moved.
    
    * `dots` (Bool; optional): When the step value is greater than 1, you can set the dots to true if you want to render the slider with dots. Note: dots are disabled automatically when using color.ranges.
    
    * `handleLabel` (Dict; optional): Configuration of the slider handle's label. Passing falsy value will disable the label. handleLabel is a String | Dict with keys:
    
        * `color` (String; optional)

        * `label` (String; optional)

        * `showCurrentValue` (Bool; optional)

        * `style` (Dict; optional)
    
    * `included` (Bool; optional): If the value is true, it means a continuous value is included. Otherwise, it is an independent value.
    
    * `labelPosition` (a value equal to: 'top', 'bottom'; default 'bottom'): Where the component label is positioned.
    
    * `marks` (Dict; optional): Marks on the slider. The key determines the position, and the value determines what will show. If you want to set the style of a specific mark point, the value should be an object which contains style and label properties. marks is a Dict with keys:
    
        * `Number` (Dict; optional). Number is a String Or Dict with keys:

            * `label` (String; optional)

            * `style` (Dict; optional)
    
    * `max` (Number; optional): Maximum allowed value of the slider.
    
    * `min` (Number; default 0): Minimum allowed value of the slider.
    
    * `persisted_props` (list of a value equal to: 'value's; default 'value'): Properties whose user interactions will persist after refreshing the component or the page. Since only value is allowed this prop can normally be ignored.
    
    * `persistence` (Bool | String | Number; optional): Used to allow user interactions in this component to be persisted when the component - or the page - is refreshed. If persisted is truthy and hasn't changed from its previous value, a value that the user has changed while using the app will keep that change, as long as the new value also matches what was given originally. Used in conjunction with `persistence_type`.
    
    * `persistence_type` (a value equal to: 'local', 'session', 'memory'; default 'local'): Where persisted user changes will be stored: memory: only kept in memory, reset on page refresh. local: window.localStorage, data is kept after the browser quit. session: window.sessionStorage, data is cleared once the browser quit.
    
    * `size` (Number; default 265): Size of the slider in pixels.
    
    * `step` (Number; optional): Value by which increments or decrements are made.
    
    * `targets` (Dict; optional): Targets on the slider. The key determines the position, and the value determines what will show. If you want to set the style of a specific target point, the value should be an object which contains style and label properties. `targets` is a Dict with keys:
    
        * `Number` (Dict; optional)

        * `Number` is a String Or Dict with keys:

            * `color` (String; optional)

            * `label` (String; optional)

            * `showCurrentValue` (Bool; optional)

            * `style` (Dict; optional)
    
    * `theme` (Dict; default light): Theme configuration to be set by a ThemeProvider.
    
    * `updatemode` (a value equal to: 'mouseup', 'drag'; default 'mouseup'): Determines when the component should update its value. If mouseup, then the slider will only trigger its value when the user has finished dragging the slider. If drag, then the slider will update its value continuously as it is being dragged. Only use drag if your updates are fast.
    
    * `value` (Number; optional): The value of the input.
    
    * `vertical` (Bool; optional): If true, the slider will be vertical.
    """)

end

end