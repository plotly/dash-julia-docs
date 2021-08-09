@doc_chapter "/dash-html-components/details" begin

    @layout html_div() do

        html_h1("html_details"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_details))

    end

end


