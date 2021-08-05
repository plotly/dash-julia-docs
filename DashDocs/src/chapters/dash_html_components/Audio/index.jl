@doc_chapter "/dash_html_components/audio" begin

    @layout html_div() do

        html_h1("html_aside"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_audio))

    end

end


