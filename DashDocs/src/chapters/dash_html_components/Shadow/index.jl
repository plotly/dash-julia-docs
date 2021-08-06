@doc_chapter "/dash_html_components/shadow" begin

    @layout html_div() do

        html_h1("html_shadow"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_shadow))

    end

end