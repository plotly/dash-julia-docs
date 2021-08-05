@doc_chapter "/dash_html_components/small" begin

    @layout html_div() do

        html_h1("html_small"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_small))

    end

end