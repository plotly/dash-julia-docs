@doc_chapter "/dash-html-components/content" begin

    @layout html_div() do

        html_h1("html_content"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_content))

    end

end


