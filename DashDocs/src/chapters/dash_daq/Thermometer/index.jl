@doc_chapter "/dash_daq/thermometer" begin

@example thermometer_default "default.jl"
@example thermometer_customscales "custom_scales.jl"
@example thermometer_heightwidth "height_width.jl"
@example thermometer_label "label.jl"
@example thermometer_valunits "val_units.jl"

@layout html_div() do
    

    html_h1("Thermometer Examples and Reference"),

    html_h3("Default Thermometer"),

    dcc_markdown("An example of a default Thermometer without any extra properties."),

    source"thermometer_default",
    layout"thermometer_default",

    html_h3("Current value with units"),

    dcc_markdown("""Display the current value, along with optional units with the `units` and `showCurrentValue` properties."""),

    source"thermometer_valunits",
    layout"thermometer_valunits",

    html_h3("Height and width"),

    dcc_markdown("""
    Control the size of the thermometer  by setting `height` and `width`..
    """),

    source"thermometer_heightwidth",
    layout"thermometer_heightwidth",

    html_h3("Label"),

    dcc_markdown("""
    Display a label alongside your tank in the specified position with `label` and `labelPosition`.
    """),

    source"thermometer_label",
    layout"thermometer_label",

    html_h3("Custom scales"),

    dcc_markdown("""
    Control the intervals at which labels are displayed, as well as the labels themselves with the `scale` property.
    """),

    source"thermometer_customscales",
    layout"thermometer_customscales",

    html_h3("Thermometer Properties"),
    dcc_markdown("""
    Access this documentation in your Julia REPL with:
    ```julia    
    ?help daq_thermometer
    ```
    Our recommended IDE for writing Dash apps is Dash
      Enterprise's [Data Science Workspaces](https://plotly.com/dash/workspaces/),
       which has typeahead support for Dash Component Properties. [Find out if your company is using Dash Enterprise](https://go.plotly.com/company-lookup).
    """),
    dcc_markdown(string(@doc daq_thermometer))

end

end