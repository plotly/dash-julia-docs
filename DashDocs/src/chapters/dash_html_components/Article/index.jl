@doc_chapter "/dash-html-components/article" begin

    @layout html_div() do

        html_h1("html_article"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_article))

    end

end


