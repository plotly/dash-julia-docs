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
    download_text.layout
end

end