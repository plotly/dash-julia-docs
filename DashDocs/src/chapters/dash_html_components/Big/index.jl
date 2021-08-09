@doc_chapter "/dash-html-components/big" begin

    @layout html_div() do

        html_h1("html_big"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_big))

    end

end


