module chapters_dash_html_components

using Dash, DashHtmlComponents, DashCoreComponents, Chain, Pkg

function get_pkg_version(name::AbstractString)
    @chain Pkg.dependencies() begin
        values
        [x for x in _ if x.name == name]
        only
        _.version
    end
end

include("../../utils.jl")

export examples

examples_path = joinpath(@__DIR__, "examples")

div_index_example = LoadExampleCode(string(examples_path, "/div_index_example.jl"))
markdown_index_example = LoadExampleCode(string(examples_path, "/markdown_index_example.jl"))
style_index_example = LoadExampleCode(string(examples_path, "/style_index_example.jl"))

examples = [
    div_index_example
]
app =  dash()

n = get_pkg_version("DashHtmlComponents")

app.layout = html_div() do

    html_h1("Dash HTML Components"),

    dcc_markdown("
    Dash is a web application framework that provides pure Julia abstraction around HTML, CSS, and JavaScript.

    Instead of writing HTML or using an HTML templating engine, you compose your layout using Julia structures with the `DashHtmlComponents` package.

    The source for this library is on GitHub: [plotly/dash-html-components](https://github.com/plotly/dash-html-components).

    For production Dash apps, styling and layout of Dash HTML Components should be managed with Dash Enterprise Design Kit.
    
    These docs are using version $n.

    Here is an example of a simple HTML structure:.

    "),
    div_index_example.source_code,
    
    dcc_markdown("which gets converted (behind the scenes) into the following HTML in your web-app:
    "),
    dcc_markdown("
    ```
    <div>
      <h1>Hello Dash</h1>
      <div>
          <p>Dash converts Python classes into HTML</p>
          <p>This conversion happens behind the scenes by Dash's JavaScript front-end</p>
      </div>
    </div>
    ```
    "),
    dcc_markdown("
    If you're not comfortable with HTML, don't worry! You can get 95% of the way there with just 
    a few elements and attributes. Dash's [core component library](https://dash-julia.plotly.com/dash_core_components) also supports [Markdown](https://commonmark.org/help/).
    "),
    markdown_index_example.source_code,
    markdown_index_example.layout,

    dcc_markdown("
    If you're using HTML components, then you also have access to properties like `style`, `class`, and `id`. All of these attributes are available in the Julia classes.

    The HTML elements and Dash classes are mostly the same but there are a few key differences:

    * The `style` property is a dictionary
    * Properties in the `style` dictionary are camelCased
    * The `class` key is renamed as `className`
    * Style properties in pixel units can be supplied as just numbers without the `px` unit

    Let's take a look at an example.
    "),
    style_index_example.source_code,
    dcc_markdown("
    That Dash code will render this HTML markup:
    "),
    dcc_markdown("
    ```
        <div style='margin-bottom: 50px; margin-top: 25px;'>

        <div style='color: blue; font-size: 14px'>
            Example Div
        </div>

        <p class='my-class', id='my-p-element'>
            Example P
        </p>

    </div>
    ```
    "),

    dcc_markdown("
    Note: If you need to directly render a string of raw, unescaped HTML, you can use the 
    `DangerouslySetInnerHTML component` which is provided by the 
    [dash-dangerously-set-inner-html](https://github.com/plotly/dash-dangerously-set-inner-html) library.`
    "),
    
    html_h3("Full elements reference:"),
    html_ul(
    [
      html_li(html_a(html_h6("html_a"), href="/dash_html_components/a")),
      html_li(html_a(html_h6("html_abbr"), href="/dash_html_components/abbr")),
      html_li(html_a(html_h6("html_acronym"), href="/dash_html_components/acronym")),
      html_li(html_a(html_h6("html_address"), href="/dash_html_components/address")),
      html_li(html_a(html_h6("html_area"), href="/dash_html_components/area")),
      html_li(html_a(html_h6("html_article"), href="/dash_html_components/article")),
      html_li(html_a(html_h6("html_aside"), href="/dash_html_components/aside")),
      html_li(html_a(html_h6("html_audio"), href="/dash_html_components/audio")),
      html_li(html_a(html_h6("html_b"), href="/dash_html_components/b")),
      html_li(html_a(html_h6("html_base"), href="/dash_html_components/base")),
      html_li(html_a(html_h6("html_basefont"), href="/dash_html_components/basefont")),
      html_li(html_a(html_h6("html_bdi"), href="/dash_html_components/bdi")),      
      html_li(html_a(html_h6("html_bdo"), href="/dash_html_components/bdo")),
      html_li(html_a(html_h6("html_big"), href="/dash_html_components/")),
      html_li(html_a(html_h6("html_blink"), href="/dash_html_components/")),
      html_li(html_a(html_h6("html_blockquote"), href="/dash_html_components/")),
      html_li(html_a(html_h6("html_br"), href="/dash_html_components/")),
      html_li(html_a(html_h6("html_button"), href="/dash_html_components/")),
      html_li(html_a(html_h6("html_canvas"), href="/dash_html_components/")),
      html_li(html_a(html_h6("html_caption"), href="/dash_html_components/")),
      html_li(html_a(html_h6("html_center"), href="/dash_html_components/")),
      html_li(html_a(html_h6("html_cite"), href="/dash_html_components/")),
      html_li(html_a(html_h6("html_code"), href="/dash_html_components/")),
      html_li(html_a(html_h6("html_col"), href="/dash_html_components/")),
      html_li(html_a(html_h6("html_colgroup"), href="/dash_html_components/")),
      html_li(html_a(html_h6("html_command"), href="/dash_html_components/")),
      html_li(html_a(html_h6("html_content"), href="/dash_html_components/")),
      html_li(html_a(html_h6("html_data"), href="/dash_html_components/")),
      html_li(html_a(html_h6("html_datalist"), href="/dash_html_components/")),
      html_li(html_a(html_h6("html_dd"), href="/dash_html_components/")),
      html_li(html_a(html_h6("html_del"), href="/dash_html_components/")),
      html_li(html_a(html_h6("html_dfn"), href="/dash_html_components/")),
      html_li(html_a(html_h6("html_dialog"), href="/dash_html_components/")),
      html_li(html_a(html_h6("html_div"), href="/dash_html_components/")),
      html_li(html_a(html_h6("html_dl"), href="/dash_html_components/")),
      html_li(html_a(html_h6("html_dt"), href="/dash_html_components/")),
      html_li(html_a(html_h6("html_element"), href="/dash_html_components/")),
      html_li(html_a(html_h6("html_em"), href="/dash_html_components/")),
      html_li(html_a(html_h6("html_embed"), href="/dash_html_components/")),
      html_li(html_a(html_h6("html_fieldset"), href="/dash_html_components/")),
      html_li(html_a(html_h6("html_figcaption"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_figure"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_font"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_footer"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_form"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_frame"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_frameset"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_h1"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_h2"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_h3"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_h4"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_h5"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_h6"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_header"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_hgroup"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_hr"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_i"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_iframe"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_img"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_ins"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_isindex"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_kbd"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_keygen"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_label"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_legend"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_li"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_link"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_listing"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_main"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_mapEl"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_mark"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_marquee"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_meta"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_meter"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_multicol"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_nav"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_nextid"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_nobr"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_noscript"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_objectEl"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_ol"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_optgroup"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_option"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_output"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_p"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_param"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_picture"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_plaintext"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_pre"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_progress"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_q"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_rb"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_rp"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_rt"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_rtc"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_ruby"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_s"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_samp"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_script"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_section"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_select"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_shadow"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_slot"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_small"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_source"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_spacer"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_span"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_strike"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_strong"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_sub"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_summary"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_sup"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_table"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_tbody"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_td"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_template"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_textarea"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_tfoot"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_th"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_thead"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_time"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_title"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_tr"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_track"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_u"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_ul"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_var"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_video"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_wbr"), href="/dash_html_components")),
      html_li(html_a(html_h6("html_xmp"), href="/dash_html_components"))  
    ]
  )

end

end