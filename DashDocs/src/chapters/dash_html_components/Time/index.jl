@doc_chapter "/dash_html_components/time" begin

    @layout html_div() do

        html_h1("html_time"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_time))

    end

end