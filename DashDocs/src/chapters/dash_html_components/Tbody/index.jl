@doc_chapter "/dash_html_components/tbody" begin

    @layout html_div() do

        html_h1("html_tbody"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_tbody))

    end

end