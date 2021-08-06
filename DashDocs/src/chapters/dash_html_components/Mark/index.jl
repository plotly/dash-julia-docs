@doc_chapter "/dash_html_components/mark" begin

    @layout html_div() do

        html_h1("html_mark"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_mark))

    end

end