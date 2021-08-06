@doc_chapter "/dash_daq/boolean_switch" begin

@example booleanswitch_default "default.jl"
@example booleanswitch_label "label.jl"
@example booleanswitch_vertical_switch "vertical_switch.jl"
@example booleanswitch_disabled_switch "disabled_switch.jl"
@example booleanswitch_color "color.jl"


@layout html_div() do

    html_h1("Boolean Switch Examples and Reference"),

    html_h3("Default Boolean Switch"),

    dcc_markdown("An example of a default boolean switch without any extra properties."),

    source"booleanswitch_default",
    layout"booleanswitch_default",

    html_h3("Color"),

    dcc_markdown("""Set the color of the boolean switch with `color=#<hex_value>`."""),

    source"booleanswitch_color",
    layout"booleanswitch_color",

    html_h3("label"),

    dcc_markdown("""
    Set the label and label position using the label
     and labelPosition properties.
    """),

    source"booleanswitch_label",
    layout"booleanswitch_label",

    html_h3("Vertical Switch"),
    dcc_markdown("""
    Create a vertical oriented switch by setting `vertical=True`.
    """),
    source"booleanswitch_vertical_switch",
    layout"booleanswitch_vertical_switch",

    html_h3("Disabled Switch"),

    dcc_markdown("""
    To disable the Boolean Switch set the property `disabled` to `true`.
    """),

    source"booleanswitch_disabled_switch",
    layout"booleanswitch_disabled_switch",

    html_h3("Boolean Switch Properties"),
    dcc_markdown("""
    Access this documentation in your Julia REPL with:
    ```julia    
    ?help daq_booleanswitch
    ```
    Our recommended IDE for writing Dash apps is Dash
      Enterprise's [Data Science Workspaces](https://plotly.com/dash/workspaces/),
       which has typeahead support for Dash Component Properties. [Find out if your company is using Dash Enterprise](https://go.plotly.com/company-lookup).
    """),
    dcc_markdown(string(@doc daq_booleanswitch))

end

end