@doc_chapter "/dash_html_components/mapel" begin

    @layout html_div() do

        html_h1("html_mapel"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_mapel))

    end

end