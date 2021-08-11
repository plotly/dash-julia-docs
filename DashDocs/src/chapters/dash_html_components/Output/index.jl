@doc_chapter "/dash-html-components/output" begin

    @layout html_div() do

        html_h1("html_output"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_output))

    end

end