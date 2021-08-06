@doc_chapter "/dash_html_components/frame" begin

    @layout html_div() do

        html_h1("html_frame"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_frame))

    end

end