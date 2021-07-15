@doc_chapter "/dash_html_components/slot" begin

    @example docsslot "docs.jl"
    
    
    @layout html_div() do

    html_h1("Examples and References"),

    layout"docsslot"

end

end