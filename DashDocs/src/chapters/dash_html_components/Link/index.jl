@doc_chapter "/dash_html_components/link" begin

    @layout html_div() do

        html_h1("html_link"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_link))

    end

end