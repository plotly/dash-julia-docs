@doc_chapter "/dash-daq/toggleswitch" begin

@example toggleswitch_default "default.jl"
@example toggleswitch_label "label.jl"
@example toggleswitch_size "size.jl"
@example toggleswitch_vertical "vertical.jl"

@layout html_div() do

    html_h1("Toggle Switch Examples and Reference"),

    html_h3("Default Toggle Switch"),

    dcc_markdown("An example of a default toggle switch without any extra properties."),

    source"toggleswitch_default",
    layout"toggleswitch_default",

    html_h3("Vertical orientation"),

    dcc_markdown("""Make the switch display vertically by setting `vertical=true`."""),

    source"toggleswitch_vertical",
    layout"toggleswitch_vertical",

    html_h3("Size"),

    dcc_markdown("""
    Adjust the size of the toggle switch with `size`.
    """),

    source"toggleswitch_size",
    layout"toggleswitch_size",

    html_h3("Label"),

    dcc_markdown("""
    Display a label alongside your tank in the specified position with `label` and `labelPosition`.
    """),

    source"toggleswitch_label",
    layout"toggleswitch_label",

    html_h3("Toggle Switch Properties"),
    dcc_markdown("""
    Access this documentation in your Julia REPL with:
    ```julia    
    ?help daq_toggleswitch
    ```
    Our recommended IDE for writing Dash apps is Dash
      Enterprise's [Data Science Workspaces](https://plotly.com/dash/workspaces/),
       which has typeahead support for Dash Component Properties. [Find out if your company is using Dash Enterprise](https://go.plotly.com/company-lookup).
    """),
    dcc_markdown(string(@doc daq_toggleswitch))

end

end