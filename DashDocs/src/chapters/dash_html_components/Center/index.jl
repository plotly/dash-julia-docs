@doc_chapter "/dash_html_components/center" begin

    @layout html_div() do

        html_h1("html_center"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_center))

    end
end


