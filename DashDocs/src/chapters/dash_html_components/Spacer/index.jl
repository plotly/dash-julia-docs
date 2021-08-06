@doc_chapter "/dash_html_components/spacer" begin

    @layout html_div() do

        html_h1("html_spacer"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_spacer))

    end

end