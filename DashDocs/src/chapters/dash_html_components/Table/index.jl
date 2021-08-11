@doc_chapter "/dash-html-components/table" begin

    @layout html_div() do

        html_h1("html_table"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_table))

    end

end