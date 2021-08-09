@doc_chapter "/dash-html-components/data" begin

    @layout html_div() do

        html_h1("html_data"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_data))

    end

end


