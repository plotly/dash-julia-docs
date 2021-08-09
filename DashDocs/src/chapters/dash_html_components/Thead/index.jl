@doc_chapter "/dash-html-components/thead" begin

    @layout html_div() do

        html_h1("html_thead"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_thead))

    end

end