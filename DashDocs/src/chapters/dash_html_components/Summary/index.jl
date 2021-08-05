@doc_chapter "/dash_html_components/summary" begin

    @layout html_div() do

        html_h1("html_summary"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_summary))

    end

end