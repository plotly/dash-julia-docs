@doc_chapter "/dash-html-components/rb" begin

    @layout html_div() do

        html_h1("html_rb"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_rb))

    end

end