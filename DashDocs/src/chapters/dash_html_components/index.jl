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
@doc_chapter "/dash-html-components" begin

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
      html_li(html_a(html_h6("html_a"), href="/dash-html-components/a")),
      html_li(html_a(html_h6("html_abbr"), href="/dash-html-components/abbr")),
      html_li(html_a(html_h6("html_acronym"), href="/dash-html-components/acronym")),
      html_li(html_a(html_h6("html_address"), href="/dash-html-components/address")),
      html_li(html_a(html_h6("html_area"), href="/dash-html-components/area")),
      html_li(html_a(html_h6("html_article"), href="/dash-html-components/article")),
      html_li(html_a(html_h6("html_aside"), href="/dash-html-components/aside")),
      html_li(html_a(html_h6("html_audio"), href="/dash-html-components/audio")),
      html_li(html_a(html_h6("html_b"), href="/dash-html-components/b")),
      html_li(html_a(html_h6("html_base"), href="/dash-html-components/base")),
      html_li(html_a(html_h6("html_basefont"), href="/dash-html-components/basefont")),
      html_li(html_a(html_h6("html_bdi"), href="/dash-html-components/bdi")),      
      html_li(html_a(html_h6("html_bdo"), href="/dash-html-components/bdo")),
      html_li(html_a(html_h6("html_big"), href="/dash-html-components/big")),
      html_li(html_a(html_h6("html_blink"), href="/dash-html-components/blink")),
      html_li(html_a(html_h6("html_blockquote"), href="/dash-html-components/blockquote")),
      html_li(html_a(html_h6("html_br"), href="/dash-html-components/br")),
      html_li(html_a(html_h6("html_button"), href="/dash-html-components/button")),
      html_li(html_a(html_h6("html_canvas"), href="/dash-html-components/canvas")),
      html_li(html_a(html_h6("html_caption"), href="/dash-html-components/caption")),
      html_li(html_a(html_h6("html_center"), href="/dash-html-components/center")),
      html_li(html_a(html_h6("html_cite"), href="/dash-html-components/cite")),
      html_li(html_a(html_h6("html_code"), href="/dash-html-components/code")),
      html_li(html_a(html_h6("html_col"), href="/dash-html-components/col")),
      html_li(html_a(html_h6("html_colgroup"), href="/dash-html-components/colgroup")),
      html_li(html_a(html_h6("html_command"), href="/dash-html-components/command")),
      html_li(html_a(html_h6("html_content"), href="/dash-html-components/content")),
      html_li(html_a(html_h6("html_data"), href="/dash-html-components/data")),
      html_li(html_a(html_h6("html_datalist"), href="/dash-html-components/datalist")),
      html_li(html_a(html_h6("html_dd"), href="/dash-html-components/dd")),
      html_li(html_a(html_h6("html_del"), href="/dash-html-components/del")),
      html_li(html_a(html_h6("html_dfn"), href="/dash-html-components/dfn")),
      html_li(html_a(html_h6("html_dialog"), href="/dash-html-components/dialog")),
      html_li(html_a(html_h6("html_div"), href="/dash-html-components/div")),
      html_li(html_a(html_h6("html_dl"), href="/dash-html-components/dl")),
      html_li(html_a(html_h6("html_dt"), href="/dash-html-components/dt")),
      html_li(html_a(html_h6("html_element"), href="/dash-html-components/element")),
      html_li(html_a(html_h6("html_em"), href="/dash-html-components/em")),
      html_li(html_a(html_h6("html_embed"), href="/dash-html-components/embed")),
      html_li(html_a(html_h6("html_fieldset"), href="/dash-html-components/fieldset")),
      html_li(html_a(html_h6("html_figcaption"), href="/dash-html-components/figcaption")),
      html_li(html_a(html_h6("html_figure"), href="/dash-html-components/figure")),
      html_li(html_a(html_h6("html_font"), href="/dash-html-components/font")),
      html_li(html_a(html_h6("html_footer"), href="/dash-html-components/footer")),
      html_li(html_a(html_h6("html_form"), href="/dash-html-components/form")),
      html_li(html_a(html_h6("html_frame"), href="/dash-html-components/frame")),
      html_li(html_a(html_h6("html_frameset"), href="/dash-html-components/frameset")),
      html_li(html_a(html_h6("html_h1"), href="/dash-html-components/h1")),
      html_li(html_a(html_h6("html_h2"), href="/dash-html-components/h2")),
      html_li(html_a(html_h6("html_h3"), href="/dash-html-components/h3")),
      html_li(html_a(html_h6("html_h4"), href="/dash-html-components/h4")),
      html_li(html_a(html_h6("html_h5"), href="/dash-html-components/h5")),
      html_li(html_a(html_h6("html_h6"), href="/dash-html-components/h6")),
      html_li(html_a(html_h6("html_header"), href="/dash-html-components/header")),
      html_li(html_a(html_h6("html_hgroup"), href="/dash-html-components/hgroup")),
      html_li(html_a(html_h6("html_hr"), href="/dash-html-components/hr")),
      html_li(html_a(html_h6("html_i"), href="/dash-html-components/i")),
      html_li(html_a(html_h6("html_iframe"), href="/dash-html-components/iframe")),
      html_li(html_a(html_h6("html_img"), href="/dash-html-components/img")),
      html_li(html_a(html_h6("html_ins"), href="/dash-html-components/ins")),
      html_li(html_a(html_h6("html_isindex"), href="/dash-html-components/isindex")),
      html_li(html_a(html_h6("html_kbd"), href="/dash-html-components/kbd")),
      html_li(html_a(html_h6("html_keygen"), href="/dash-html-components/keygen")),
      html_li(html_a(html_h6("html_label"), href="/dash-html-components/label")),
      html_li(html_a(html_h6("html_legend"), href="/dash-html-components/legend")),
      html_li(html_a(html_h6("html_li"), href="/dash-html-components/li")),
      html_li(html_a(html_h6("html_link"), href="/dash-html-components/link")),
      html_li(html_a(html_h6("html_listing"), href="/dash-html-components/listing")),
      html_li(html_a(html_h6("html_main"), href="/dash-html-components/main")),
      html_li(html_a(html_h6("html_mapel"), href="/dash-html-components/mapel")),
      html_li(html_a(html_h6("html_mark"), href="/dash-html-components/mark")),
      html_li(html_a(html_h6("html_marquee"), href="/dash-html-components/marquee")),
      html_li(html_a(html_h6("html_meta"), href="/dash-html-components/meta")),
      html_li(html_a(html_h6("html_meter"), href="/dash-html-components/meter")),
      html_li(html_a(html_h6("html_multicol"), href="/dash-html-components/multicol")),
      html_li(html_a(html_h6("html_nav"), href="/dash-html-components/nav")),
      html_li(html_a(html_h6("html_nextid"), href="/dash-html-components/nextid")),
      html_li(html_a(html_h6("html_nobr"), href="/dash-html-components/nobr")),
      html_li(html_a(html_h6("html_noscript"), href="/dash-html-components/noscript")),
      html_li(html_a(html_h6("html_objectel"), href="/dash-html-components/objectel")),
      html_li(html_a(html_h6("html_ol"), href="/dash-html-components/ol")),
      html_li(html_a(html_h6("html_optgroup"), href="/dash-html-components/optgroup")),
      html_li(html_a(html_h6("html_option"), href="/dash-html-components/option")),
      html_li(html_a(html_h6("html_output"), href="/dash-html-components/output")),
      html_li(html_a(html_h6("html_p"), href="/dash-html-components/p")),
      html_li(html_a(html_h6("html_param"), href="/dash-html-components/param")),
      html_li(html_a(html_h6("html_picture"), href="/dash-html-components/picture")),
      html_li(html_a(html_h6("html_plaintext"), href="/dash-html-components/plaintext")),
      html_li(html_a(html_h6("html_pre"), href="/dash-html-components/pre")),
      html_li(html_a(html_h6("html_progress"), href="/dash-html-components/progress")),
      html_li(html_a(html_h6("html_q"), href="/dash-html-components/q")),
      html_li(html_a(html_h6("html_rb"), href="/dash-html-components/rb")),
      html_li(html_a(html_h6("html_rp"), href="/dash-html-components/rp")),
      html_li(html_a(html_h6("html_rt"), href="/dash-html-components/rt")),
      html_li(html_a(html_h6("html_rtc"), href="/dash-html-components/rtc")),
      html_li(html_a(html_h6("html_ruby"), href="/dash-html-components/ruby")),
      html_li(html_a(html_h6("html_s"), href="/dash-html-components/s")),
      html_li(html_a(html_h6("html_samp"), href="/dash-html-components/samp")),
      html_li(html_a(html_h6("html_script"), href="/dash-html-components/script")),
      html_li(html_a(html_h6("html_section"), href="/dash-html-components/section")),
      html_li(html_a(html_h6("html_select"), href="/dash-html-components/select")),
      html_li(html_a(html_h6("html_shadow"), href="/dash-html-components/shadow")),
      html_li(html_a(html_h6("html_slot"), href="/dash-html-components/slot")),
      html_li(html_a(html_h6("html_small"), href="/dash-html-components/small")),
      html_li(html_a(html_h6("html_source"), href="/dash-html-components/source")),
      html_li(html_a(html_h6("html_spacer"), href="/dash-html-components/spacer")),
      html_li(html_a(html_h6("html_span"), href="/dash-html-components/span")),
      html_li(html_a(html_h6("html_strike"), href="/dash-html-components/strike")),
      html_li(html_a(html_h6("html_strong"), href="/dash-html-components/strong")),
      html_li(html_a(html_h6("html_sub"), href="/dash-html-components/sub")),
      html_li(html_a(html_h6("html_summary"), href="/dash-html-components/summary")),
      html_li(html_a(html_h6("html_sup"), href="/dash-html-components/sup")),
      html_li(html_a(html_h6("html_table"), href="/dash-html-components/table")),
      html_li(html_a(html_h6("html_tbody"), href="/dash-html-components/tbody")),
      html_li(html_a(html_h6("html_td"), href="/dash-html-components/td")),
      html_li(html_a(html_h6("html_template"), href="/dash-html-components/template")),
      html_li(html_a(html_h6("html_textarea"), href="/dash-html-components/textarea")),
      html_li(html_a(html_h6("html_tfoot"), href="/dash-html-components/tfoot")),
      html_li(html_a(html_h6("html_th"), href="/dash-html-components/th")),
      html_li(html_a(html_h6("html_thead"), href="/dash-html-components/thead")),
      html_li(html_a(html_h6("html_time"), href="/dash-html-components/time")),
      html_li(html_a(html_h6("html_title"), href="/dash-html-components/title")),
      html_li(html_a(html_h6("html_tr"), href="/dash-html-components/tr")),
      html_li(html_a(html_h6("html_track"), href="/dash-html-components/track")),
      html_li(html_a(html_h6("html_u"), href="/dash-html-components/u")),
      html_li(html_a(html_h6("html_ul"), href="/dash-html-components/ul")),
      html_li(html_a(html_h6("html_var"), href="/dash-html-components/var")),
      html_li(html_a(html_h6("html_video"), href="/dash-html-components/video")),
      html_li(html_a(html_h6("html_wbr"), href="/dash-html-components/wbr")),
      html_li(html_a(html_h6("html_xmp"), href="/dash-html-components/xmp")) 
    ]
  )

end

end
