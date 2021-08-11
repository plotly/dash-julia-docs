@doc_chapter "/dash-daq/colorpicker" begin

@example colorpicker_default "default.jl"
@example colorpicker_disabled "disabled.jl"
@example colorpicker_hexcolors "hex_colors.jl"
@example colorpicker_label "label.jl"
@example colorpicker_rgbcolors "rgb_colors.jl"
@example colorpicker_size "size.jl"

@layout html_div() do

    html_h1("Color Picker Examples and Reference"),

    html_h3("Default Color Picker"),

    dcc_markdown("An example of a default Color Picker without any extra properties."),

    source"colorpicker_default",
    layout"colorpicker_default",

    html_h3("Size"),

    dcc_markdown("""Set the size (width) of the color picker in pixels using the `size` property."""),

    source"colorpicker_size",
    layout"colorpicker_size",

    html_h3("Label"),

    dcc_markdown("""
    Define the label and label position 
    using the `label` and `labelPosition` properties.
    """),

    source"colorpicker_label",
    layout"colorpicker_label",

    html_h3("Disabled"),
    dcc_markdown("""
    To disable the Color Picker set `disabled` to `true`.
    """),
    source"colorpicker_disabled",
    layout"colorpicker_disabled",

    html_h3("Hex Colors"),

    dcc_markdown("""
    Use hex values with the Color Picker by setting `value=(hex='#<hex_color>')`
    """),

    source"colorpicker_hexcolors",
    layout"colorpicker_hexcolors",

    html_h3("RGB Colors"),

    dcc_markdown("""
    Use RGB color values with the Color Picker by setting:
    `value=(rgb=(r=<r_value>, g=<g_value>, b=<b_value>, a=<a_value>)`
    """),

    source"colorpicker_rgbcolors",
    layout"colorpicker_rgbcolors",

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
    dcc_markdown(string(@doc daq_colorpicker))

end

end