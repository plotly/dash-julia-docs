@doc_chapter "/dash-html-components/rp" begin

    @layout html_div() do

        html_h1("html_rp"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_rp))

    end

end