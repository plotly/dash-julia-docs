module chapters_dash_core_components_download

using Dash, DashHtmlComponents, DashCoreComponents

include("../../../utils.jl")

export examples

examples_path = joinpath(@__DIR__, "examples")

download_text = LoadExampleCode(string(examples_path, "/download_text.jl"))

examples = [download_text]

app =  dash()

app.layout = html_div() do

    html_h1("Download Component"),

    dcc_markdown(
      "The Download component allows files to be directly downloaded from your app. These files include, but are not limited to, spreadsheets, images and text files , etc. The component opens a download dialog when the data property changes.
    "),
    dcc_markdown("
      Note that the following examples make use of the `prevent_initial_call` attribute to prevent the callbacks from being triggered when the app inputs are initially rendered. See [Advanced Callbacks](https://dash-julia.plotly.com/basic-callbacks). for more details."
    ),
    download_text.source_code,
    download_text.layout,

    dcc_h3(
      "dcc.Download Component Properties"
    ),

    dcc_markdown(
      ```julia
      Access this documentation in your Julia terminal     with:
      help?> dcc_download

      Our recommended IDE for writing Dash apps is Dash Enterprise's [Data Science Workspaces](https://plotly.com/dash/workspaces/), which has typeahead support for Dash Component Properties. [Find out if your company is using Dash Enterprise](https://go.plotly.com/company-lookup).
      ```
    )
    dcc_markdown(
      "examples/`id` (String; optional): The ID of this component, used to identify dash components in callbacks.

      `base64` (Boolean; default `false`): Default value for base64, used when not set as part of the data property.
      
      `data` (Dict; optional): On change, a download is invoked.
      
      `data` is a Dict with keys:
      
      * `base64` (Boolean; optional): Set to `true`, when data is base64 encoded. 
      * `content` (String; required): File content. 
      * `filename` (String; required): Suggested filename in the download dialogue. 
      * `type` (String; optional): Blob type, usually a MIME-type.
      
      `type` (String; default 'text/plain'): Default value for type, used when not set as part of the data property."
    )
end

end