@doc_chapter "/dash-html-components/aside" begin

    @layout html_div() do

        html_h1("html_aside"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_aside))

    end


end


