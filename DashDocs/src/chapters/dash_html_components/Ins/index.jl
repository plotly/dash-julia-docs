@doc_chapter "/dash-html-components/ins" begin

    @layout html_div() do

        html_h1("html_ins"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_ins))

    end

end