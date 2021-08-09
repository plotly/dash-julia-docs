@doc_chapter "/dash-html-components/label" begin

    @layout html_div() do

        html_h1("html_label"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_label))

    end

end