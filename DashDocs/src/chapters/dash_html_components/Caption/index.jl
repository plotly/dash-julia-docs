@doc_chapter "/dash-html-components/caption" begin

    @layout html_div() do

        html_h1("html_caption"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_caption))

    end

end


