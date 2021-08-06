@doc_chapter "/dash_daq/stop_button" begin

@example stopbutton_default "default.jl"
@example stopbutton_buttontext "button_text.jl"
@example stopbutton_disabled "disabled.jl"
@example stopbutton_label "label.jl"
@example stopbutton_size "size.jl"

@layout html_div() do

    html_h1("Stop Button Examples and Reference"),

    html_h3("Default Stop Button"),

    dcc_markdown("An example of a default stop button without any extra properties."),

    source"stopbutton_default",
    layout"stopbutton_default",

    html_h3("Label"),

    dcc_markdown("""Set the label and label position with `label` and `labelPosition`."""),

    source"stopbutton_label",
    layout"stopbutton_label",

    html_h3("Size"),

    dcc_markdown("""
    Change the size of the slider using `size`.
    """),

    source"stopbutton_size",
    layout"stopbutton_size",

    html_h3("Button Text"),

    dcc_markdown("""
    Set the text displayed in the button `buttonText`.
    """),

    source"stopbutton_buttontext",
    layout"stopbutton_buttontext",

    html_h3("Disabled"),

    dcc_markdown("""
    Disable the button by setting `disabled=true`.
    """),

    source"stopbutton_disabled",
    layout"stopbutton_disabled",

    html_h3("Stop Button Properties"),
    dcc_markdown("""
    Access this documentation in your Julia REPL with:
    ```julia    
    ?help daq_stopbutton
    ```
    Our recommended IDE for writing Dash apps is Dash
      Enterprise's [Data Science Workspaces](https://plotly.com/dash/workspaces/),
       which has typeahead support for Dash Component Properties. [Find out if your company is using Dash Enterprise](https://go.plotly.com/company-lookup).
    """),
    dcc_markdown(string(@doc daq_stopbutton))

end

end