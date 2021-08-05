@doc_chapter "/dash_html_components/cite" begin

    @layout html_div() do

        html_h1("html_cite"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_cite))

    end

end


