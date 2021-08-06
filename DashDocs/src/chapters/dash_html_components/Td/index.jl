@doc_chapter "/dash_html_components/td" begin

    @layout html_div() do

        html_h1("html_td"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_td))

    end

end