@doc_chapter "/dash-html-components/img" begin

    @layout html_div() do

        html_h1("html_img"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_img))

    end

end