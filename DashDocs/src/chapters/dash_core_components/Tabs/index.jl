@doc_chapter "/dash_core_components/tabs" begin

    @example method1 "method1.jl"
    @example method2 "method2.jl"
    @example styling_tabs "styling_tabs.jl"
    @example styling_tabs_inline "styling_tabs_inline.jl"
  
    @layout html_div() do

    html_h1("Tabs Examples and Reference"),

    dcc_markdown("The `dcc_tabs()` and `dcc_tab()` components can be used to create tabbed sections in your app. 
    The `dcc_tab()` component controls the style and value of the individual tab and the `dcc_tabs()` component holds a 
    collection of `dcc_tab()` components"),

    html_h3("Method 1. Content as Callback"),

    dcc_markdown("Attach a callback to the Tabs `value` prop and update a container's `children` property in your callback."),

    source"method1",
    layout"method1",

    html_h3("Method 2. Content as Tab Children"),

    dcc_markdown("Instead of displaying the content through a callback, 
    you can embed the content directly as the `children` property in the Tab component:"),

    source"method2",
    layout"method2",

    dcc_markdown("Note that this method has a drawback: it requires that you compute the 
    children property for each individual tab upfront and send all of the tab's content over 
    the network *at once*. The callback method allows ,you to compute the tab's content on the fly 
    (that is, when the tab is clicked)."),

    html_h3("Styling the Tabs component with CSS classes"),

    dcc_markdown("Styling the Tabs (and Tab) component can either be done using CSS classes by 
    providing your own to the `className` property:"),

    source"styling_tabs",
    layout"styling_tabs",

    dcc_markdown("""
    Notice how the container of the Tabs can be styled as well by supplying a class to the `parent_className` prop, 
    which we use here to draw a border below it, positioning the actual Tabs (with padding) more in the center. 
    We also added `display: flex` and `justify-content: center` to the regular Tab components, so that labels with multiple 
    lines will not break the flow of the text.
    The corresponding CSS file (`assets/tabs.css`) looks like this. Save the file in an `assets` folder (it can 
    be named anything you want). Dash will automatically include this CSS when the app is loaded."""),

    dcc_markdown("""
        ```css
        .custom-tabs-container {
            width: 85%;
        }
        .custom-tabs {
            border-top-left-radius: 3px;
            background-color: #f9f9f9;
            padding: 0px 24px;
            border-bottom: 1px solid #d6d6d6;
        }
        
        .custom-tab {
            color:#586069;
            border-top-left-radius: 3px;
            border-top-right-radius: 3px;
            border-top: 3px solid transparent !important;
            border-left: 0px !important;
            border-right: 0px !important;
            border-bottom: 0px !important;
            background-color: #fafbfc;
            padding: 12px !important;
            font-family: "system-ui";
            display: flex !important;
            align-items: center;
            justify-content: center;
        }
        .custom-tab--selected {
            color: black;
            box-shadow: 1px 1px 0px white;
            border-left: 1px solid lightgrey !important;
            border-right: 1px solid lightgrey !important;
            border-top: 3px solid #e36209 !important;
        }
        ```
    """),

    html_h3("Styling Tabs with Inline Styles"),

    html_div("An alternative to providing CSS classes is to provide style dictionaries directly:"),

    source"styling_tabs_inline",
    layout"styling_tabs_inline"


end

end