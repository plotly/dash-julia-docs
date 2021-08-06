@doc_chapter "/dash_daq/tank" begin

@example tank_default "default.jl"
@example tank_customscales "custom_scales.jl"
@example tank_heightwidth "height_width.jl"
@example tank_label "label.jl"
@example tank_log "log.jl"
@example tank_valunits "val_units.jl"

@layout html_div() do
    

    html_h1("Tank Examples and Reference"),

    html_h3("Default Tank"),

    dcc_markdown("An example of a default tank without any extra properties."),

    source"tank_default",
    layout"tank_default",

    html_h3("Current value with units"),

    dcc_markdown("""Display the current value, along with optional units with the `units` and `showCurrentValue` properties."""),

    source"tank_valunits",
    layout"tank_valunits",

    html_h3("Height and width"),

    dcc_markdown("""
    Control the size of the tank by setting `height` and `width`..
    """),

    source"tank_heightwidth",
    layout"tank_heightwidth",

    html_h3("Label"),

    dcc_markdown("""
    Display a label alongside your tank in the specified position with `label` and `labelPosition`.
    """),

    source"tank_label",
    layout"tank_label",

    html_h3("Custom scales"),

    dcc_markdown("""
    Control the intervals at which labels are displayed, as well as the labels themselves with the `scale` property.
    """),

    source"tank_customscales",
    layout"tank_customscales",

    html_h3("Logarithmic"),

    dcc_markdown("""
    Use a logarithmic scale for the tank with the specified base by setting `logarithmic=true`.
    """),

    source"tank_log",
    layout"tank_log",

    html_h3("Tank Properties"),
    dcc_markdown("""
    Access this documentation in your Julia REPL with:
    ```julia    
    ?help daq_tank
    ```
    Our recommended IDE for writing Dash apps is Dash
      Enterprise's [Data Science Workspaces](https://plotly.com/dash/workspaces/),
       which has typeahead support for Dash Component Properties. [Find out if your company is using Dash Enterprise](https://go.plotly.com/company-lookup).
    """),
    dcc_markdown(string(@doc daq_tank))

end

end