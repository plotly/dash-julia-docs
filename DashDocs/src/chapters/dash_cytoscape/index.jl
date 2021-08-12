# include("BooleanSwitch/index.jl");
@doc_chapter "/cytoscape" begin


# @example booleanswitch_index_example "booleanswitch_index_example.jl"


    @layout html_div() do
        html_h1("Dash Cytoscape"),

        html_blockquote([
            dcc_markdown("""
                Released on February 5th, 2019**

                Dash Cytoscape is a graph visualization component for creating easily customizable, high-performance, interactive, and web-based networks. It extends and renders [Cytoscape.js](https://js.cytoscape.org/), and offers deep integration with Dash layouts and callbacks, enabling the creation of powerful networks in conjunction with the rich collection of Dash components, as well as established computational biology and network science libraries such as Biopython and networkX.
                
                -- xhlulu and the Dash Team
            """)
        ]),

        html_h3("Quickstart"),
        dcc_markdown("""
            ```Julia
                julia>using Pkg
                julia>Pkg.add(url="https://github.com/plotly/dash-cytoscape", rev="master")
            ```
        """)       
                    
        # html_a(html_h3("BooleanSwitch"), href="/dash-daq/booleanswitch"),

    end

end