@doc_chapter "/dash_html_components/rb" begin

    @layout html_div() do

        html_h1("html_rb"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_rb))

    end

end