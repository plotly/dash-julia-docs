@doc_chapter "/dash_html_components/h6" begin

    @layout html_div() do

        html_h1("html_h6"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_h6))

    end

end