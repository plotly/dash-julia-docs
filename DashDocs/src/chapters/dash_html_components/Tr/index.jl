@doc_chapter "/dash_html_components/tr" begin

    @layout html_div() do

        html_h1("html_tr"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_tr))

    end

end