# initialize outermost container Dash app
include("app.jl");

using Pkg
Pkg.develop(path="./dash-user-guide-components")

using Dash, DashCoreComponents, DashHtmlComponents, DashUserGuideComponents, Match

# Load Chapter, Example, Header, Section, Syntax components
map(include, filter(x->occursin(r".jl$", x), readdir("dash_docs/reusable_components/", join=true)));

# Load chapter container Dash apps
# remove unused includes to speed up load time in development
include("dash_docs/chapters/whats_dash/introduction.jl");
include("dash_docs/chapters/installation/index.jl");
include("dash_docs/chapters/getting_started/index.jl");
include("dash_docs/chapters/basic_callbacks/index.jl");
include("dash_docs/chapters/graph_crossfiltering/index.jl");
include("dash_docs/chapters/sharing_data/index.jl");
include("dash_docs/chapters/faq_gotchas/index.jl");
include("dash_docs/chapters/deployment/index.jl");

include("dash_docs/chapters/dash_core_components/index.jl");
include("dash_docs/chapters/dash_core_components/Dropdown/index.jl");
include("dash_docs/chapters/dash_core_components/Slider/index.jl");
include("dash_docs/chapters/dash_core_components/RangeSlider/index.jl");
include("dash_docs/chapters/dash_core_components/Input/index.jl");
include("dash_docs/chapters/dash_core_components/Textarea/index.jl");
include("dash_docs/chapters/dash_core_components/Checklist/index.jl");
include("dash_docs/chapters/dash_core_components/RadioItems/index.jl");
include("dash_docs/chapters/dash_core_components/DatePickerSingle/index.jl");
include("dash_docs/chapters/dash_core_components/DatePickerRange/index.jl");
include("dash_docs/chapters/dash_core_components/Markdown/index.jl");
include("dash_docs/chapters/dash_core_components/Tabs/index.jl");
include("dash_docs/chapters/dash_core_components/Upload/index.jl");
include("dash_docs/chapters/dash_core_components/Download/index.jl");
include("dash_docs/chapters/dash_core_components/Graph/index.jl");
include("dash_docs/chapters/dash_core_components/ConfirmDialog/index.jl");
include("dash_docs/chapters/dash_core_components/ConfirmDialogProvider/index.jl");
include("dash_docs/chapters/dash_core_components/Store/index.jl");

include("dash_docs/chapters/dash_html_components/index.jl");
include("dash_docs/chapters/dash_html_components/A/index.jl");
include("dash_docs/chapters/dash_html_components/Abbr/index.jl");
include("dash_docs/chapters/dash_html_components/Acronym/index.jl");
include("dash_docs/chapters/dash_html_components/Address/index.jl");
include("dash_docs/chapters/dash_html_components/Area/index.jl");
include("dash_docs/chapters/dash_html_components/Article/index.jl");
include("dash_docs/chapters/dash_html_components/Aside/index.jl");
include("dash_docs/chapters/dash_html_components/Audio/index.jl");
include("dash_docs/chapters/dash_html_components/B/index.jl");
include("dash_docs/chapters/dash_html_components/Base/index.jl");
include("dash_docs/chapters/dash_html_components/Basefont/index.jl");
include("dash_docs/chapters/dash_html_components/Bdi/index.jl");
include("dash_docs/chapters/dash_html_components/Bdo/index.jl");
include("dash_docs/chapters/dash_html_components/Big/index.jl");
include("dash_docs/chapters/dash_html_components/Blink/index.jl");
include("dash_docs/chapters/dash_html_components/Blockquote/index.jl");
include("dash_docs/chapters/dash_html_components/Br/index.jl");
include("dash_docs/chapters/dash_html_components/Button/index.jl");
include("dash_docs/chapters/dash_html_components/Canvas/index.jl");
include("dash_docs/chapters/dash_html_components/Caption/index.jl");
include("dash_docs/chapters/dash_html_components/Center/index.jl");
include("dash_docs/chapters/dash_html_components/Cite/index.jl");
include("dash_docs/chapters/dash_html_components/Code/index.jl");
include("dash_docs/chapters/dash_html_components/Col/index.jl");
include("dash_docs/chapters/dash_html_components/Colgroup/index.jl");
include("dash_docs/chapters/dash_html_components/Command/index.jl");
include("dash_docs/chapters/dash_html_components/Content/index.jl");
include("dash_docs/chapters/dash_html_components/Data/index.jl");
include("dash_docs/chapters/dash_html_components/Datalist/index.jl");
include("dash_docs/chapters/dash_html_components/Command/index.jl");
include("dash_docs/chapters/dash_html_components/Content/index.jl");
include("dash_docs/chapters/dash_html_components/Data/index.jl");
include("dash_docs/chapters/dash_html_components/Datalist/index.jl");
include("dash_docs/chapters/dash_html_components/Dd/index.jl");
include("dash_docs/chapters/dash_html_components/Del/index.jl");
include("dash_docs/chapters/dash_html_components/Details/index.jl");
include("dash_docs/chapters/dash_html_components/Dfn/index.jl");
include("dash_docs/chapters/dash_html_components/Dialog/index.jl");
include("dash_docs/chapters/dash_html_components/Div/index.jl");
include("dash_docs/chapters/dash_html_components/Dl/index.jl");
include("dash_docs/chapters/dash_html_components/Dt/index.jl");
include("dash_docs/chapters/dash_html_components/Element/index.jl");
include("dash_docs/chapters/dash_html_components/Em/index.jl");
include("dash_docs/chapters/dash_html_components/Embed/index.jl");
include("dash_docs/chapters/dash_html_components/Fieldset/index.jl");
include("dash_docs/chapters/dash_html_components/Figcaption/index.jl");
include("dash_docs/chapters/dash_html_components/Figure/index.jl");
include("dash_docs/chapters/dash_html_components/Font/index.jl");
include("dash_docs/chapters/dash_html_components/Footer/index.jl");
include("dash_docs/chapters/dash_html_components/Form/index.jl");
include("dash_docs/chapters/dash_html_components/Frame/index.jl");
include("dash_docs/chapters/dash_html_components/Frameset/index.jl");
include("dash_docs/chapters/dash_html_components/H1/index.jl");
include("dash_docs/chapters/dash_html_components/H2/index.jl");
include("dash_docs/chapters/dash_html_components/H3/index.jl");
include("dash_docs/chapters/dash_html_components/H4/index.jl");
include("dash_docs/chapters/dash_html_components/Header/index.jl");
include("dash_docs/chapters/dash_html_components/Hgroup/index.jl");
include("dash_docs/chapters/dash_html_components/Hr/index.jl");
include("dash_docs/chapters/dash_html_components/I/index.jl");
include("dash_docs/chapters/dash_html_components/Iframe/index.jl");
include("dash_docs/chapters/dash_html_components/Img/index.jl");
include("dash_docs/chapters/dash_html_components/Ins/index.jl");
include("dash_docs/chapters/dash_html_components/Isindex/index.jl");
include("dash_docs/chapters/dash_html_components/Kbd/index.jl");
include("dash_docs/chapters/dash_html_components/Keygen/index.jl");
include("dash_docs/chapters/dash_html_components/Label/index.jl");
include("dash_docs/chapters/dash_html_components/Legend/index.jl");
include("dash_docs/chapters/dash_html_components/Li/index.jl");
include("dash_docs/chapters/dash_html_components/Link/index.jl");
include("dash_docs/chapters/dash_html_components/Listing/index.jl");
include("dash_docs/chapters/dash_html_components/Main/index.jl");
include("dash_docs/chapters/dash_html_components/MapEl/index.jl");
include("dash_docs/chapters/dash_html_components/Mark/index.jl");
include("dash_docs/chapters/dash_html_components/Marquee/index.jl");
include("dash_docs/chapters/dash_html_components/Meta/index.jl");
include("dash_docs/chapters/dash_html_components/Meter/index.jl");
include("dash_docs/chapters/dash_html_components/Multicol/index.jl");
include("dash_docs/chapters/dash_html_components/Nav/index.jl");
include("dash_docs/chapters/dash_html_components/Nextid/index.jl");
include("dash_docs/chapters/dash_html_components/Nobr/index.jl");
include("dash_docs/chapters/dash_html_components/Noscript/index.jl");
include("dash_docs/chapters/dash_html_components/ObjectEl/index.jl");
include("dash_docs/chapters/dash_html_components/Ol/index.jl");
include("dash_docs/chapters/dash_html_components/Optgroup/index.jl");
include("dash_docs/chapters/dash_html_components/Option/index.jl");
include("dash_docs/chapters/dash_html_components/Output/index.jl");
include("dash_docs/chapters/dash_html_components/P/index.jl");
include("dash_docs/chapters/dash_html_components/Param/index.jl");
include("dash_docs/chapters/dash_html_components/Picture/index.jl");
include("dash_docs/chapters/dash_html_components/Plaintext/index.jl");
include("dash_docs/chapters/dash_html_components/Pre/index.jl");
include("dash_docs/chapters/dash_html_components/Progress/index.jl");
include("dash_docs/chapters/dash_html_components/Q/index.jl");
include("dash_docs/chapters/dash_html_components/Rb/index.jl");
include("dash_docs/chapters/dash_html_components/Rp/index.jl");
include("dash_docs/chapters/dash_html_components/Rt/index.jl");
include("dash_docs/chapters/dash_html_components/Rtc/index.jl");
include("dash_docs/chapters/dash_html_components/Ruby/index.jl");
include("dash_docs/chapters/dash_html_components/S/index.jl");
include("dash_docs/chapters/dash_html_components/Samp/index.jl");
include("dash_docs/chapters/dash_html_components/Script/index.jl");
include("dash_docs/chapters/dash_html_components/Section/index.jl");
include("dash_docs/chapters/dash_html_components/Select/index.jl");
include("dash_docs/chapters/dash_html_components/Shadow/index.jl");
include("dash_docs/chapters/dash_html_components/Slot/index.jl");
include("dash_docs/chapters/dash_html_components/Small/index.jl");
include("dash_docs/chapters/dash_html_components/Source/index.jl");
include("dash_docs/chapters/dash_html_components/Spacer/index.jl");
include("dash_docs/chapters/dash_html_components/Span/index.jl");
include("dash_docs/chapters/dash_html_components/Strike/index.jl");
include("dash_docs/chapters/dash_html_components/Strong/index.jl");
include("dash_docs/chapters/dash_html_components/Sub/index.jl");
include("dash_docs/chapters/dash_html_components/Summary/index.jl");
include("dash_docs/chapters/dash_html_components/Sup/index.jl");
include("dash_docs/chapters/dash_html_components/Table/index.jl");
include("dash_docs/chapters/dash_html_components/Tbody/index.jl");
include("dash_docs/chapters/dash_html_components/Td/index.jl");
include("dash_docs/chapters/dash_html_components/Template/index.jl");
include("dash_docs/chapters/dash_html_components/Textarea/index.jl");
include("dash_docs/chapters/dash_html_components/Tfoot/index.jl");
include("dash_docs/chapters/dash_html_components/Th/index.jl");
include("dash_docs/chapters/dash_html_components/Thead/index.jl");
include("dash_docs/chapters/dash_html_components/Time/index.jl");
include("dash_docs/chapters/dash_html_components/Title/index.jl");
include("dash_docs/chapters/dash_html_components/Tr/index.jl");
include("dash_docs/chapters/dash_html_components/Track/index.jl");
include("dash_docs/chapters/dash_html_components/U/index.jl");
include("dash_docs/chapters/dash_html_components/Ul/index.jl");
include("dash_docs/chapters/dash_html_components/Var/index.jl");
include("dash_docs/chapters/dash_html_components/Video/index.jl");
include("dash_docs/chapters/dash_html_components/Wbr/index.jl");
include("dash_docs/chapters/dash_html_components/Xmp/index.jl");








for example in chapters_callbacks.examples
    example.callback!(app)
end

for example in chapters_interactive_graphing.examples
    example.callback!(app)
end

for example in chapters_sharing_data.examples
    example.callback!(app)
end

for example in chapters_dash_core_components.examples
    example.callback!(app)
end

for example in chapters_dash_core_components_dropdown.examples
    example.callback!(app)
end

for example in chapters_dash_core_components_slider.examples
    example.callback!(app)
end

for example in chapters_dash_core_components_rangeslider.examples
    example.callback!(app)
end

for example in chapters_dash_core_components_input.examples
    example.callback!(app)
end

for example in chapters_dash_core_components_textarea.examples
    example.callback!(app)
end

for example in chapters_dash_core_components_datepickersingle.examples
    example.callback!(app)
end

for example in chapters_dash_core_components_datepickerrange.examples
    example.callback!(app)
end

for example in chapters_dash_core_components_tabs.examples
    example.callback!(app)
end

for example in chapters_dash_core_components_upload.examples
    example.callback!(app)
end

for example in chapters_dash_core_components_download.examples
    example.callback!(app)
end

for example in chapters_dash_core_components_graph.examples
    example.callback!(app)
end

for example in chapters_dash_core_components_confirmdialog.examples
    example.callback!(app)
end

for example in chapters_dash_core_components_confirmprovider.examples
    example.callback!(app)
end

for example in chapters_dash_core_components_store.examples
    example.callback!(app)
end


for example in chapters_dash_html_components.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_a.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_abbr.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_acronym.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_address.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_area.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_article.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_aside.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_audio.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_b.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_base.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_basefont.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_bdi.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_bdo.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_big.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_blink.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_blockquote.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_br.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_button.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_canvas.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_caption.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_center.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_cite.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_code.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_col.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_colgroup.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_command.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_content.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_data.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_datalist.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_dd.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_del.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_details.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_dialog.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_div.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_dl.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_dt.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_element.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_em.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_embed.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_fieldset.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_figcaption.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_figure.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_font.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_footer.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_form.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_frame.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_frameset.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_h1.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_h2.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_h3.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_h4.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_hgroup.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_hr.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_i.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_iframe.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_img.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_ins.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_isindex.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_kbd.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_keygen.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_label.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_legend.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_li.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_link.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_listing.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_main.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_mapei.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_mark.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_marquee.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_meta.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_meter.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_multicol.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_nav.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_nextid.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_nobr.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_noscript.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_objectel.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_ol.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_optgroup.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_option.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_output.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_p.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_param.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_picture.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_plaintext.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_pre.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_progress.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_q.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_rb.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_rp.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_rt.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_rtc.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_ruby.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_s.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_samp.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_script.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_section.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_select.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_shadow.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_slot.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_small.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_source.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_spacer.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_span.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_strike.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_strong.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_sub.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_summary.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_sup.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_table.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_tbody.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_td.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_template.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_textarea.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_tfoot.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_th.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_thead.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_time.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_time.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_title.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_tr.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_track.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_u.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_ui.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_var.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_video.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_wbr.examples
    example.callback!(app)
end

for example in chapters_dash_html_components_xmp.examples
    example.callback!(app)
end

header = html_div(
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
);

app.layout = html_div() do
    html_div(id = "wait-for-layout"),
    dcc_location(id = "url", refresh=false),
    header,
    html_div(
        className = "content-wrapper",
        children = (
            html_div(
                (
                    html_div(id = "backlinks-top", className = "backlinks"),
                    html_div(
                        html_div(id = "chapter", className = "content"), # the children of this component is the layout of a dash app, based on URL
                        className = "content-container",
                        style = Dict("margin" => "70px")
                    ),
                    html_div(id = "backlinks-bottom", className = "backlinks")
                ),
                className = "rhs-content container-width"
            ),
            dugc_pagemenu(id = "pagemenu")
        )
    )
end;

callback!(app,
    Output("chapter", "children"),
    Output("pagemenu", "dummy2"),
    Input("url", "pathname")) do pathname
       get_content(pathname) = @match pathname begin
            "/introduction" => chapters_whats_dash.app.layout
            "/installation" => chapters_installation.app.layout
            "/getting-started" => chapters_getting_started.app.layout
            "/basic-callbacks" => chapters_callbacks.app.layout
            "/interactive-graphing" => chapters_interactive_graphing.app.layout
            "/sharing-data-between-callbacks" => chapters_sharing_data.app.layout
            "/deployment" => chapters_deployment.app.layout
            "/faqs" => chapters_faq_gotchas.app.layout
            "/dash_core_components" => chapters_dash_core_components.app.layout
            "/dash_core_components/dropdown" => chapters_dash_core_components_dropdown.app.layout
            "/dash_core_components/slider" => chapters_dash_core_components_slider.app.layout
            "/dash_core_components/rangeslider" => chapters_dash_core_components_rangeslider.app.layout
            "/dash_core_components/input" => chapters_dash_core_components_input.app.layout
            "/dash_core_components/textarea" => chapters_dash_core_components_textarea.app.layout
            "/dash_core_components/checklist" => chapters_dash_core_components_checklist.app.layout
            "/dash_core_components/radioitems" => chapters_dash_core_components_radioitems.app.layout
            "/dash_core_components/datepickersingle" => chapters_dash_core_components_datepickersingle.app.layout
            "/dash_core_components/datepickerrange" => chapters_dash_core_components_datepickerrange.app.layout
            "/dash_core_components/markdown" => chapters_dash_core_components_markdown.app.layout
            "/dash_core_components/tabs" => chapters_dash_core_components_tabs.app.layout
            "/dash_core_components/upload" => chapters_dash_core_components_upload.app.layout
            "/dash_core_components/download" => chapters_dash_core_components_download.app.layout
            "/dash_core_components/graph" => chapters_dash_core_components_graph.app.layout
            "/dash_core_components/confirmdialog" => chapters_dash_core_components_confirmdialog.app.layout
            "/dash_core_components/confirmprovider" => chapters_dash_core_components_confirmprovider.app.layout
            "/dash_core_components/store" => chapters_dash_core_components_store.app.layout


            "/dash_html_components" => chapters_dash_html_components.app.layout
            "/dash_html_components/a" => chapters_dash_html_components_a.app.layout
            "/dash_html_components/abbr" => chapters_dash_html_components_abbr.app.layout
            "/dash_html_components/acronym" => chapters_dash_html_components_acronym.app.layout
            "/dash_html_components/address" => chapters_dash_html_components_address.app.layout
            "/dash_html_components/area" => chapters_dash_html_components_area.app.layout
            "/dash_html_components/article" => chapters_dash_html_components_article.app.layout
            "/dash_html_components/aside" => chapters_dash_html_components_aside.app.layout
            "/dash_html_components/audio" => chapters_dash_html_components_audio.app.layout
            "/dash_html_components/b" => chapters_dash_html_components_b.app.layout
            "/dash_html_components/base" => chapters_dash_html_components_base.app.layout
            "/dash_html_components/base" => chapters_dash_html_components_base.app.layout
            "/dash_html_components/basefont" => chapters_dash_html_components_basefont.app.layout
            "/dash_html_components/bdi" => chapters_dash_html_components_bdi.app.layout
            "/dash_html_components/bdo" => chapters_dash_html_components_bdo.app.layout
            "/dash_html_components/big" => chapters_dash_html_components_big.app.layout
            "/dash_html_components/blink" => chapters_dash_html_components_blink.app.layout
            "/dash_html_components/blockquote" => chapters_dash_html_components_blockquote.app.layout
            "/dash_html_components/br" => chapters_dash_html_components_br.app.layout
            "/dash_html_components/button" => chapters_dash_html_components_button.app.layout
            "/dash_html_components/canvas" => chapters_dash_html_components_canvas.app.layout
            "/dash_html_components/caption" => chapters_dash_html_components_caption.app.layout
            "/dash_html_components/center" => chapters_dash_html_components_center.app.layout
            "/dash_html_components/cite" => chapters_dash_html_components_cite.app.layout
            "/dash_html_components/code" => chapters_dash_html_components_code.app.layout
            "/dash_html_components/col" => chapters_dash_html_components_col.app.layout
            "/dash_html_components/colgroup" => chapters_dash_html_components_colgroupm.app.layout
            "/dash_html_components/command" => chapters_dash_html_components_command.app.layout
            "/dash_html_components/content" => chapters_dash_html_components_content.app.layout
            "/dash_html_components/data" => chapters_dash_html_components_data.app.layout
            "/dash_html_components/datalist" => chapters_dash_html_components_datalist.app.layout
            "/dash_html_components/dd" => chapters_dash_html_components_dd.app.layout
            "/dash_html_components/del" => chapters_dash_html_components_del.app.layout
            "/dash_html_components/details" => chapters_dash_html_components_details.app.layout
            "/dash_html_components/dfn" => chapters_dash_html_components_dfn.app.layout
            "/dash_html_components/dialog" => chapters_dash_html_components_dialog.app.layout
            "/dash_html_components/div" => chapters_dash_html_components_div.app.layout
            "/dash_html_components/dl" => chapters_dash_html_components_dl.app.layout
            "/dash_html_components/dt" => chapters_dash_html_components_dt.app.layout
            "/dash_html_components/element" => chapters_dash_html_components_element.app.layout
            "/dash_html_components/em" => chapters_dash_html_components_em.app.layout
            "/dash_html_components/embed" => chapters_dash_html_components_embed.app.layout
            "/dash_html_components/fieldset" => chapters_dash_html_components_fieldset.app.layout
            "/dash_html_components/figcaption" => chapters_dash_html_components_figcaption.app.layout
            "/dash_html_components/figure" => chapters_dash_html_components_figure.app.layout
            "/dash_html_components/font" => chapters_dash_html_components_font.app.layout
            "/dash_html_components/footer" => chapters_dash_html_components_footer.app.layout
            "/dash_html_components/form" => chapters_dash_html_components_form.app.layout
            "/dash_html_components/frame" => chapters_dash_html_components_frame.app.layout
            "/dash_html_components/frameset" => chapters_dash_html_components_frameset.app.layout
            "/dash_html_components/h1" => chapters_dash_html_components_h1.app.layout
            "/dash_html_components/h2" => chapters_dash_html_components_h2.app.layout
            "/dash_html_components/h3" => chapters_dash_html_components_h3.app.layout
            "/dash_html_components/h4" => chapters_dash_html_components_h4.app.layout
            "/dash_html_components/header" => chapters_dash_html_components_header.app.layout
            "/dash_html_components/hgroup" => chapters_dash_html_components_hgroup.app.layout
            "/dash_html_components/hr" => chapters_dash_html_components_hr.app.layout
            "/dash_html_components/i" => chapters_dash_html_components_i.app.layout
            "/dash_html_components/iframe" => chapters_dash_html_components_iframe.app.layout
            "/dash_html_components/img" => chapters_dash_html_components_img.app.layout
            "/dash_html_components/ins" => chapters_dash_html_components_ins.app.layout
            "/dash_html_components/isindex" => chapters_dash_html_components_isindex.app.layout
            "/dash_html_components/kbd" => chapters_dash_html_components_kbd.app.layout
            "/dash_html_components/keygen" => chapters_dash_html_components_keygen.app.layout
            "/dash_html_components/label" => chapters_dash_html_components_label.app.layout
            "/dash_html_components/legend" => chapters_dash_html_components_legend.app.layout
            "/dash_html_components/li" => chapters_dash_html_components_li.app.layout
            "/dash_html_components/link" => chapters_dash_html_components_link.app.layout
            "/dash_html_components/listing" => chapters_dash_html_components_listing.app.layout
            "/dash_html_components/main" => chapters_dash_html_components_main.app.layout
            "/dash_html_components/mapel" => chapters_dash_html_components_mapel.app.layout
            "/dash_html_components/mark" => chapters_dash_html_components_mark.app.layout
            "/dash_html_components/marquee" => chapters_dash_html_components_marquee.app.layout
            "/dash_html_components/meta" => chapters_dash_html_components_meta.app.layout
            "/dash_html_components/meter" => chapters_dash_html_components_meter.app.layout
            "/dash_html_components/multicol" => chapters_dash_html_components_multicol.app.layout
            "/dash_html_components/nav" => chapters_dash_html_components_nav.app.layout
            "/dash_html_components/nextid" => chapters_dash_html_components_nextid.app.layout
            "/dash_html_components/nobr" => chapters_dash_html_components_nobr.app.layout
            "/dash_html_components/noscript" => chapters_dash_html_components_noscript.app.layout
            "/dash_html_components/objectel" => chapters_dash_html_components_objectel.app.layout
            "/dash_html_components/ol" => chapters_dash_html_components_ol.app.layout
            "/dash_html_components/optgroup" => chapters_dash_html_components_optgroup.app.layout
            "/dash_html_components/option" => chapters_dash_html_components_option.app.layout
            "/dash_html_components/output" => chapters_dash_html_components_output.app.layout
            "/dash_html_components/p" => chapters_dash_html_components_p.app.layout
            "/dash_html_components/param" => chapters_dash_html_components_param.app.layout
            "/dash_html_components/picture" => chapters_dash_html_components_picture.app.layout
            "/dash_html_components/plaintext" => chapters_dash_html_components_plaintext.app.layout
            "/dash_html_components/pre" => chapters_dash_html_components_pre.app.layout
            "/dash_html_components/progress" => chapters_dash_html_components_progress.app.layout
            "/dash_html_components/q" => chapters_dash_html_components_q.app.layout
            "/dash_html_components/rb" => chapters_dash_html_components_rb.app.layout
            "/dash_html_components/rp" => chapters_dash_html_components_rp.app.layout
            "/dash_html_components/rt" => chapters_dash_html_components_rt.app.layout
            "/dash_html_components/rtc" => chapters_dash_html_components_rtc.app.layout
            "/dash_html_components/ruby" => chapters_dash_html_components_ruby.app.layout
            "/dash_html_components/s" => chapters_dash_html_components_s.app.layout
            "/dash_html_components/samp" => chapters_dash_html_components_samp.app.layout
            "/dash_html_components/script" => chapters_dash_html_components_script.app.layout
            "/dash_html_components/section" => chapters_dash_html_components_section.app.layout
            "/dash_html_components/select" => chapters_dash_html_components_select.app.layout
            "/dash_html_components/shadow" => chapters_dash_html_components_shadow.app.layout
            "/dash_html_components/slot" => chapters_dash_html_components_slot.app.layout
            "/dash_html_components/small" => chapters_dash_html_components_small.app.layout
            "/dash_html_components/source" => chapters_dash_html_components_source.app.layout
            "/dash_html_components/spacer" => chapters_dash_html_components_spacer.app.layout
            "/dash_html_components/span" => chapters_dash_html_components_span.app.layout
            "/dash_html_components/strike" => chapters_dash_html_components_strike.app.layout
            "/dash_html_components/strong" => chapters_dash_html_components_strong.app.layout
            "/dash_html_components/sub" => chapters_dash_html_components_sub.app.layout
            "/dash_html_components/summary" => chapters_dash_html_components_summary.app.layout
            "/dash_html_components/sup" => chapters_dash_html_components_sup.app.layout
            "/dash_html_components/table" => chapters_dash_html_components_table.app.layout
            "/dash_html_components/td" => chapters_dash_html_components_td.app.layout
            "/dash_html_components/template" => chapters_dash_html_components_template.app.layout
            "/dash_html_components/textarea" => chapters_dash_html_components_textarea.app.layout
            "/dash_html_components/tfoot" => chapters_dash_html_components_tfoot.app.layout
            "/dash_html_components/th" => chapters_dash_html_components_th.app.layout
            "/dash_html_components/thead" => chapters_dash_html_components_thead.app.layout
            "/dash_html_components/time" => chapters_dash_html_components_time.app.layout
            "/dash_html_components/title" => chapters_dash_html_components_title.app.layout
            "/dash_html_components/tr" => chapters_dash_html_components_tr.app.layout
            "/dash_html_components/track" => chapters_dash_html_components_track.app.layout
            "/dash_html_components/u" => chapters_dash_html_components_u.app.layout
            "/dash_html_components/ul" => chapters_dash_html_components_ul.app.layout
            "/dash_html_components/var" => chapters_dash_html_components_var.app.layout
            "/dash_html_components/video" => chapters_dash_html_components_video.app.layout
            "/dash_html_components/wbr" => chapters_dash_html_components_wbr.app.layout
            "/dash_html_components/xmp" => chapters_dash_html_components_xmp.app.layout            
            _ => html_div() do
                html_br(),
                html_h1("Dash for Julia User Guide"),
                Section(
                    "What's Dash?",
                    (
                        Chapter(
                            "Introduction",
                            "/introduction",
                            "A quick paragraph about Dash and a link to the talk at Plotcon that started it all."
                        ),
                        Chapter(
                            "Announcement Essay",
                            "https://medium.com/plotly/announcing-dash-for-julia-f017c90c6ef1",
                            "Our extended essay on Dash. An extended discussion of Dash's architecture and our motivation behind the project."
                        ),
                        Chapter(
                            "Dash App Gallery",
                            "https://dash.plotly.com/gallery",
                            "A glimpse into what's possible with Dash."
                        ),
                        Chapter(
                            "Dash Club",
                            "https://plot.us12.list-manage.com/subscribe?u=28d7f8f0685d044fb51f0d4ee&id=0c1cb734d7",
                            "A fortnightly email newsletter by chriddyp, the creator of Dash."
                        )
                    )
                ),
                Section(
                "Dash Tutorial",
                (
                    Chapter(
                        "Part 1. Installation",
                        "/installation",
                        "How to install and upgrade Dash libraries with the Pkg package manager."
                    ),
                    Chapter(
                        "Part 2. The Dash Layout",
                        "/getting-started",
                        "The Dash `layout` describes what your app will look like and is composed of a set of declarative Dash components."
                    ),
                    Chapter(
                        "Part 3. Basic Callbacks",
                        "/basic-callbacks",
                        "Dash apps are made interactive through Dash Callbacks:
                        Julia functions that are automatically called whenever an input component's property changes. Callbacks can be chained,
                        allowing one update in the UI to trigger several updates across the app."
                    ),
                    Chapter(
                        "Part 4. Interactive Graphing and Crossfiltering",
                        "/interactive-graphing",
                        "Bind interactivity to the Dash `Graph` component whenever you hover, click, or
                        select points on your chart."
                    ),
                    Chapter(
                        "Part 5. Sharing Data Between Callbacks",
                        "/sharing-data-between-callbacks",
                        "`global` variables will break your Dash apps. However, there are other ways
                        to share data between callbacks. This chapter is useful for callbacks that
                        run expensive data processing tasks or process large data."
                    ),
                    Chapter(
                        "Part 6. FAQs and Gotchas",
                        "/faqs",
                        "If you have read through the rest of the tutorial and still have questions
                        or are encountering unexpected behaviour, this chapter may be useful."
                        )
                    )
                ),

                Section(
                    "Open Source Component Libraries",
                    (
                        Chapter(
                            "Dash Core Components",
                            "/dash_core_components",
                            "The Dash Core Component library contains a set of higher-level components like sliders, graphs, dropdowns, tables, and more."
                        ),
                        Chapter(
                            "Dash HTML Components",
                            "/dash_html_components",
                            "The Dash HTML Components library contains a set of components like button, div, form and more."
                        ),
                    )
                ),
                Section(
                    "Production",
                    (
                        Chapter(
                            "Deployment",
                            "/deployment",
                            ""
                        )
                    )
                )
            end
        end
    return get_content(pathname), ""
end;

callback!(
    ClientsideFunction("clientside", "pagemenu"),
    app,
    Output("pagemenu", "dummy"),
    Input("chapter", "children")
)

port = parse(Int64, ENV["PORT"])

print("Binding to PORT $(port)...")

run_server(app, "0.0.0.0", port)
