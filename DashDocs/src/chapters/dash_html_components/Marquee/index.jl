@doc_chapter "/dash_html_components/marquee" begin

    @layout html_div() do

        html_h1("html_marquee"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_marquee))

    end

end