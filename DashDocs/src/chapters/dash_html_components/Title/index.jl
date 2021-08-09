@doc_chapter "/dash-html-components/title" begin

    @layout html_div() do

        html_h1("html_title"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_title))

    end

end