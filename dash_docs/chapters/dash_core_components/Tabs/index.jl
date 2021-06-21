module chapters_dash_core_components_tabs
using Dash, DashHtmlComponents, DashCoreComponents

include("../../../utils.jl")

export examples

examples_path = joinpath(@__DIR__, "examples")

method1 = LoadExampleCode(string(examples_path, "/method1.jl"))

method2 = LoadExampleCode(string(examples_path, "/method2.jl"))


examples = [method1]

app =  dash()

# default.callback!(app)

method1.callback!(app)

app.layout = html_div() do

    html_h1("Tabs Examples and Reference"),

    dcc_markdown("The `dcc_tabs()` and `dcc_tab()` components can be used to create tabbed sections in your app. 
    The `dcc_tab()` component controls the style and value of the individual tab and the `dcc_tabs()` component holds a 
    collection of `dcc_tab()` components"),

    html_h3("Method 1. Content as Callback"),

    dcc_markdown("Attach a callback to the Tabs `value` prop and update a container's `children` property in your callback."),

    method1.source_code,
    method1.layout,

    html_h3("Method 2. Content as Tab Children"),

    dcc_markdown("Instead of displaying the content through a callback, 
    you can embed the content directly as the `children` property in the Tab component:"),

    method2.source_code,
    method2.layout


end

end
