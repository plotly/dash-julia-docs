@doc_chapter "/dash_html_components/command" begin

    @layout html_div() do

        html_h1("html_command"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_command))

    end

end


