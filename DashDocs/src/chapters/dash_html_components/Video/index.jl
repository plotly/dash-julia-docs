@doc_chapter "/dash_html_components/video" begin

    @layout html_div() do

        html_h1("html_video"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_video))

    end

end