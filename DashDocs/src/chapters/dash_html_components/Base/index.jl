@doc_chapter "/dash_html_components/base" begin

    @layout html_div() do

        html_h1("html_base"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_base))

    end

end


