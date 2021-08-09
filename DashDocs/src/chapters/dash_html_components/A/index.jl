@doc_chapter "/dash-html-components/a" begin

    @layout html_div() do

        html_h1("html_a"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_a))

    end

end


