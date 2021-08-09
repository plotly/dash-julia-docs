@doc_chapter "/dash-html-components/th" begin

    @layout html_div() do

        html_h1("html_th"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_th))

    end

end