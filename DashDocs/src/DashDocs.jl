module DashDocs
using DashUserGuideComponents
using DashCoreComponents, DashHtmlComponents, Dash, DataFrames, CSV, UrlDownload, Pkg, PlotlyBase, PlotlyJS

include("utils/_utils.jl")
include("reusable_components/_reusable_components.jl")

include("chapters/whats_dash/index.jl")
include("chapters/installation/index.jl")
include("chapters/getting_started/index.jl")
include("chapters/basic_callbacks/index.jl")
include("chapters/graph_crossfiltering/index.jl")
include("chapters/sharing_data/index.jl")
include("chapters/faq_gotchas/index.jl")
include("chapters/dash_core_components/index.jl")
include("chapters/dash_html_components/index.jl")
include("chapters/dash_daq/index.jl")
include("chapters/dash_bio/index.jl")
include("chapters/dash_data_table/index.jl");
# include("chapters/dash_vtk/index.jl")
include("chapters/deployment/index.jl")
include("app/_app.jl")

@eval_toplevel

function make_app()
    app = base_app()
    app.layout = html_div() do
        html_div(id="wait-for-layout"),
        dcc_location(id="url", refresh=false),
        make_app_header(),
        html_div(
            className="content-wrapper",
            children=(
                html_div(
                    (
                        html_div(id="backlinks-top", className="backlinks"),
                        html_div(
                            html_div(id="chapter", className="content"), # the children of this component is the layout of a dash app, based on URL
                            className="content-container",
                            style=Dict("margin" => "70px")
                        ),
                        html_div(id="backlinks-bottom", className="backlinks")
                    ),
                    className="rhs-content container-width"
                ),
                dugc_pagemenu(id="pagemenu")
            )
        )
    end
    callback!(app,
        Output("chapter", "children"),
        Output("pagemenu", "dummy2"),
        Input("url", "pathname")) do pathname
            content = haskey(CHAPTERS, pathname) ?
                CHAPTERS[pathname]() :
                default_page()
            return content, ""
    end
    for example in values(EXAMPLES_REGISTRY)
        example.callbacks(app)
    end
    return app
end
end # module
