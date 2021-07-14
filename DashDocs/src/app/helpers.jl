function base_app()
    index_string = "
    <!DOCTYPE html>
    <html>
        <head>
            {%metas%}
            <title>{%title%}</title>
            {%favicon%}
            {%css%}
                <script>
                (function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
                new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
                j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
                'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
                })(window,document,'script','dataLayer','GTM-N6T2RXG');
                </script>
        </head>
        <body>
            <!-- Google Tag Manager (noscript) -->
                <noscript><iframe src='https://www.googletagmanager.com/ns.html?id=GTM-N6T2RXG'
                height='0' width='0' style='display:none;visibility:hidden'></iframe></noscript>
            <!-- End Google Tag Manager (noscript) -->
            {%app_entry%}
            <footer>
                {%config%}
                {%scripts%}
                {%renderer%}
            </footer>
        </body>
    </html>"

    assets_path =  "./assets"
    app = dash(assets_folder = assets_path, meta_tags = [Dict(["name"=>"description", "content" => "Dash for Julia User Guide and Documentation. Dash is a framework for building analytical web apps in Julia, R, and Python."])], index_string = index_string, suppress_callback_exceptions = true)

    app.title = "Dash for Julia User Guide and Documentation | Plotly"
    return app
end
function make_app_header()
    return html_div(
    children = (
        html_div(
            style = Dict("height" => "95%"),
            className = "container-width",
            children = (
                html_div(
                    children = (
                        html_span("📣 Welcome! Dash for Julia is New! Read "),
                        html_a("the community announcement", className = "link", href="https://community.plotly.com/t/welcome-to-dash-julia/46056"),
                        html_span(" regarding the current status of the project.")
                    ),
                    style = Dict("background-color" => "#80CFBE", "text-align" => "center", "color" => "#000000")),
                html_a(
                    html_img(
                        style = Dict("height" => "100%", "padding-left" => "80px"),
                        src = "https://dash.plotly.com/assets/images/logo-plotly.png"
                        ),
                        href = "https://plotly.com/products/dash",
                        className = "logo-link"
                        ),
                        html_div(
                            children = (
                                html_a("Announcements", className = "links--announcements", href = "https://community.plotly.com/tag/announcements"),
                                html_a("Gallery", className = "links--gallery", href = "https://dash-gallery.plotly.host"),
                                html_a("Show & Tell", className = "links--show-and-tell", href = "https://community.plotly.com/tag/show-and-tell"),
                                html_a("Community Forum", className = "links--community-forum", href = "https://community.plotly.com/c/dash/julia/20"),
                                html_iframe(src="https://ghbtns.com/github-btn.html?user=plotly&repo=dash.jl&type=star&count=true&size=small", style = Dict("border" => "none", "height" => "30px", "verticalAlign" => "middle", "marginTop" => "9px", "width" => "120px")),
                                html_a("dash enterprise demo", className = "link--demo-button", href = "https://plotly.com/get-demo/?utm_source=docs&utm_medium=banner&utm_campaign=sept&utm_content=demo", style = Dict("backgroundColor" => "#f4564e", "borderRadius" => "1.22rem", "color" => "white", "cursor" => "pointer", "display" => "inline-block", "fontStyle" => "italic", "fontWeight" => "700", "lineHeight" => "1.2", "letter-spacing" => "1.33px", "outline" => "none", "padding" => ".55rem 1.22rem", "marginRight" => "5px", "textAlign" => "center", "verticalAlign" => "middle", "textDecoration" => "none", "textTransform" => "uppercase", "transition" => "background-color .2s ease-in-out"))
                                ),
                            className = "links"
                        )
                    )
        )
    ),
    className = "header"
)
end