@doc_chapter "/dash_html_components/section" begin

    @layout html_div() do

        html_h1("html_section"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_section))

    end

end