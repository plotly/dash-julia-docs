module chapters_dash_core_components

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

dropdown_index_example = LoadExampleCode(string(examples_path, "/dropdown_index_example.jl"))

slider_index_example = LoadExampleCode(string(examples_path, "/slider_index_example.jl"))

slider_with_marks = LoadExampleCode(string(examples_path, "/slider_with_marks.jl"))

rangeslider_index_example = LoadExampleCode(string(examples_path, "/rangeslider_index_example.jl"))

rangeslider_with_marks = LoadExampleCode(string(examples_path, "/rangeslider_with_marks.jl"))

input_index_example = LoadExampleCode(string(examples_path, "/input_index_example.jl"))

textarea_index_example = LoadExampleCode(string(examples_path, "/textarea_index_example.jl"))

checkboxes_index_example = LoadExampleCode(string(examples_path, "/checkboxes_index_example.jl"))

checkboxes_inline_index_example = LoadExampleCode(string(examples_path, "/checkboxes_inline_index_example.jl"))

radioitems_index_example = LoadExampleCode(string(examples_path, "/radioitems_index_example.jl"))

radioitems_inline_index_example = LoadExampleCode(string(examples_path, "/radioitems_inline_index_example.jl"))

button_index_example = LoadExampleCode(string(examples_path, "/button_index_example.jl"))

datepickersingle_index_example = LoadExampleCode(string(examples_path, "/datepickersingle_index_example.jl"))

datepickerrange_index_example = LoadExampleCode(string(examples_path, "/datepickerrange_index_example.jl"))

markdown_index_example = LoadExampleCode(string(examples_path, "/markdown_index_example.jl"))

upload_index_example = LoadExampleCode(string(examples_path, "/upload_index_example.jl"))

download_index_example = LoadExampleCode(string(examples_path, "/download_index_example.jl"))

tabs_index_example = LoadExampleCode(string(examples_path, "/tabs_index_example.jl"))

graph_index_example = LoadExampleCode(string(examples_path, "/graph_index_example.jl"))

confirm_dialog_index_example = LoadExampleCode(string(examples_path, "/confirm_dialog_index_example.jl"))

confirm_dialog_clicked_index_example = LoadExampleCode(string(examples_path, "/confirm_dialog_clicked_index_example.jl"))

store_index_example = LoadExampleCode(string(examples_path, "/store_index_example.jl"))

loading_index_example = LoadExampleCode(string(examples_path, "/loading_index_example.jl"))

location_index_example = LoadExampleCode(string(examples_path, "/location_index_example.jl"))


examples = [
    dropdown_index_example, button_index_example,upload_index_example, 
    download_index_example, tabs_index_example
]

app =  dash()
dropdown_index_example.callback!(app)
button_index_example.callback!(app)
upload_index_example.callback!(app)
download_index_example.callback!(app)
tabs_index_example.callback!(app)

n = get_pkg_version("DashCoreComponents")

app.layout = html_div() do

    html_h1("Dash Core Components"),

    dcc_markdown("
    Dash ships with supercharged components for interactive user interfaces. A core set of components, written and maintained by the Dash team, is available in the `DashCoreComponents` library.

    For production Dash apps, the Dash Core Components styling & layout should be managed with Dash Enterprise [Design Kit](https://plotly.com/dash/design-kit).

    The source is on GitHub at [plotly/dash-core-components](https://github.com/plotly/dash-core-components).

    These docs are using version $n."),

    html_a(html_h3("Dropdown"), href="/dash_core_components/dropdown"),

    dropdown_index_example.source_code,
    dropdown_index_example.layout,

    html_a(html_h3("Slider"), href="/dash_core_components/slider"),

    slider_index_example.source_code,
    slider_index_example.layout,

    slider_with_marks.source_code,
    slider_with_marks.layout,

    html_a(html_h3("RangeSlider"), href="/dash_core_components/rangeslider"),

    rangeslider_index_example.source_code,
    rangeslider_index_example.layout,

    rangeslider_with_marks.source_code,
    rangeslider_with_marks.layout,

    #Input
    html_a(html_h3("Input"), href="/dash_core_components/input"),

    input_index_example.source_code,
    input_index_example.layout,

    #TextArea
    html_a(html_h3("TextArea"), href="/dash_core_components/textarea"),

    textarea_index_example.source_code,
    textarea_index_example.layout,
    
    #checkboxes
    html_a(html_h3("CheckBoxes"), href="/dash_core_components/checklist"),

    checkboxes_index_example.source_code,
    checkboxes_index_example.layout,

    checkboxes_inline_index_example.source_code,
    checkboxes_inline_index_example.layout,

    #radioitems
    html_a(html_h3("RadioItems"), href="/dash_core_components/radioitems"),

    radioitems_index_example.source_code,
    radioitems_index_example.layout,

    radioitems_inline_index_example.source_code,
    radioitems_inline_index_example.layout,

    #button
    html_a(html_h3("Button"), href="#"),
    
    dcc_markdown(
        "There actually is no `Button` component in `DashCoreComponents`. 
        The regular `DashHtmlComponents.Button` component does the job quite well, but we've included
        it here because this is the one plain `html` component that's commonly used as a callback input:"
    ),
    button_index_example.source_code,
    button_index_example.layout,

    #datepickersingle
    html_a(html_h3("DatePickerSingle"), href="/dash_core_components/datepickersingle"),

    datepickersingle_index_example.source_code,
    datepickersingle_index_example.layout,

    #datepickerrange
    html_a(html_h3("DatePickerRange"), href="/dash_core_components/datepickerrange"),

    datepickerrange_index_example.source_code,
    datepickerrange_index_example.layout,

    #markdown
    html_a(html_h3("Markdown"), href="/dash_core_components/markdown"),

    markdown_index_example.source_code,
    markdown_index_example.layout,

    #upload
    html_a(html_h3("Upload"), href="/dash_core_components/upload"),
    
    dcc_markdown("
    The `dcc_upload` component allows users to upload
     files into your app through drag-and-drop or the system's native file explorer.
    "),
    upload_index_example.source_code,
    upload_index_example.layout,

    #download
    html_a(html_h3("Download"), href="/dash_core_components/download"),
    
    dcc_markdown(
        "The `dcc_download` component allows users to download 
        files from your app through their browser."
    ),
    download_index_example.source_code,
    download_index_example.layout,

    #tabs
    html_a(html_h3("Tabs"), href="/dash_core_components/tabs"),
    
    dcc_markdown("The Tabs and Tab components can be used to create tabbed sections in your app."),
    tabs_index_example.source_code,
    tabs_index_example.layout,

    #graphs
    html_a(html_h3("Graph"), href="/dash_core_components/graph"),

    graph_index_example.source_code,
    graph_index_example.layout,

    #confirm_dialog
    html_a(html_h3("ConfirmDialog"), href="#"),
    
    dcc_markdown("
    The `dcc_confirmdialog` component send a dialog to the browser 
    asking the user to confirm or cancel with a custom message.
    "),
    confirm_dialog_index_example.source_code,
    confirm_dialog_index_example.layout,

    dcc_markdown(
        "There is also a `dcc_confirmdialogprovider`, it will automatically 
        wrap a child component to send a `dcc_confirmdialog when clicked"
    ),

    confirm_dialog_clicked_index_example.source_code,
    confirm_dialog_clicked_index_example.layout,

    #store
    html_a(html_h3("Store"), href="#"),
    
    dcc_markdown(
        "The store component can be used to keep data in the visitor's browser. The data is scoped to the user accessing the page.

        **Three types of storage (storage_type prop):**
        
        1. `memory`: default, keep the data as long the page is not refreshed.
        2. `local`: keep the data until it is manually cleared.
        3. `session`: keep the data until the browser/tab closes.
        
        For `local/session`, the data is serialized as json when stored."
    ),
    store_index_example.source_code,
    store_index_example.layout,
    dcc_markdown(
        "The store must be used with callbacks"
    ),
    #loading
    html_a(html_h3("Loading"), href="#"),
    
    dcc_markdown(
        "The Loading component can be used to wrap components that you want to display
         a spinner for, if they take too long to load. It does this by checking if any
         of the Loading components' children have a `loading_state` prop set where
          `is_loading` is true. If true, it will display one of the built-in CSS spinners."
    ),
    loading_index_example.source_code,
    loading_index_example.layout,

    #location
    html_a(html_h3("Location"), href="#"),
    
    dcc_markdown(
        "The `location` component represents the location bar in your web browser. 
        Through its `href`, `pathname`, `search` and `hash` properties you can access different portions of your app's url.

        For example, given the url http://127.0.0.1:8050/page-2?a=test#quiz:
        
        * href = 'http://127.0.0.1:8050/page-2?a=test#quiz'
        * pathname = '/page-2'
        * search = '?a=test'
        * hash = '#quiz'
        "
    ),
    location_index_example.source_code
    # location_index_example.layout
    
end

end
