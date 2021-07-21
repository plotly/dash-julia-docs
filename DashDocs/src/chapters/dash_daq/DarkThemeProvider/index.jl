@doc_chapter "/dash_daq/dark_theme_provider" begin

@example darkthemeprovider_default "default.jl"

@layout html_div() do

    html_h1("Dark Theme Provider Examples and Reference"),

    html_h3("Default Dark Theme Provider"),

    dcc_markdown("An example of a default dark theme provider without any extra properties."),

    source"darkthemeprovider_default",
    layout"darkthemeprovider_default",

    html_h3("Color Picker Properties"),
    dcc_markdown("""
    Access this documentation in your Julia REPL with:
    ```julia    
    ?help daq_darkthemeprovider
    ```
    Our recommended IDE for writing Dash apps is Dash
      Enterprise's [Data Science Workspaces](https://plotly.com/dash/workspaces/),
       which has typeahead support for Dash Component Properties. [Find out if your company is using Dash Enterprise](https://go.plotly.com/company-lookup).
    """),
    dcc_markdown("""
    * `children` (list of a list of or a singular dash component, string or numbers | a list of or a singular dash component, String or Number; optional): The children of this component.
 
    * `theme` (Dict; optional): Theme object to override with a custom theme.

    * `theme` is a Dict with keys:

        * `dark` (Boolean; optional): True for Dark mode, False for Light.

        * `detail` (String; optional): Color used for UI details, like borders.

        * `primary` (String; optional): Highlight color.

        * `secondary` (String; optional): Supporting color.
    """)

end

end