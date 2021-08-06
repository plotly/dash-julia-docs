@doc_chapter "/dash_html_components/pre" begin

    @layout html_div() do

        html_h1("html_pre"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_pre))

    end

end