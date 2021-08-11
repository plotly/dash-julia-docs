@doc_chapter "/dash-daq/powerbutton" begin

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
    dcc_markdown(string(@doc daq_powerbutton))

end

end