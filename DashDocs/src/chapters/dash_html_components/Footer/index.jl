@doc_chapter "/dash-html-components/footer" begin

    @layout html_div() do

        html_h1("html_footer"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_footer))

    end

end


