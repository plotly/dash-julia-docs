@doc_chapter "/dash_html_components/tfoot" begin

    @layout html_div() do

        html_h1("html_tfoot"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_tfoot))

    end

end