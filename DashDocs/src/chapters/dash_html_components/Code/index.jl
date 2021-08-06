@doc_chapter "/dash_html_components/code" begin

    @layout html_div() do

        html_h1("html_code"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_code))

    end

end


