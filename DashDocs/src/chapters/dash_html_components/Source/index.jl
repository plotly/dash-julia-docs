@doc_chapter "/dash_html_components/source" begin

    @layout html_div() do

        html_h1("html_source"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_source))

    end

end