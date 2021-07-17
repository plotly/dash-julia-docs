@doc_chapter "/dash_core_components/markdown" begin

    @example headers "headers.jl"
    @example emphasis "emphasis.jl"
    @example block "block.jl"
    @example lists "lists.jl"
    @example links "links.jl"
    @example inline "inline.jl"
  
    @layout html_div() do

    html_h1("Markdown Examples and Reference"),

    html_h3("Headers"),

    source"headers",
    layout"headers",

    html_h3("Emphasis"),

    source"emphasis",
    layout"emphasis",

    html_h3("Lists"),

    source"lists",
    layout"lists",

    html_h3("Block Quotes"),

    source"block",
    layout"block",

    html_h3("Links"),

    source"links",
    layout"links",

    html_h3("Inline Code"),

    source"inline",
    layout"inline"

end

end