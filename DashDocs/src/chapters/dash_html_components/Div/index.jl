@doc_chapter "/dash-html-components/div" begin

    @layout html_div() do

        html_h1("html_div"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_div))

    end

end


