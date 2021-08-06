@doc_chapter "/dash_html_components/iframe" begin

    @layout html_div() do

        html_h1("html_iframe"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_iframe))

    end

end