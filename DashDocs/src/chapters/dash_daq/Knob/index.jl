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
    dcc_markdown(string(@doc daq_knob))

end

end