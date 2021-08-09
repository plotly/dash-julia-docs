@doc_chapter "/dash-html-components/h5" begin

    @layout html_div() do

        html_h1("html_h5"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_h5))

    end

end