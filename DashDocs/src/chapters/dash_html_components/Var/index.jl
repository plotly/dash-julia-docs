@doc_chapter "/dash_html_components/var" begin

    @layout html_div() do

        html_h1("html_var"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_var))

    end

end