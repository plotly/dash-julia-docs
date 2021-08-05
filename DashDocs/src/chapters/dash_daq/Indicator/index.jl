@doc_chapter "/dash_daq/indicator" begin

@example indicator_default "default.jl"
@example indicator_boolindicatoroff "bool_indicator_off.jl"
@example indicator_color "color.jl"
@example indicator_label "label.jl"
@example indicator_square "square.jl"

@layout html_div() do

    html_h1("Indicator Examples and Reference"),

    html_h3("Default Indicator"),

    dcc_markdown("An example of a default Indicator without any extra properties."),

    source"indicator_default",
    layout"indicator_default",

    html_h3("Label"),

    dcc_markdown("""
    Define the label and label orientation with `label` and `labelPosition`.
    """),

    source"indicator_label",
    layout"indicator_label",

    html_h3("Boolean Indicator Off"),

    dcc_markdown("""
    A boolean indicator set to off `value=false`.
    """),

    source"indicator_boolindicatoroff",
    layout"indicator_boolindicatoroff",

    html_h3("Square"),
    dcc_markdown("""
    Create a square boolean indicator by setting the `width` and `height` to the same value.
    """),
    source"indicator_square",
    layout"indicator_square",

    html_h3("Color"),

    dcc_markdown("""
    Define the color of the boolean indicator with `color='#<color>'`.
    """),

    source"indicator_color",
    layout"indicator_color",

    html_h3("Indicator Properties"),
    dcc_markdown("""
    Access this documentation in your Julia REPL with:
    ```julia    
    ?help daq_indicator
    ```
    Our recommended IDE for writing Dash apps is Dash
      Enterprise's [Data Science Workspaces](https://plotly.com/dash/workspaces/),
       which has typeahead support for Dash Component Properties. [Find out if your company is using Dash Enterprise](https://go.plotly.com/company-lookup).
    """),
    dcc_markdown(string(@doc daq_indicator))

end

end