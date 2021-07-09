module chapters_dash_html_components

using Dash, DashHtmlComponents, DashCoreComponents, DashDaq, Chain, Pkg

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
      html_li(html_a(html_h6("html_a"), href="#")),
      html_li(html_a(html_h6("html_abbr"), href="#")),
      html_li(html_a(html_h6("html_acronym"), href="#")),
      html_li(html_a(html_h6("html_address"), href="#")),
      html_li(html_a(html_h6("html_area"), href="#")),
      html_li(html_a(html_h6("html_article"), href="#")),
      html_li(html_a(html_h6("html_aside"), href="#")),
      html_li(html_a(html_h6("html_audio"), href="#")),
      html_li(html_a(html_h6("html_b"), href="#")),
      html_li(html_a(html_h6("html_base"), href="#")),
      html_li(html_a(html_h6("html_basefont"), href="#")),
      html_li(html_a(html_h6("html_bdi"), href="#")),      
      html_li(html_a(html_h6("html_bdo"), href="#")),
      html_li(html_a(html_h6("html_big"), href="#")),
      html_li(html_a(html_h6("html_blink"), href="#")),
      html_li(html_a(html_h6("html_blockquote"), href="#")),
      html_li(html_a(html_h6("html_br"), href="#")),
      html_li(html_a(html_h6("html_button"), href="#")),
      html_li(html_a(html_h6("html_canvas"), href="#")),
      html_li(html_a(html_h6("html_caption"), href="#")),
      html_li(html_a(html_h6("html_center"), href="#")),
      html_li(html_a(html_h6("html_cite"), href="#")),
      html_li(html_a(html_h6("html_code"), href="#")),
      html_li(html_a(html_h6("html_col"), href="#")),
      html_li(html_a(html_h6("html_colgroup"), href="#")),
      html_li(html_a(html_h6("html_command"), href="#")),
      html_li(html_a(html_h6("html_content"), href="#")),
      html_li(html_a(html_h6("html_data"), href="#")),
      html_li(html_a(html_h6("html_datalist"), href="#")),
      html_li(html_a(html_h6("html_dd"), href="#")),
      html_li(html_a(html_h6("html_del"), href="#")),
      html_li(html_a(html_h6("html_dfn"), href="#")),
      html_li(html_a(html_h6("html_dialog"), href="#")),
      html_li(html_a(html_h6("html_div"), href="#")),
      html_li(html_a(html_h6("html_dl"), href="#")),
      html_li(html_a(html_h6("html_dt"), href="#")),
      html_li(html_a(html_h6("html_element"), href="#")),
      html_li(html_a(html_h6("html_em"), href="#")),
      html_li(html_a(html_h6("html_embed"), href="#")),
      html_li(html_a(html_h6("html_fieldset"), href="#")),
      html_li(html_a(html_h6("html_figcaption"), href="#")),
      html_li(html_a(html_h6("html_figure"), href="#")),
      html_li(html_a(html_h6("html_font"), href="#")),
      html_li(html_a(html_h6("html_footer"), href="#")),
      html_li(html_a(html_h6("html_form"), href="#")),
      html_li(html_a(html_h6("html_frame"), href="#")),
      html_li(html_a(html_h6("html_frameset"), href="#")),
      html_li(html_a(html_h6("html_h1"), href="#")),
      html_li(html_a(html_h6("html_h2"), href="#")),
      html_li(html_a(html_h6("html_h3"), href="#")),
      html_li(html_a(html_h6("html_h4"), href="#")),
      html_li(html_a(html_h6("html_h5"), href="#")),
      html_li(html_a(html_h6("html_h6"), href="#")),
      html_li(html_a(html_h6("html_header"), href="#")),
      html_li(html_a(html_h6("html_hgroup"), href="#")),
      html_li(html_a(html_h6("html_hr"), href="#")),
      html_li(html_a(html_h6("html_i"), href="#")),
      html_li(html_a(html_h6("html_iframe"), href="#")),
      html_li(html_a(html_h6("html_img"), href="#")),
      html_li(html_a(html_h6("html_ins"), href="#")),
      html_li(html_a(html_h6("html_isindex"), href="#")),
      html_li(html_a(html_h6("html_kbd"), href="#")),
      html_li(html_a(html_h6("html_keygen"), href="#")),
      html_li(html_a(html_h6("html_label"), href="#")),
      html_li(html_a(html_h6("html_legend"), href="#")),
      html_li(html_a(html_h6("html_li"), href="#")),
      html_li(html_a(html_h6("html_link"), href="#")),
      html_li(html_a(html_h6("html_listing"), href="#")),
      html_li(html_a(html_h6("html_main"), href="#")),
      html_li(html_a(html_h6("html_mapEl"), href="#")),
      html_li(html_a(html_h6("html_mark"), href="#")),
      html_li(html_a(html_h6("html_marquee"), href="#")),
      html_li(html_a(html_h6("html_meta"), href="#")),
      html_li(html_a(html_h6("html_meter"), href="#")),
      html_li(html_a(html_h6("html_multicol"), href="#")),
      html_li(html_a(html_h6("html_nav"), href="#")),
      html_li(html_a(html_h6("html_nextid"), href="#")),
      html_li(html_a(html_h6("html_nobr"), href="#")),
      html_li(html_a(html_h6("html_noscript"), href="#")),
      html_li(html_a(html_h6("html_objectEl"), href="#")),
      html_li(html_a(html_h6("html_ol"), href="#")),
      html_li(html_a(html_h6("html_optgroup"), href="#")),
      html_li(html_a(html_h6("html_option"), href="#")),
      html_li(html_a(html_h6("html_output"), href="#")),
      html_li(html_a(html_h6("html_p"), href="#")),
      html_li(html_a(html_h6("html_param"), href="#")),
      html_li(html_a(html_h6("html_picture"), href="#")),
      html_li(html_a(html_h6("html_plaintext"), href="#")),
      html_li(html_a(html_h6("html_pre"), href="#")),
      html_li(html_a(html_h6("html_progress"), href="#")),
      html_li(html_a(html_h6("html_q"), href="#")),
      html_li(html_a(html_h6("html_rb"), href="#")),
      html_li(html_a(html_h6("html_rp"), href="#")),
      html_li(html_a(html_h6("html_rt"), href="#")),
      html_li(html_a(html_h6("html_rtc"), href="#")),
      html_li(html_a(html_h6("html_ruby"), href="#")),
      html_li(html_a(html_h6("html_s"), href="#")),
      html_li(html_a(html_h6("html_samp"), href="#")),
      html_li(html_a(html_h6("html_script"), href="#")),
      html_li(html_a(html_h6("html_section"), href="#")),
      html_li(html_a(html_h6("html_select"), href="#")),
      html_li(html_a(html_h6("html_shadow"), href="#")),
      html_li(html_a(html_h6("html_slot"), href="#")),
      html_li(html_a(html_h6("html_small"), href="#")),
      html_li(html_a(html_h6("html_source"), href="#")),
      html_li(html_a(html_h6("html_spacer"), href="#")),
      html_li(html_a(html_h6("html_span"), href="#")),
      html_li(html_a(html_h6("html_strike"), href="#")),
      html_li(html_a(html_h6("html_strong"), href="#")),
      html_li(html_a(html_h6("html_sub"), href="#")),
      html_li(html_a(html_h6("html_summary"), href="#")),
      html_li(html_a(html_h6("html_sup"), href="#")),
      html_li(html_a(html_h6("html_table"), href="#")),
      html_li(html_a(html_h6("html_tbody"), href="#")),
      html_li(html_a(html_h6("html_td"), href="#")),
      html_li(html_a(html_h6("html_template"), href="#")),
      html_li(html_a(html_h6("html_textarea"), href="#")),
      html_li(html_a(html_h6("html_tfoot"), href="#")),
      html_li(html_a(html_h6("html_th"), href="#")),
      html_li(html_a(html_h6("html_thead"), href="#")),
      html_li(html_a(html_h6("html_time"), href="#")),
      html_li(html_a(html_h6("html_title"), href="#")),
      html_li(html_a(html_h6("html_tr"), href="#")),
      html_li(html_a(html_h6("html_track"), href="#")),
      html_li(html_a(html_h6("html_u"), href="#")),
      html_li(html_a(html_h6("html_ul"), href="#")),
      html_li(html_a(html_h6("html_var"), href="#")),
      html_li(html_a(html_h6("html_video"), href="#")),
      html_li(html_a(html_h6("html_wbr"), href="#")),
      html_li(html_a(html_h6("html_xmp"), href="#"))  
    ]
  )

end

end
