@doc_chapter "/dash-html-components/textarea" begin

    @layout html_div() do

        html_h1("html_textarea"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_textarea))

    end

end