@doc_chapter "/dash-html-components/template" begin

    @layout html_div() do

        html_h1("html_template"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_template))

    end

end