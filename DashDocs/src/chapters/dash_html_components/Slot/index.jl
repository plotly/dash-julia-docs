@doc_chapter "/dash-html-components/slot" begin

    @layout html_div() do

        html_h1("html_slot"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_slot))

    end

end