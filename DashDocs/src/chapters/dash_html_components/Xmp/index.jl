@doc_chapter "/dash_html_components/xmp" begin

    @layout html_div() do

        html_h1("html_xmp"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_xmp))

    end

end