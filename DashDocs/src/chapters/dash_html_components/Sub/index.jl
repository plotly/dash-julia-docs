@doc_chapter "/dash_html_components/sub" begin

    @layout html_div() do

        html_h1("html_sub"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_sub))

    end

end