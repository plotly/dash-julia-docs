module chapters_dash_core_components_confirmdialog

using Dash, DashHtmlComponents, DashCoreComponents

include("../../../utils.jl")

export examples

examples_path = joinpath(@__DIR__, "examples")

confirm = LoadExampleCode(string(examples_path, "/confirm.jl"))


app =  dash()

examples = [confirm]

app.layout = html_div() do

    html_h1("ConfirmDialog component"),

    dcc_markdown("""
    ConfirmDialog is used to display the browser's native "confirm" modal, with an optional message and two buttons ("OK" and "Cancel"). This ConfirmDialog can be used in conjunction with buttons when the user is performing an action that should require an extra step of verification.
    
    """),

    confirm.source_code,
    confirm.layout,

    html_h3("dcc.ConfirmDialog Properties"),

    dcc_markdown("""
    ```
Access this documentation in your Python terminal with:

?help dcc_confirmdialog

Our recommended IDE for writing Dash apps is Dash Enterprise's Data Science Workspaces, which has typeahead support for Dash Component Properties. Find out if your company is using Dash Enterprise.
```

`id` (Sstring; optional): The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.

`cancel_n_clicks` (Number; default 0): Number of times the popup was canceled.

`cancel_n_clicks_timestamp` (Number; default -1): Last time the cancel button was clicked.

`displayed` (Boolean; optional): Set to `true` to send the ConfirmDialog.

`message` (String; optional): Message to show in the popup.

`submit_n_clicks` (Number; default 0): Number of times the submit button was clicked.

`submit_n_clicks_timestamp` (Number; default -1): Last time the submit button was clicked.
    """)

end

end