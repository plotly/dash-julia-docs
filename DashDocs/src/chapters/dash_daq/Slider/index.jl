@doc_chapter "/dash-daq/slider" begin

@example slider_default "default.jl"
@example slider_handlelabel "handle_label.jl"
@example slider_marks "marks.jl"
@example slider_size "size.jl"
@example slider_step "step.jl"
@example slider_verticalorientation "vertical_orientation.jl"

@layout html_div() do

    html_h1("Slider Examples and Reference"),

    html_h3("Default Slider"),

    dcc_markdown("An example of a default slider without any extra properties."),

    source"slider_default",
    layout"slider_default",

    html_h3("Marks"),

    dcc_markdown("""Set custom marks on the slider using with `marks`."""),

    source"slider_marks",
    layout"slider_marks",

    html_h3("Size"),

    dcc_markdown("""
    Change the size of the slider using `size`.
    """),

    source"slider_size",
    layout"slider_size",

    html_h3("Handle Label"),

    dcc_markdown("""
    Set the labels for the handle that is dragged with `handleLabel`.
    """),

    source"slider_handlelabel",
    layout"slider_handlelabel",

    html_h3("Step"),

    dcc_markdown("""
    Change the value of increments or decrements using `step`.
    """),

    source"slider_step",
    layout"slider_step",

    html_h3("Vertical orientation"),

    dcc_markdown("""
    Make the slider display vertically by setting `vertical=true`.
    """),

    source"slider_verticalorientation",
    layout"slider_verticalorientation",

    html_h3("Slider Properties"),
    dcc_markdown("""
    Access this documentation in your Julia REPL with:
    ```julia    
    ?help daq_slider
    ```
    Our recommended IDE for writing Dash apps is Dash
      Enterprise's [Data Science Workspaces](https://plotly.com/dash/workspaces/),
       which has typeahead support for Dash Component Properties. [Find out if your company is using Dash Enterprise](https://go.plotly.com/company-lookup).
    """),
    dcc_markdown(string(@doc daq_slider))

end

end