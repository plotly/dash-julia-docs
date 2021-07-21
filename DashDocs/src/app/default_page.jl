function default_page()
    html_div() do
        html_br(),
        html_h1("Dash for Julia User Guide"),
        Section(
            "What's Dash?",
            (
                Chapter(
                    "Introduction",
                    "/introduction",
                    "A quick paragraph about Dash and a link to the talk at Plotcon that started it all."
                ),
                Chapter(
                    "Announcement Essay",
                    "https://medium.com/plotly/announcing-dash-for-julia-f017c90c6ef1",
                    "Our extended essay on Dash. An extended discussion of Dash's architecture and our motivation behind the project."
                ),
                Chapter(
                    "Dash App Gallery",
                    "https://dash.plotly.com/gallery",
                    "A glimpse into what's possible with Dash."
                ),
                Chapter(
                    "Dash Club",
                    "https://plot.us12.list-manage.com/subscribe?u=28d7f8f0685d044fb51f0d4ee&id=0c1cb734d7",
                    "A fortnightly email newsletter by chriddyp, the creator of Dash."
                )
            )
        ),
        Section(
        "Dash Tutorial",
        (
            Chapter(
                "Part 1. Installation",
                "/installation",
                "How to install and upgrade Dash libraries with the Pkg package manager."
            ),
            Chapter(
                "Part 2. The Dash Layout",
                "/getting-started",
                "The Dash `layout` describes what your app will look like and is composed of a set of declarative Dash components."
            ),
            Chapter(
                "Part 3. Basic Callbacks",
                "/basic-callbacks",
                "Dash apps are made interactive through Dash Callbacks:
                Julia functions that are automatically called whenever an input component's property changes. Callbacks can be chained,
                allowing one update in the UI to trigger several updates across the app."
            ),
            Chapter(
                "Part 4. Interactive Graphing and Crossfiltering",
                "/interactive-graphing",
                "Bind interactivity to the Dash `Graph` component whenever you hover, click, or
                select points on your chart."
            ),
            Chapter(
                "Part 5. Sharing Data Between Callbacks",
                "/sharing-data-between-callbacks",
                "`global` variables will break your Dash apps. However, there are other ways
                to share data between callbacks. This chapter is useful for callbacks that
                run expensive data processing tasks or process large data."
            ),
            Chapter(
                "Part 6. FAQs and Gotchas",
                "/faqs",
                "If you have read through the rest of the tutorial and still have questions
                or are encountering unexpected behaviour, this chapter may be useful."
                )
            )
        ),

        Section(
            "Open Source Component Libraries",
            (
                Chapter(
                    "Dash Core Components",
                    "/dash_core_components",
                    "The Dash Core Component library contains a set of higher-level components like sliders, graphs, dropdowns, tables, and more."
                ),
                Chapter(
                    "Dash HTML Components",
                    "/dash_html_components",
                    "The Dash HTML Components library contains a set of components like button, div, form and more."
                ),
                Chapter(
                    "Dash DAQ",
                    "/dash_daq",
                    "The Dash DAQ library contains a set of higher-level components like boolean switch, color picker, gauge and more."
                ),
                Chapter(
                    "Dash VTK",
                    "/dash_vtk",
                    "Dash VTK enables its user to use VTK on the server side for any data processing and provides the infrastructure to push the visualization to the client side for a better experience."
                ),
                Chapter(
                            "Dash Bio",
                            "/dash_bio",
                            "The Dash Bio library contains a set of higher-level components like alignment chart, circos, clustergram and more."
                        )
            )
        ),
        Section(
            "Production",
            (
                Chapter(
                    "Deployment",
                    "/deployment",
                    ""
                )
            )
        )
    end
end