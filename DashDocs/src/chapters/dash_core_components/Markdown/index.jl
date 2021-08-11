@doc_chapter "/dash-core-components/markdown" begin

    @example headers "headers.jl"
    @example emphasis "emphasis.jl"
    @example block "block.jl"
    @example lists "lists.jl"
    @example links "links.jl"
    @example inline "inline.jl"
  
    @layout html_div() do

    html_h1("Markdown Examples and Reference"),

    html_h3("Headers"),

    source"headers",
    layout"headers",

    html_h3("Emphasis"),

    source"emphasis",
    layout"emphasis",

    html_h3("Lists"),

    source"lists",
    layout"lists",

    html_h3("Block Quotes"),

    source"block",
    layout"block",

    html_h3("Links"),

    source"links",
    layout"links",

    html_h3("Inline Code"),

    source"inline",
    layout"inline",

    html_h3("dcc_markdown Reference"),
    dcc_markdown("""
        ```
            Access this documentation in your Julia REPL with:

            ?help dcc_markdown

            Our recommended IDE for writing Dash apps is Dash Enterprise's Data Science Workspaces, which has typeahead support for Dash Component Properties. Find out if your company is using Dash Enterprise.
        ```
    """),
    dcc_markdown(string(@doc dcc_markdown)) 

end

end