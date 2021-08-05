@doc_chapter "/dash_daq/numeric_input" begin

@example numericinput_default "default.jl"
@example numericinput_disable "disable.jl"
@example numericinput_label "label.jl"
@example numericinput_maxmin "max_min.jl"
@example numericinput_size "size.jl"

@layout html_div() do

    html_h1("Numeric Input Examples and Reference"),

    html_h3("Default Numeric Input"),

    dcc_markdown("An example of a default numeric input without any extra properties."),

    source"numericinput_default",
    layout"numericinput_default",

    html_h3("Label"),

    dcc_markdown("""Set the label and label position with `label` and `labelPosition`."""),

    source"numericinput_label",
    layout"numericinput_label",

    html_h3("Size"),

    dcc_markdown("""
    Extend the size with `size`.
    """),

    source"numericinput_size",
    layout"numericinput_size",

    html_h3("Max and Min"),

    dcc_markdown("""
    Set the minimum and maximum bounds with `min` and `max`.
    """),

    source"numericinput_maxmin",
    layout"numericinput_maxmin",

    html_h3("Disable"),

    dcc_markdown("""
    Disable the numeric input by setting `disabled=true`.
    """),

    source"numericinput_disable",
    layout"numericinput_disable",

    html_h3("Numeric Input Properties"),
    dcc_markdown("""
    Access this documentation in your Julia REPL with:
    ```julia    
    ?help daq_numericinput
    ```
    Our recommended IDE for writing Dash apps is Dash
      Enterprise's [Data Science Workspaces](https://plotly.com/dash/workspaces/),
       which has typeahead support for Dash Component Properties. [Find out if your company is using Dash Enterprise](https://go.plotly.com/company-lookup).
    """),
    dcc_markdown(string(@doc daq_numericinput))

end

end