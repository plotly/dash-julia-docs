@doc_chapter "/dash_html_components/main" begin

    @layout html_div() do

        html_h1("html_main"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_main))

    end

end