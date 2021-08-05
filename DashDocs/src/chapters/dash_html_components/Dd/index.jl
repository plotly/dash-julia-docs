@doc_chapter "/dash_html_components/dd" begin

    @layout html_div() do

        html_h1("html_dd"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_dd))

    end

end


