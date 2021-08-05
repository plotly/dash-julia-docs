@doc_chapter "/dash_html_components/sup" begin

    @layout html_div() do

        html_h1("html_sup"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_sup))

    end

end