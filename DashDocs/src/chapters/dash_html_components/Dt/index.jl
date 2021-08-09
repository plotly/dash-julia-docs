@doc_chapter "/dash-html-components/dt" begin

    @layout html_div() do

        html_h1("html_dt"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_dt))

    end

end


