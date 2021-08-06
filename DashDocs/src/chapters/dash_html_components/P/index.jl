@doc_chapter "/dash_html_components/p" begin

    @layout html_div() do

        html_h1("html_p"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_p))

    end

end