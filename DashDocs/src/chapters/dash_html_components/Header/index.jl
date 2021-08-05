@doc_chapter "/dash_html_components/header" begin

    @layout html_div() do

        html_h1("html_header"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_header))

    end

end