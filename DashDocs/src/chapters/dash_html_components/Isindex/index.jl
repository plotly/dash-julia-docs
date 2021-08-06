@doc_chapter "/dash_html_components/isindex" begin

    @layout html_div() do

        html_h1("html_isindex"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_isindex))

    end

end