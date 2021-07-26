include("A/index.jl");
include("Abbr/index.jl");
include("Acronym/index.jl");
include("Address/index.jl");
include("Area/index.jl");
include("Article/index.jl");
include("Aside/index.jl");
include("Audio/index.jl");
include("B/index.jl");
include("Base/index.jl");
include("Basefont/index.jl");
include("Bdi/index.jl");
include("Bdo/index.jl");
include("Big/index.jl");
include("Blink/index.jl");
include("Blockquote/index.jl");
include("Br/index.jl");
include("Button/index.jl");
include("Canvas/index.jl");
include("Caption/index.jl");
include("Center/index.jl");
include("Cite/index.jl");
include("Code/index.jl");
include("Col/index.jl");
include("Colgroup/index.jl");
include("Command/index.jl");
include("Content/index.jl");
include("Data/index.jl");
include("Datalist/index.jl");
include("Command/index.jl");
include("Content/index.jl");
include("Data/index.jl");
include("Datalist/index.jl");
include("Dd/index.jl");
include("Del/index.jl");
include("Details/index.jl");
include("Dfn/index.jl");
include("Dialog/index.jl");
include("Div/index.jl");
include("Dl/index.jl");
include("Dt/index.jl");
include("Element/index.jl");
include("Em/index.jl");
include("Embed/index.jl");
include("Fieldset/index.jl");
include("Figcaption/index.jl");
include("Figure/index.jl");
include("Font/index.jl");
include("Footer/index.jl");
include("Form/index.jl");
include("Frame/index.jl");
include("Frameset/index.jl");
include("H1/index.jl");
include("H2/index.jl");
include("H3/index.jl");
include("H4/index.jl");
include("H5/index.jl");
include("H6/index.jl");
include("Header/index.jl");
include("Hgroup/index.jl");
include("Hr/index.jl");
include("I/index.jl");
include("Iframe/index.jl");
include("Img/index.jl");
include("Ins/index.jl");
include("Isindex/index.jl");
include("Kbd/index.jl");
include("Keygen/index.jl");
include("Label/index.jl");
include("Legend/index.jl");
include("Li/index.jl");
include("Link/index.jl");
include("Listing/index.jl");
include("Main/index.jl");
include("MapEl/index.jl");
include("Mark/index.jl");
include("Marquee/index.jl");
include("Meta/index.jl");
include("Meter/index.jl");
include("Multicol/index.jl");
include("Nav/index.jl");
include("Nextid/index.jl");
include("Nobr/index.jl");
include("Noscript/index.jl");
include("ObjectEl/index.jl");
include("Ol/index.jl");
include("Optgroup/index.jl");
include("Option/index.jl");
include("Output/index.jl");
include("P/index.jl");
include("Param/index.jl");
include("Picture/index.jl");
include("Plaintext/index.jl");
include("Pre/index.jl");
include("Progress/index.jl");
include("Q/index.jl");
include("Rb/index.jl");
include("Rp/index.jl");
include("Rt/index.jl");
include("Rtc/index.jl");
include("Ruby/index.jl");
include("S/index.jl");
include("Samp/index.jl");
include("Script/index.jl");
include("Section/index.jl");
include("Select/index.jl");
include("Shadow/index.jl");
include("Slot/index.jl");
include("Small/index.jl");
include("Source/index.jl");
include("Spacer/index.jl");
include("Span/index.jl");
include("Strike/index.jl");
include("Strong/index.jl");
include("Sub/index.jl");
include("Summary/index.jl");
include("Sup/index.jl");
include("Table/index.jl");
include("Tbody/index.jl");
include("Td/index.jl");
include("Template/index.jl");
include("Textarea/index.jl");
include("Tfoot/index.jl");
include("Th/index.jl");
include("Thead/index.jl");
include("Time/index.jl");
include("Title/index.jl");
include("Tr/index.jl");
include("Track/index.jl");
include("U/index.jl");
include("Ul/index.jl");
include("Var/index.jl");
include("Video/index.jl");
include("Wbr/index.jl");
include("Xmp/index.jl");
@doc_chapter "/dash_html_components" begin

@example div_index_example "div_index_example.jl"
@example markdown_index_example "markdown_index_example.jl"
@example style_index_example "style_index_example.jl"

@layout html_div() do

    html_h1("Dash HTML Components"),

    dcc_markdown("
    Dash is a web application framework that provides pure Julia abstraction around HTML, CSS, and JavaScript.

    Instead of writing HTML or using an HTML templating engine, you compose your layout using Julia structures with the `DashHtmlComponents` package.

    The source for this library is on GitHub: [plotly/dash-html-components](https://github.com/plotly/dash-html-components).

    For production Dash apps, styling and layout of Dash HTML Components should be managed with Dash Enterprise Design Kit.

    These docs are using version $(pkgver"DashHtmlComponents").

    Here is an example of a simple HTML structure:.

    "),
    source"div_index_example",

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
    source"markdown_index_example",
    layout"markdown_index_example",

    dcc_markdown("
    If you're using HTML components, then you also have access to properties like `style`, `class`, and `id`. All of these attributes are available in the Julia classes.

    The HTML elements and Dash classes are mostly the same but there are a few key differences:

    * The `style` property is a dictionary
    * Properties in the `style` dictionary are camelCased
    * The `class` key is renamed as `className`
    * Style properties in pixel units can be supplied as just numbers without the `px` unit

    Let's take a look at an example.
    "),
    source"style_index_example",
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
      html_li(html_a(html_h6("html_big"), href="/dash_html_components/big")),
      html_li(html_a(html_h6("html_blink"), href="/dash_html_components/blink")),
      html_li(html_a(html_h6("html_blockquote"), href="/dash_html_components/blockquote")),
      html_li(html_a(html_h6("html_br"), href="/dash_html_components/br")),
      html_li(html_a(html_h6("html_button"), href="/dash_html_components/button")),
      html_li(html_a(html_h6("html_canvas"), href="/dash_html_components/canvas")),
      html_li(html_a(html_h6("html_caption"), href="/dash_html_components/caption")),
      html_li(html_a(html_h6("html_center"), href="/dash_html_components/center")),
      html_li(html_a(html_h6("html_cite"), href="/dash_html_components/cite")),
      html_li(html_a(html_h6("html_code"), href="/dash_html_components/code")),
      html_li(html_a(html_h6("html_col"), href="/dash_html_components/col")),
      html_li(html_a(html_h6("html_colgroup"), href="/dash_html_components/colgroup")),
      html_li(html_a(html_h6("html_command"), href="/dash_html_components/command")),
      html_li(html_a(html_h6("html_content"), href="/dash_html_components/content")),
      html_li(html_a(html_h6("html_data"), href="/dash_html_components/data")),
      html_li(html_a(html_h6("html_datalist"), href="/dash_html_components/datalist")),
      html_li(html_a(html_h6("html_dd"), href="/dash_html_components/dd")),
      html_li(html_a(html_h6("html_del"), href="/dash_html_components/del")),
      html_li(html_a(html_h6("html_dfn"), href="/dash_html_components/dfn")),
      html_li(html_a(html_h6("html_dialog"), href="/dash_html_components/dialog")),
      html_li(html_a(html_h6("html_div"), href="/dash_html_components/div")),
      html_li(html_a(html_h6("html_dl"), href="/dash_html_components/dl")),
      html_li(html_a(html_h6("html_dt"), href="/dash_html_components/dt")),
      html_li(html_a(html_h6("html_element"), href="/dash_html_components/element")),
      html_li(html_a(html_h6("html_em"), href="/dash_html_components/em")),
      html_li(html_a(html_h6("html_embed"), href="/dash_html_components/embed")),
      html_li(html_a(html_h6("html_fieldset"), href="/dash_html_components/fieldset")),
      html_li(html_a(html_h6("html_figcaption"), href="/dash_html_components/figcaption")),
      html_li(html_a(html_h6("html_figure"), href="/dash_html_components/figure")),
      html_li(html_a(html_h6("html_font"), href="/dash_html_components/font")),
      html_li(html_a(html_h6("html_footer"), href="/dash_html_components/footer")),
      html_li(html_a(html_h6("html_form"), href="/dash_html_components/form")),
      html_li(html_a(html_h6("html_frame"), href="/dash_html_components/frame")),
      html_li(html_a(html_h6("html_frameset"), href="/dash_html_components/frameset")),
      html_li(html_a(html_h6("html_h1"), href="/dash_html_components/h1")),
      html_li(html_a(html_h6("html_h2"), href="/dash_html_components/h2")),
      html_li(html_a(html_h6("html_h3"), href="/dash_html_components/h3")),
      html_li(html_a(html_h6("html_h4"), href="/dash_html_components/h4")),
      html_li(html_a(html_h6("html_h5"), href="/dash_html_components/h5")),
      html_li(html_a(html_h6("html_h6"), href="/dash_html_components/h6")),
      html_li(html_a(html_h6("html_header"), href="/dash_html_components/header")),
      html_li(html_a(html_h6("html_hgroup"), href="/dash_html_components/hgroup")),
      html_li(html_a(html_h6("html_hr"), href="/dash_html_components/hr")),
      html_li(html_a(html_h6("html_i"), href="/dash_html_components/i")),
      html_li(html_a(html_h6("html_iframe"), href="/dash_html_components/iframe")),
      html_li(html_a(html_h6("html_img"), href="/dash_html_components/img")),
      html_li(html_a(html_h6("html_ins"), href="/dash_html_components/ins")),
      html_li(html_a(html_h6("html_isindex"), href="/dash_html_components/isindex")),
      html_li(html_a(html_h6("html_kbd"), href="/dash_html_components/kbd")),
      html_li(html_a(html_h6("html_keygen"), href="/dash_html_components/keygen")),
      html_li(html_a(html_h6("html_label"), href="/dash_html_components/label")),
      html_li(html_a(html_h6("html_legend"), href="/dash_html_components/legend")),
      html_li(html_a(html_h6("html_li"), href="/dash_html_components/li")),
      html_li(html_a(html_h6("html_link"), href="/dash_html_components/link")),
      html_li(html_a(html_h6("html_listing"), href="/dash_html_components/listing")),
      html_li(html_a(html_h6("html_main"), href="/dash_html_components/main")),
      html_li(html_a(html_h6("html_mapel"), href="/dash_html_components/mapel")),
      html_li(html_a(html_h6("html_mark"), href="/dash_html_components/mark")),
      html_li(html_a(html_h6("html_marquee"), href="/dash_html_components/marquee")),
      html_li(html_a(html_h6("html_meta"), href="/dash_html_components/meta")),
      html_li(html_a(html_h6("html_meter"), href="/dash_html_components/meter")),
      html_li(html_a(html_h6("html_multicol"), href="/dash_html_components/multicol")),
      html_li(html_a(html_h6("html_nav"), href="/dash_html_components/nav")),
      html_li(html_a(html_h6("html_nextid"), href="/dash_html_components/nextid")),
      html_li(html_a(html_h6("html_nobr"), href="/dash_html_components/nobr")),
      html_li(html_a(html_h6("html_noscript"), href="/dash_html_components/noscript")),
      html_li(html_a(html_h6("html_objectel"), href="/dash_html_components/objectel")),
      html_li(html_a(html_h6("html_ol"), href="/dash_html_components/ol")),
      html_li(html_a(html_h6("html_optgroup"), href="/dash_html_components/optgroup")),
      html_li(html_a(html_h6("html_option"), href="/dash_html_components/option")),
      html_li(html_a(html_h6("html_output"), href="/dash_html_components/output")),
      html_li(html_a(html_h6("html_p"), href="/dash_html_components/p")),
      html_li(html_a(html_h6("html_param"), href="/dash_html_components/param")),
      html_li(html_a(html_h6("html_picture"), href="/dash_html_components/picture")),
      html_li(html_a(html_h6("html_plaintext"), href="/dash_html_components/plaintext")),
      html_li(html_a(html_h6("html_pre"), href="/dash_html_components/pre")),
      html_li(html_a(html_h6("html_progress"), href="/dash_html_components/progress")),
      html_li(html_a(html_h6("html_q"), href="/dash_html_components/q")),
      html_li(html_a(html_h6("html_rb"), href="/dash_html_components/rb")),
      html_li(html_a(html_h6("html_rp"), href="/dash_html_components/rp")),
      html_li(html_a(html_h6("html_rt"), href="/dash_html_components/rt")),
      html_li(html_a(html_h6("html_rtc"), href="/dash_html_components/rtc")),
      html_li(html_a(html_h6("html_ruby"), href="/dash_html_components/ruby")),
      html_li(html_a(html_h6("html_s"), href="/dash_html_components/s")),
      html_li(html_a(html_h6("html_samp"), href="/dash_html_components/samp")),
      html_li(html_a(html_h6("html_script"), href="/dash_html_components/script")),
      html_li(html_a(html_h6("html_section"), href="/dash_html_components/section")),
      html_li(html_a(html_h6("html_select"), href="/dash_html_components/select")),
      html_li(html_a(html_h6("html_shadow"), href="/dash_html_components/shadow")),
      html_li(html_a(html_h6("html_slot"), href="/dash_html_components/slot")),
      html_li(html_a(html_h6("html_small"), href="/dash_html_components/small")),
      html_li(html_a(html_h6("html_source"), href="/dash_html_components/source")),
      html_li(html_a(html_h6("html_spacer"), href="/dash_html_components/spacer")),
      html_li(html_a(html_h6("html_span"), href="/dash_html_components/span")),
      html_li(html_a(html_h6("html_strike"), href="/dash_html_components/strike")),
      html_li(html_a(html_h6("html_strong"), href="/dash_html_components/strong")),
      html_li(html_a(html_h6("html_sub"), href="/dash_html_components/sub")),
      html_li(html_a(html_h6("html_summary"), href="/dash_html_components/summary")),
      html_li(html_a(html_h6("html_sup"), href="/dash_html_components/sup")),
      html_li(html_a(html_h6("html_table"), href="/dash_html_components/table")),
      html_li(html_a(html_h6("html_tbody"), href="/dash_html_components/tbody")),
      html_li(html_a(html_h6("html_td"), href="/dash_html_components/td")),
      html_li(html_a(html_h6("html_template"), href="/dash_html_components/template")),
      html_li(html_a(html_h6("html_textarea"), href="/dash_html_components/textarea")),
      html_li(html_a(html_h6("html_tfoot"), href="/dash_html_components/tfoot")),
      html_li(html_a(html_h6("html_th"), href="/dash_html_components/th")),
      html_li(html_a(html_h6("html_thead"), href="/dash_html_components/thead")),
      html_li(html_a(html_h6("html_time"), href="/dash_html_components/time")),
      html_li(html_a(html_h6("html_title"), href="/dash_html_components/title")),
      html_li(html_a(html_h6("html_tr"), href="/dash_html_components/tr")),
      html_li(html_a(html_h6("html_track"), href="/dash_html_components/track")),
      html_li(html_a(html_h6("html_u"), href="/dash_html_components/u")),
      html_li(html_a(html_h6("html_ul"), href="/dash_html_components/ul")),
      html_li(html_a(html_h6("html_var"), href="/dash_html_components/var")),
      html_li(html_a(html_h6("html_video"), href="/dash_html_components/video")),
      html_li(html_a(html_h6("html_wbr"), href="/dash_html_components/wbr")),
      html_li(html_a(html_h6("html_xmp"), href="/dash_html_components/xmp")) 
    ]
  )

end

end
