@doc_chapter "/dash-html-components/s" begin

    @layout html_div() do

        html_h1("html_s"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_s))

    end

end