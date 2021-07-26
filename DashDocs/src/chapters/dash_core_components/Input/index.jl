@doc_chapter "/dash_core_components/input" begin

    @example input_types "input_types.jl"
    @example debounce "debounce.jl"
  
    @layout html_div() do

    html_h1("Input Examples and Reference"),

    html_h3("Supported Input Types"),

    source"input_types",
    layout"input_types",

    html_h3("Debounce delays Input processing"),

    source"debounce",
    layout"debounce"

end

end