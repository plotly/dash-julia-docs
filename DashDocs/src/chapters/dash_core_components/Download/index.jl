@doc_chapter "/dash-core-components/download" begin

  @example download_text "download_text.jl"

  @layout html_div() do

    html_h1("Download Component"),

    dcc_markdown(
      "The Download component allows files to be directly downloaded from your app. These files include, but are not limited to, spreadsheets, images and text files , etc. The component opens a download dialog when the data property changes.
    "),
    dcc_markdown("
      Note that the following examples make use of the `prevent_initial_call` attribute to prevent the callbacks from being triggered when the app inputs are initially rendered. See [Advanced Callbacks](https://dash-julia.plotly.com/basic-callbacks). for more details."
    ),
    source"download_text",
    layout"download_text",

    html_h3(
      "dcc_download Component Properties"
    ),

    html_h3("dcc_download Reference"),
    dcc_markdown("""
        ```julia
            Access this documentation in your Julia REPL with:

            ?help dcc_download

            Our recommended IDE for writing Dash apps is Dash Enterprise's Data Science Workspaces, which has typeahead support for Dash Component Properties. Find out if your company is using Dash Enterprise.
        ```
    """),
    dcc_markdown(string(@doc dcc_download)) 
end

end