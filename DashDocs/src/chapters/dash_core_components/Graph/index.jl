@doc_chapter "/dash_core_components/graph" begin

  @example express_graph "express_graph.jl"
  @example figure_graph "figure_graph.jl"

  @layout html_div() do

    html_h1("Graph Examples and Reference"),

    dcc_markdown("""
      The `dcc_graph` component can be used to render any plotly-powered
       data visualization, passed as the figure argument.
    """),

    html_h3("Primer on Plotly Graphing Library"),

    dcc_markdown(
      "
      * The Plotly Graphing Library, known as the package package plotly, generates 'figures'.
      These are used in `dcc_graph` with e.g. dcc_graph(figure=fig) with fig a plotly figure.
      * Plotly supports 40-50 different chart types. Learn more by navigating https://plot.ly/julia/
      * In development, you can create figures by running Dash apps or in other environments like Jupyter,
       your console, and more. If you are using the interface outside of Dash, then calling `fig` will always
        display the graph (either in your browser or inline directly in your environment). To see all of these
         rendering environments, see https://plot.ly/julia/renderers/."
    ),

    html_h3("Examples"),

    dcc_markdown("
      The `fig` object is passed directly into the figure property of `dcc_graph`:
    "),


    source"express_graph",
    layout"express_graph",

    dcc_markdown("
    ### Interactive Graphing with Callbacks
    The **Interactive Visualizations** tutorial explains how to capture user interaction events with a dcc.Graph, and how to update the figure property in callbacks.

    Some advanced features are documented in **community forum** posts:

    How to preserve the UI state (zoom level etc.) of a Graph when updating the Graph in a callback **[https://community.plot.ly/t/preserving-ui-state-like-zoom-in-dcc-graph-with-uirevision/15793](https://community.plot.ly/t/preserving-ui-state-like-zoom-in-dcc-graph-with-uirevision/15793)**
    Graph transitions for smooth transitions or animations on Graph updates **[https://community.plot.ly/t/exploring-a-transitions-api-for-dcc-graph/15468](https://community.plot.ly/t/exploring-a-transitions-api-for-dcc-graph/15468)**
    "),

    html_h5("Controlling the Plotly.js Version Used by `dcc_graph`"),

    dcc_markdown("
      The `Graph` component leverages the [Plotly.js]((https://plotly.com/javascript/)) library to render visualizations. The Graph component comes with its own version of the Plotly.js library, but this can be overridden by placing a Plotly.js bundle in [the assets directory](https://dash.plotly.com/external-resources).
    "),

    dcc_markdown(
      "
      This technique can be used to:
      * take advantage of new features in a version of Plotly.js that is more recent than the one that is included in the currently-installed version of `DashCoreComponents.jl`.
      * take advantage of more desirable behaviour of a version of Plotly.js that is less recent than the one that is included in the currently-installed version of `DashCoreComponents.jl`. Note that this situation should be rare and short-lived, as we strive to make more-recent Plotly.js versions totally backwards-compatible with older versions!
      * use a Plotly-distributed Plotly.js partial bundle or a custom-built Plotly.js bundle which only includes the subset of Plotly.js features that your Dash app uses. Such bundles are smaller than the full Plotly.js bundles that come with the Graph component and can therefore improve your app's loading time.
      "
    ),

    html_h5("Rendering LaTeX inside dcc_graph Figures"),

    dcc_markdown("""
    To use the built-in Plotly.js capability of rendering LaTeX inside figure labels, the [external_script](https://dash.plotly.com/external-resources) functionality can be used: add `external_scripts=["https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/MathJax.js?config=TeX-MML-AM_CHTML" ]` to the `app = dash()` call.
    """),

    html_h5("Graph Resizing and Responsiveness"),

    dcc_markdown("""
    There are quite a few options that you can take advantage of if you want the size of your graph to be reactive.

      The default `plotly.js` behavior dictates that the graph should resize upon window resize. However, in some cases, you might want to resize the graph based on the size of its parent container instead. (You can set the size of the parent container with the `style.height` and `style.width` properties.)

      The responsive property of the dcc_graph component allows you to define your desired behavior. In short, it accepts as a value `true`, `false`, or `auto`

      * `true` forces the graph to be responsive to window and parent resize, regardless of any other specifications in `figure.layout` or `config`
      * `false` forces the graph to be non-responsive to window and parent resize, regardless of any other specifications in figure.layout or config
      * `auto` preserves the legacy behavior (size and resizability are determined by values specified in figure.layout and config.responsive)
    """),

    html_h5("How Resizing Works - Advanced"),

    dcc_markdown("""
      The properties of dcc.Graph that can control the size of the graph (other than responsive) are:

      * `figure.layout.height` - explicitly sets the height
      * `figure.layout.width` - explicitly sets the width
      * `figure.layout.autosize` - if True, sets the height and width of the graph to that of its parent container
      * `config.responsive` - if True, changes the height and width of the graph upon window resize

      The responsive property works in conjunction with the above properties in the following way:

      * `true`: config.responsive and figure.layout.autosize are overridden with true values, and figure.layout.height and figure.layout.width are unset
      * `false`: config.responsive and figure.layout.autosize are both overridden with false values
      * `auto`: the resizability of the plot is determined the same way as it used to be (i.e., with the four properties above)
    """),
    html_h5("Graph Properties"),



    dcc_markdown("""Access this documentation in Julia with:
```
help?> dcc_graph
```

Our recommended IDE for writing Dash apps is Dash Enterprise's Data Science Workspaces, which has typeahead support for Dash [Component Properties](https://plotly.com/dash/workspaces/). Find out if your company is using [Dash Enterprise](https://go.plotly.com/company-lookup).
"""),
    dcc_markdown(string(@doc dcc_graph))
end



end
