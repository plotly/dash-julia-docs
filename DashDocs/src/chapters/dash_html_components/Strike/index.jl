@doc_chapter "/dash_html_components/strike" begin

    @layout html_div() do

        html_h1("html_strike"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_strike))

    end

end