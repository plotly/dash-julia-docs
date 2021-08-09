@doc_chapter "/dash-html-components/script" begin

    @layout html_div() do

        html_h1("html_script"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_script))

    end

end