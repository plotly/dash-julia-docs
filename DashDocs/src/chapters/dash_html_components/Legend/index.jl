@doc_chapter "/dash-html-components/legend" begin

    @layout html_div() do

        html_h1("html_legend"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_legend))

    end

end