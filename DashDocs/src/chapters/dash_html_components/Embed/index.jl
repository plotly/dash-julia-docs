@doc_chapter "/dash_html_components/embed" begin

    @layout html_div() do

        html_h1("html_element"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_embed))

    end

end


