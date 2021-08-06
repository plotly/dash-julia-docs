@doc_chapter "/dash_daq/precision_input" begin

@example precisioninput_default "default.jl"
@example precisioninput_disabled "disabled.jl"
@example precisioninput_label "label.jl"
@example precisioninput_maxmin "max_min.jl"
@example precisioninput_precision "precision.jl"
@example precisioninput_size "size.jl"

@layout html_div() do

    html_h1("Precision Input Examples and Reference"),

    html_h3("Default Precision Input"),

    dcc_markdown("An example of a default precision input without any extra properties."),

    source"precisioninput_default",
    layout"precisioninput_default",

    html_h3("Label"),

    dcc_markdown("""Set the label and label position with `label` and `labelPosition`."""),

    source"precisioninput_label",
    layout"precisioninput_label",

    html_h3("Precision"),

    dcc_markdown("""
    The `precision` property is mandatory for this component. The `precision` property indicates the accuracy of the specified number.
    """),

    source"precisioninput_precision",
    layout"precisioninput_precision",

    html_h3("Max and Min"),

    dcc_markdown("""
    Set the maximum and minimum value of the numeric input with `max` and `min`.
    """),

    source"precisioninput_maxmin",
    layout"precisioninput_maxmin",

    html_h3("Size"),

    dcc_markdown("""
    Set the length (in pixels) of the numeric input `size`.
    """),

    source"precisioninput_size",
    layout"precisioninput_size",

    html_h3("Disabled"),

    dcc_markdown("""
    Disable the precision input by setting `disabled=true`.
    """),

    source"precisioninput_disabled",
    layout"precisioninput_disabled",

    html_h3("Precision Input Properties"),
    dcc_markdown("""
    Access this documentation in your Julia REPL with:
    ```julia    
    ?help daq_precisioninput
    ```
    Our recommended IDE for writing Dash apps is Dash
      Enterprise's [Data Science Workspaces](https://plotly.com/dash/workspaces/),
       which has typeahead support for Dash Component Properties. [Find out if your company is using Dash Enterprise](https://go.plotly.com/company-lookup).
    """),
    dcc_markdown(string(@doc daq_precisioninput))

end

end