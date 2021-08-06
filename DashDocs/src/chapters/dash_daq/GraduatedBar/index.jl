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
    dcc_markdown(string(@doc daq_graduatedbar))

end

end