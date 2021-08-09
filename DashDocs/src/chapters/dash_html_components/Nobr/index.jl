@doc_chapter "/dash-html-components/nobr" begin

    @layout html_div() do

        html_h1("html_nobr"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_nobr))

    end

end