@doc_chapter "/dash-core-components/input" begin

    @example input_types "input_types.jl"
    @example debounce "debounce.jl"
  
    @layout html_div() do

    html_h1("Input Examples and Reference"),

    html_h3("Supported Input Types"),

    source"input_types",
    layout"input_types",

    html_h3("Debounce delays Input processing"),

    source"debounce",
    layout"debounce",
    html_h3("dcc_input Reference"),
    dcc_markdown("""
        ```julia
            Access this documentation in your Julia REPL with:

            ?help dcc_input

            Our recommended IDE for writing Dash apps is Dash Enterprise's Data Science Workspaces, which has typeahead support for Dash Component Properties. Find out if your company is using Dash Enterprise.
        ```
    """),
    dcc_markdown(string(@doc dcc_input)) 

end

end