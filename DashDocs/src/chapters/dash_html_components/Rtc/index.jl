@doc_chapter "/dash_html_components/rtc" begin

    @layout html_div() do

        html_h1("html_rtc"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_rtc))

    end

end