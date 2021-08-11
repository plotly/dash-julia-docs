@doc_chapter "/dash-html-components/rt" begin

    @layout html_div() do

        html_h1("html_rt"),
        html_h3("Reference & Documentation"),
        
        dcc_markdown(string(@doc html_rt))

    end

end