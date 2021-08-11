@doc_chapter "/dash-html-components/blockquote" begin

    @layout html_div() do

        html_h1("html_blockquote"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_blockquote))

    end

end


