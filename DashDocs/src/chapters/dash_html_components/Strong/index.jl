@doc_chapter "/dash-html-components/strong" begin

    @layout html_div() do

        html_h1("html_strong"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_strong))

    end

end