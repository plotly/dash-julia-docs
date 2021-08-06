@doc_chapter "/dash_html_components/hgroup" begin

    @layout html_div() do

        html_h1("html_hgroup"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_hgroup))

    end

end