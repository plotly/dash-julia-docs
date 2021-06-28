module chapters_dash_core_components_confirmprovider

using Dash, DashHtmlComponents, DashCoreComponents

include("../../../utils.jl")

export examples

examples_path = joinpath(@__DIR__, "examples")

confirm_provider = LoadExampleCode(string(examples_path, "/confirm_provider.jl"))


app =  dash()

examples = [confirm_provider]

app.layout = html_div() do

    html_h1("dcc_confirmdialogprovider Documentation"),

    confirm_provider.source_code,
    confirm_provider.layout,

    html_h3("dcc_confirmdialogprovider Reference"),

    dcc_markdown("""
    ```
        Access this documentation in your Python terminal with:

        ?help dcc_confirmdialogprovider

        Our recommended IDE for writing Dash apps is Dash Enterprise's Data Science Workspaces, which has typeahead support for Dash Component Properties. Find out if your company is using Dash Enterprise.
    ```
    `children` (Boolean | Number | String | Dict | List; optional): The children to hijack clicks from and display the popup.

    `id` (String; optional): The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.

    `cancel_n_clicks` (Number; default 0): Number of times the popup was canceled.

    `cancel_n_clicks_timestamp` (Number; default -1): Last time the cancel button was clicked.

    `displayed` (Boolean; optional): Is the modal currently displayed.

    `loading_state` (Dict; optional): Object that holds the loading state object coming from dash-renderer.

    `loading_state` is a Dict with keys:

    * `component_name` (string; optional): Holds the name of the component that is loading.

    * `is_loading` (boolean; optional): Determines if the component is loading or not.
    
    * `prop_name` (String; optional): Holds which property is loading.

    `message` (String; optional): Message to show in the popup.

    `submit_n_clicks` (Number; default 0): Number of times the submit was clicked.

    `submit_n_clicks_timestamp` (Number; default -1): Last time the submit button was clicked.
    """)

end

end