@doc_chapter "/dash_html_components/ruby" begin

    @layout html_div() do

        html_h1("html_ruby"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_ruby))

    end

end