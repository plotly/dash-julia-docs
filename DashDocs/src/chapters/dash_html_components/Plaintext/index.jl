@doc_chapter "/dash-html-components/plaintext" begin

    @layout html_div() do

        html_h1("html_plaintext"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_plaintext))

    end

end