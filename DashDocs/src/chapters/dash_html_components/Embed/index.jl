@doc_chapter "/dash-html-components/embed" begin

    @layout html_div() do

        html_h1("html_embed"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_embed))

    end

end


