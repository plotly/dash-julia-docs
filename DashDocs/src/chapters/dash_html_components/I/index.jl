@doc_chapter "/dash-html-components/i" begin

    @layout html_div() do

        html_h1("html_i"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_i))

    end

end