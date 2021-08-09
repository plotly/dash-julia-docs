@doc_chapter "/dash-html-components/element" begin

    @layout html_div() do

        html_h1("html_element"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_element))

    end

end


