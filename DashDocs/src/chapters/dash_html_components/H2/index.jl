@doc_chapter "/dash_html_components/h2" begin

    @layout html_div() do

        html_h1("html_h2"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_h2))

    end

end