@doc_chapter "/dash_html_components/nav" begin

    @layout html_div() do

        html_h1("html_nav"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_nav))

    end

end