@doc_chapter "/dash-html-components/noscript" begin

    @layout html_div() do

        html_h1("html_noscript"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_noscript))

    end

end