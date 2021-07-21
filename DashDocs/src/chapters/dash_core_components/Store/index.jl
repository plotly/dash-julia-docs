@doc_chapter "/dash_core_components/store" begin

    @example store_clicks "store_clicks.jl"
    # @example store_callbacks "store_callbacks.jl"
  
    @layout html_div() do

    html_h1("dcc_store"),

    source"store_clicks",
    layout"store_clicks"    

end

end