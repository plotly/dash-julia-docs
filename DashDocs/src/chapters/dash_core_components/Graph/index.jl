@doc_chapter "/dash_core_components/graph" begin

  @example express_graph "express_graph.jl"
  @example figure_graph "figure_graph.jl"

  @layout html_div() do

    html_h1("Graph Examples and Reference"),

    dcc_markdown("
      The `dcc_graph` component can be used to render any plotly-powered
       data visualization, passed as the figure argument.
    "),

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

    html_h5("Plotly Express in Dash")

    dcc_markdown("
      The `fig` object is passed directly into the figure property of `dcc_graph`:
    "),


    source"express_graph",
    layout"express_graph",

    html_h5("Using the Low-Level Interface with Dicts & Lists"),

    dcc_markdown("Read through (1) above to learn more about the difference between fig and dicts & lists.")
    source"figure_graph",
    layout"figure_graph",

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

    dcc_markdown("""
    Access this documentation in your Python terminal with:
```
help?> dcc_graph
Our recommended IDE for writing Dash apps is Dash Enterprise's Data Science Workspaces, which has typeahead support for Dash [Component Properties](https://plotly.com/dash/workspaces/). Find out if your company is using [Dash Enterprise](https://go.plotly.com/company-lookup).
```
`id` (string; optional): The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.

`animate` (Boolean; default false): Beta: If true`true`, animate between updates using plotly.js's animate function.

`animation_options` (Dict; default Dict( frame: Dict( redraw: `false`, ), transition: Dict( duration: 750, ease: 'cubic-in-out', ),)): Beta: Object containing animation settings. Only applies if animate is true`true`.

`className` (string; optional): className of the parent div.

`clear_on_unhover` (Boolean; default `false`): If true`true`, clear_on_unhover will clear the hoverData property when the user "unhovers" from a point. If `false`, then the hoverData property will be equal to the data from the last point that was hovered over.

`clickAnnotationData` (Dict; optional): Data from latest click annotation event. Read-only.

`clickData` (Dict; optional): Data from latest click event. Read-only.

`config` (Dict; optional): Plotly.js config options. See [https://plotly.com/javascript/configuration-options/](https://plotly.com/javascript/configuration-options/) for more info

`config` is a Dict with keys:
* `autosizable` (Boolean; optional): DO autosize once regardless of layout.autosize (use default width or height values otherwise). 
* `displayModeBar` (a value equal to: `true`, `false`, 'hover'; optional): Display the mode bar (`true`, `false`, or 'hover').
* `displaylogo` (Boolean; optional): Add the plotly logo on the end of the mode bar. 
* `doubleClick` (a value equal to: `false`, 'reset', 'autosize', 'reset+autosize'; optional): Double click interaction (`false`, 'reset', 'autosize' or 'reset+autosize'). 
* `doubleClickDelay` (number; optional): Delay for registering a double-click event in ms. The minimum value is 100 and the maximum value is 1000. By default this is 300. 
* `editable` (Boolean; optional): We can edit titles, move annotations, etc - sets all pieces of edits unless a separate edits config item overrides individual parts. 
* `edits` (Dict; optional): A set of editable properties. 
* `edits` is a Dict with keys: 
    * `annotationPosition` (Boolean; optional): The main anchor of the annotation, which is the text (if no arrow) or the arrow (which drags the whole thing leaving the arrow length & direction unchanged). 
    * `annotationTail` (Boolean; optional): Just for annotations with arrows, change the length and direction of the arrow. 
    * `annotationText` (Boolean; optional) 
    * `axisTitleText` (Boolean; optional) 
    * `colorbarPosition` (Boolean; optional) 
    * `colorbarTitleText` (Boolean; optional) 
    * `legendPosition` (Boolean; optional) 
    * `legendText` (Boolean; optional): Edit the trace name fields from the legend. 
    * `shapePosition` (Boolean; optional) 
    * `titleText` (Boolean; optional): The global layout.title. 
* `fillFrame` (Boolean; optional): If we DO autosize, do we fill the container or the screen. 
* `frameMargins` (number; optional): If we DO autosize, set the frame margins in percents of plot size. 
* `linkText` (string; optional): Text appearing in the sendData link. 
* `locale` (string; optional): The locale to use. Locales may be provided with the plot (locales below) or by loading them on the page, see: [https://github.com/plotly/plotly.js/blob/master/dist/README.md#to-include-localization](https://github.com/plotly/plotly.js/blob/master/dist/README.md#to-include-localization). 
* `locales` (Dict; optional): Localization definitions, if you choose to provide them with the plot rather than registering them globally. 
* `mapboxAccessToken` (Boolean | number | string | Dict | list; optional): Mapbox access token (required to plot mapbox trace types) If using an Mapbox Atlas server, set this option to '', so that plotly.js won't attempt to authenticate to the public Mapbox server. 
* `modeBarButtons` (Boolean | number | string | Dict | list; optional): Fully custom mode bar buttons as nested array, where the outer arrays represents button groups, and the inner arrays have buttons config objects or names of default buttons. 
* `modeBarButtonsToAdd` (list; optional): Add mode bar button using config objects. 
* `modeBarButtonsToRemove` (list; optional): Remove mode bar button by name. All modebar button names at [https://github.com/plotly/plotly.js/blob/master/src/components/modebar/buttons.js](https://github.com/plotly/plotly.js/blob/master/src/components/modebar/buttons.js). Common names include: sendDataToCloud; (2D) zoom2d, pan2d, select2d, lasso2d, zoomIn2d, zoomOut2d, autoScale2d, resetScale2d; (Cartesian) hoverClosestCartesian, hoverCompareCartesian; (3D) zoom3d, pan3d, orbitRotation, tableRotation, handleDrag3d, resetCameraDefault3d, resetCameraLastSave3d, hoverClosest3d; (Geo) zoomInGeo, zoomOutGeo, resetGeo, hoverClosestGeo; hoverClosestGl2d, hoverClosestPie, toggleHover, resetViews. 
* `plotGlPixelRatio` (number; optional): Increase the pixel ratio for Gl plot images. 
* `plotlyServerURL` (string; optional): Base URL for a Plotly cloud instance, if showSendToCloud is enabled. 
* `queueLength` (number; optional): Set the length of the undo/redo queue. 
* `responsive` (Boolean; optional): Whether to change layout size when the window size changes. 
* `scrollZoom` (Boolean; optional): Mousewheel or two-finger scroll zooms the plot. 
* `sendData` (Boolean; optional): If we show a link, does it contain data or just link to a plotly file?. 
* `showAxisDragHandles` (Boolean; optional): Enable axis pan/zoom drag handles. 
* `showAxisRangeEntryBoxes` (Boolean; optional): Enable direct range entry at the pan/zoom drag points (drag handles must be enabled above). 
* `showEditInChartStudio` (Boolean; optional): Should we show a modebar button to send this data to a Plotly Chart Studio plot. If both this and showSendToCloud are selected, only showEditInChartStudio will be honored. By default this is `false`. 
* `showLink` (Boolean; optional): Link to open this plot in plotly. 
* `showSendToCloud` (Boolean; optional): Should we include a modebar button to send this data to a Plotly Cloud instance, linked by plotlyServerURL. By default this is `false`. 
* `showTips` (Boolean; optional): New users see some hints about interactivity. 
* `staticPlot` (Boolean; optional): No interactivity, for export or image generation. 
* `toImageButtonOptions` (Dict; optional): Modifications to how the toImage modebar button works. 
* `toImageButtonOptions` is a Dict with keys: 
    * `filename` (string; optional): The name given to the downloaded file. 
    * `format` (a value equal to: 'jpeg', 'png', 'webp', 'svg'; optional): The file format to create. 
    * `height` (number; optional): Height of the downloaded file, in px.
    *  `scale` (number; optional): Extra resolution to give the file after rendering it with the given width and height. 
    * `width` (number; optional): Width of the downloaded file, in px. 
* `topojsonURL` (string; optional): URL to topojson files used in geo charts. 
* `watermark` (Boolean; optional): Add the plotly logo even with no modebar.

`extendData` (list | Dict; optional): Data that should be appended to existing traces. Has the form `[updateData, traceIndices, maxPoints]`, where updateData is an object containing the data to extend, traceIndices (optional) is an array of trace indices that should be extended, and maxPoints (optional) is either an integer defining the maximum number of points allowed or an object with key:value pairs matching updateData Reference the Plotly.extendTraces API for full usage: [https://plotly.com/javascript/plotlyjs-function-reference/#plotlyextendtraces](https://plotly.com/javascript/plotlyjs-function-reference/#plotlyextendtraces).

`figure` (Dict; default Dict( data: [], `layout`: Dict(), frames: [],)): Plotly figure object. See schema: [https://plotly.com/javascript/reference ](https://plotly.com/javascript/reference )config is set separately by the config property.

`figure` is a Dict with keys:

* `data` (list of Dicts; optional) 
* `frames` (list of Dicts; optional) 
* `layout` (Dict; optional)

`hoverData` (Dict; optional): Data from latest hover event. Read-only.

`loading_state` (Dict; optional): Object that holds the loading state object coming from dash-renderer.

`loading_state` is a Dict with keys:

* `component_name` (string; optional): Holds the name of the component that is loading. 
* `is_loading` (Boolean; optional): Determines if the component is loading or not. 
* `prop_name` (string; optional): Holds which property is loading.

`prependData` (list | Dict; optional): Data that should be prepended to existing traces. Has the form `[updateData, traceIndices, maxPoints]`, where updateData is an object containing the data to prepend, traceIndices (optional) is an array of trace indices that should be prepended, and maxPoints (optional) is either an integer defining the maximum number of points allowed or an object with key:value pairs matching updateData Reference the Plotly.prependTraces API for full usage: [https://plotly.com/javascript/plotlyjs-function-reference/#plotlyprependtraces](https://plotly.com/javascript/plotlyjs-function-reference/#plotlyprependtraces).

`relayoutData` (Dict; optional): Data from latest relayout event which occurs when the user zooms or pans on the plot or other layout-level edits. Has the form `Dict(<attr string> => <value>)` describing the changes made. Read-only.

`responsive` (a value equal to: `true`, `false`, 'auto'; default 'auto'): If `true`, the Plotly.js plot will be fully responsive to window resize and parent element resize event. This is achieved by overriding config.responsive to `true`, figure.layout.autosize to `true` and unsetting figure.layout.height and figure.layout.width. If `false`, the Plotly.js plot not be responsive to window resize and parent element resize event. This is achieved by overriding config.responsive to `false` and figure.layout.autosize to `false`. If 'auto' (default), the Graph will determine if the Plotly.js plot can be made fully responsive (`true`) or not (`false`) based on the values in config.responsive, figure.layout.autosize, figure.layout.height, figure.layout.width. This is the legacy behavior of the Graph component. Needs to be combined with appropriate dimension / styling through the style prop to fully take effect.

`restyleData` (List; optional): Data from latest restyle event which occurs when the user toggles a legend item, changes parcoords selections, or other trace-level edits. Has the form `[edits, indices]`, where edits is an object `Dict(attr string>: <value>)` describing the changes made, and indices is an array of trace indices that were edited. Read-only.

`selectedData` (Dict; optional): Data from latest select event. Read-only.

`style` (Dict; optional): Generic style overrides on the plot div.
    """)
end
    


end

