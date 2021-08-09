@doc_chapter "/dash-html-components/hr" begin

    @layout html_div() do

        html_h1("html_hr"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_hr))

    end

end