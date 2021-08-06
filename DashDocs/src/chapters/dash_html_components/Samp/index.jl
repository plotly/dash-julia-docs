@doc_chapter "/dash_html_components/samp" begin

    @layout html_div() do

        html_h1("html_samp"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_samp))

    end

end