@doc_chapter "/dash_daq/graduated_bar" begin

@example graduatebar_default "default.jl"
@example graduatebar_colorgradient "color_gradient.jl"
@example graduatebar_colorrange "color_range.jl"
@example graduatebar_curval "cur_val.jl"
@example graduatebar_max "max.jl"
@example graduatebar_orientation "orientation.jl"
@example graduatebar_size "size.jl"
@example graduatebar_step "step.jl"

@layout html_div() do

    html_h1("Graduated bar Examples and Reference"),

    html_h3("Default Graduated bar"),

    dcc_markdown("An example of a default Graduated bar without any extra properties."),

    source"graduatebar_default",
    layout"graduatebar_default",

    html_h3("Orientation"),

    dcc_markdown("""Change the orientation of the bar to vertical `vertical=true`."""),

    source"graduatebar_orientation",
    layout"graduatebar_orientation",

    html_h3("Size"),

    dcc_markdown("""
    Manually adjust the size of the bar in pixels with `size`.
    """),

    source"graduatebar_size",
    layout"graduatebar_size",

    html_h3("Max"),
    dcc_markdown("""
    Manually set a maximum value with `max`.
    """),
    source"graduatebar_max",
    layout"graduatebar_max",

    html_h3("Step"),

    dcc_markdown("""
    Manually set the step size of each bar with `step`.
    """),

    source"graduatebar_step",
    layout"graduatebar_step",

    html_h3("Show Current Value"),

    dcc_markdown("""
    Display the current value of the graduated bar with `showCurrentValue=true`.
    """),

    source"graduatebar_curval",
    layout"graduatebar_curval",

    html_h3("Color Range"),

    dcc_markdown("""
    Set a color range with:
    color=Dict('ranges'=>Dict('<color>'=>[<value>, <value>],
    '<color>'=>[<value>, <value>],'<color>'=>[<value>, <value>]))
    """),

    source"graduatebar_colorrange",
    layout"graduatebar_colorrange",

    html_h3("Color Gradient"),

    dcc_markdown("""
    Set a color gradient with:
    color=Dict('gradient'=>true,'ranges'=>Dict('<color>'=>[<value>, <value>],
    '<color>'=>[<value>, <value>],'<color>'=>[<value>, <value>]))
    """),

    source"graduatebar_colorgradient",
    layout"graduatebar_colorgradient",

    html_h3("Graduated Bar Properties"),
    dcc_markdown("""
    Access this documentation in your Julia REPL with:
    ```julia    
    ?help daq_graduatedbar
    ```
    Our recommended IDE for writing Dash apps is Dash
      Enterprise's [Data Science Workspaces](https://plotly.com/dash/workspaces/),
       which has typeahead support for Dash Component Properties. [Find out if your company is using Dash Enterprise](https://go.plotly.com/company-lookup).
    """),
    dcc_markdown("""
    * `id` (String; optional): The ID used to identify this compnent in Dash callbacks.

    * `className` (String; optional): Class to apply to the root component element.
    
    * `color` (Dict; default light.primary): Color configuration for the graduated bar's progress blocks.
    
    * `color` is a String | Dict with keys:

        * `default` (String; optional): Fallback color to use when color.ranges has gaps.
        
        * `gradient` (Boolean; optional): Display ranges as a gradient between given colors. Requires color.ranges to be contiguous along the entirety of the graduated bar's range of values.
        
        * `ranges` (Dict; optional): Define multiple color ranges on the graduated bar's track. The key determines the color of the range and the value is the start,end of the range itself.
        
        * `ranges` is a Dict with keys:
        
            * `color` (list of Numbers; optional)
    * `label` (Dict; optional): Description to be displayed alongside the control. To control styling, pass an object with label and style properties.
    
    * `label` is a String | Dict with keys:
    
    * `label` (String; optional)
    
    * `style` (Dict; optional)
    
    * `labelPosition` (a value equal to: 'top', 'bottom'; default 'top'): Where the component label is positioned.
    
    * `max` (Number; default 10): The maximum value of the graduated bar.

    * `min` (Number; default 0): The minimum value of the graduated bar.
    
    * `showCurrentValue` (Boolean; optional): If true, the current percentage of the bar will be displayed.
    
    * `size` (Number; default 250): The size (length) of the graduated bar in pixels.

    * `step` (Number; default 0.5): Value by which progress blocks appear.
    
    * `style` (Dict; optional): Style to apply to the root component element.
    
    * `theme` (Dict; default light): Theme configuration to be set by a ThemeProvider.
    
    * `value` (Number; optional): The value of the graduated bar.

    * `vertical` (Boolean; optional): If true, will display bar vertically instead of horizontally.
    """)

end

end