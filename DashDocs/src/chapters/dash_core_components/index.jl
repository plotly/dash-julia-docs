include("Dropdown/index.jl");
include("Slider/index.jl");
include("RangeSlider/index.jl");
include("Input/index.jl");
include("Textarea/index.jl");
include("Checklist/index.jl");
include("RadioItems/index.jl");
include("DatePickerSingle/index.jl");
include("DatePickerRange/index.jl");
include("Markdown/index.jl");
include("Tabs/index.jl");
include("Upload/index.jl");
include("Download/index.jl");
include("Graph/index.jl");
include("ConfirmDialog/index.jl");
include("ConfirmDialogProvider/index.jl");
include("Store/index.jl");

@doc_chapter "/dash_core_components" begin
    @example dropdown_index_example "dropdown_index_example.jl"
    @example slider_index_example "slider_index_example.jl"
    @example slider_with_marks "slider_with_marks.jl"
    @example rangeslider_index_example "rangeslider_index_example.jl"
    @example rangeslider_with_marks "rangeslider_with_marks.jl"
    @example input_index_example "input_index_example.jl"
    @example textarea_index_example "textarea_index_example.jl"
    @example checkboxes_index_example "checkboxes_index_example.jl"
    @example checkboxes_inline_index_example "checkboxes_inline_index_example.jl"
    @example radioitems_index_example "radioitems_index_example.jl"
    @example radioitems_inline_index_example "radioitems_inline_index_example.jl"
    @example button_index_example "button_index_example.jl"
    @example datepickersingle_index_example "datepickersingle_index_example.jl"
    @example datepickerrange_index_example "datepickerrange_index_example.jl"
    @example markdown_index_example "markdown_index_example.jl"
    @example upload_index_example "upload_index_example.jl"
    @example download_index_example "download_index_example.jl"
    @example tabs_index_example "tabs_index_example.jl"
    @example graph_index_example "graph_index_example.jl"
    @example confirm_dialog_index_example "confirm_dialog_index_example.jl"
    @example confirm_dialog_clicked_index_example "confirm_dialog_clicked_index_example.jl"
    @example store_index_example "store_index_example.jl"
    @example loading_index_example "loading_index_example.jl"
    @example location_index_example "location_index_example.jl"

    @layout html_div() do

        html_h1("Dash Core Components"),

        dcc_markdown("
        Dash ships with supercharged components for interactive user interfaces. A core set of components, written and maintained by the Dash team, is available in the `DashCoreComponents` library.

        For production Dash apps, the Dash Core Components styling & layout should be managed with Dash Enterprise [Design Kit](https://plotly.com/dash/design-kit).

        The source is on GitHub at [plotly/dash-core-components](https://github.com/plotly/dash-core-components).

        These docs are using version $(pkgver"DashCoreComponents")."),

        html_a(html_h3("Dropdown"), href="/dash_core_components/dropdown"),

        source"dropdown_index_example",
        layout"dropdown_index_example",

        html_a(html_h3("Slider"), href="/dash_core_components/slider"),

        source"slider_index_example",
        layout"slider_index_example",

        source"slider_with_marks",
        layout"slider_with_marks",

        html_a(html_h3("RangeSlider"), href="/dash_core_components/rangeslider"),

        source"rangeslider_index_example",
        layout"rangeslider_index_example",

        source"rangeslider_with_marks",
        layout"rangeslider_with_marks",

        #Input
        html_a(html_h3("Input"), href="/dash_core_components/input"),

        source"input_index_example",
        layout"input_index_example",

        #TextArea
        html_a(html_h3("TextArea"), href="/dash_core_components/textarea"),

        source"textarea_index_example",
        layout"textarea_index_example",

        #checkboxes
        html_a(html_h3("CheckBoxes"), href="/dash_core_components/checklist"),

        source"checkboxes_index_example",
        layout"checkboxes_index_example",

        source"checkboxes_inline_index_example",
        layout"checkboxes_inline_index_example",

        #radioitems
        html_a(html_h3("RadioItems"), href="/dash_core_components/radioitems"),

        source"radioitems_index_example",
        layout"radioitems_index_example",

        source"radioitems_inline_index_example",
        layout"radioitems_inline_index_example",

        #button
        html_a(html_h3("Button"), href="#"),

        dcc_markdown(
            "There actually is no `Button` component in `DashCoreComponents`.
            The regular `DashHtmlComponents.Button` component does the job quite well, but we've included
            it here because this is the one plain `html` component that's commonly used as a callback input:"
        ),
        source"button_index_example",
        layout"button_index_example",

        #datepickersingle
        html_a(html_h3("DatePickerSingle"), href="/dash_core_components/datepickersingle"),

        source"datepickersingle_index_example",
        layout"datepickersingle_index_example",

        #datepickerrange
        html_a(html_h3("DatePickerRange"), href="/dash_core_components/datepickerrange"),

        source"datepickerrange_index_example",
        layout"datepickerrange_index_example",

        #markdown
        html_a(html_h3("Markdown"), href="/dash_core_components/markdown"),

        source"markdown_index_example",
        layout"markdown_index_example",

        #upload
        html_a(html_h3("Upload"), href="/dash_core_components/upload"),

        dcc_markdown("
        The `dcc_upload` component allows users to upload
        files into your app through drag-and-drop or the system's native file explorer.
        "),
        source"upload_index_example",
        layout"upload_index_example",

        #download
        html_a(html_h3("Download"), href="/dash_core_components/download"),

        dcc_markdown(
            "The `dcc_download` component allows users to download
            files from your app through their browser."
        ),
        source"download_index_example",
        layout"download_index_example",

        #tabs
        html_a(html_h3("Tabs"), href="/dash_core_components/tabs"),

        dcc_markdown("The Tabs and Tab components can be used to create tabbed sections in your app."),
        source"tabs_index_example",
        layout"tabs_index_example",

        #graphs
        html_a(html_h3("Graph"), href="/dash_core_components/graph"),

        source"graph_index_example",
        layout"graph_index_example",

        #confirm_dialog
        html_a(html_h3("ConfirmDialog"), href="/dash_core_components/confirmdialog"),

        dcc_markdown("
        The `dcc_confirmdialog` component send a dialog to the browser
        asking the user to confirm or cancel with a custom message.
        "),
        source"confirm_dialog_index_example",
        layout"confirm_dialog_index_example",

        dcc_markdown(
            "There is also a `dcc_confirmdialogprovider`, it will automatically
            wrap a child component to send a `dcc_confirmdialog when clicked"
        ),

        source"confirm_dialog_clicked_index_example",
        layout"confirm_dialog_clicked_index_example",

        #store
        html_a(html_h3("Store"), href="/dash_core_components/store"),

        dcc_markdown(
            "The store component can be used to keep data in the visitor's browser. The data is scoped to the user accessing the page.

            **Three types of storage (storage_type prop):**

            1. `memory`: default, keep the data as long the page is not refreshed.
            2. `local`: keep the data until it is manually cleared.
            3. `session`: keep the data until the browser/tab closes.

            For `local/session`, the data is serialized as json when stored."
        ),
        source"store_index_example",
        layout"store_index_example",
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
        source"loading_index_example",
        layout"loading_index_example",

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
        source"location_index_example"
        # location_index_example.layout

    end
end
