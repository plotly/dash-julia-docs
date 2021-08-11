@doc_chapter "/dash-core-components/textarea" begin

    @example simple_textarea "simple_textarea.jl"
    @example button_press "button_press.jl"
  
    @layout html_div() do

    html_h1("Textarea Examples and Reference"),

    html_h3("Simple Textarea Example"),

    source"simple_textarea",
    layout"simple_textarea",

    html_h3("Update `dcc_textarea` callback on button press"),

    source"button_press",
    layout"button_press",

    html_h3("dcc_textarea Reference"),
    dcc_markdown("""
        ```julia
            Access this documentation in your Julia REPL with:

            ?help dcc_textarea

            Our recommended IDE for writing Dash apps is Dash Enterprise's Data Science Workspaces, which has typeahead support for Dash Component Properties. Find out if your company is using Dash Enterprise.
        ```
    """),
    dcc_markdown(string(@doc dcc_textarea))

end

end