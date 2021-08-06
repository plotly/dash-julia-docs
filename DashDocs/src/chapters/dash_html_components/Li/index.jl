@doc_chapter "/dash_html_components/li" begin

    @layout html_div() do

        html_h1("html_li"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_li))

    end

end