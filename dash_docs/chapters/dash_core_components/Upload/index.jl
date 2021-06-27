module chapters_dash_core_components_upload

using Dash, DashHtmlComponents, DashCoreComponents

include("../../../utils.jl")

export examples

examples_path = joinpath(@__DIR__, "examples")

upload_datafile = LoadExampleCode(string(examples_path, "/upload_datafile.jl"))

upload_image = LoadExampleCode(string(examples_path, "/upload_image.jl"))

upload_gallery = LoadExampleCode(string(examples_path, "/upload_gallery.jl"))

examples = [upload_datafile, upload_image]

app =  dash()

app.layout = html_div() do

    html_h1("Upload Component"),
    
    dcc_markdown(
      "The Dash upload component allows your app's viewers to upload files, 
      like excel spreadsheets or images, into your application. Your Dash 
      app can access the `contents` of an upload by listening to the contents
       property of the `dcc_upload `component."
    ),

    dcc_markdown("`contents` is a base64 encoded string that contains the files `contents`,
       no matter what type of file: text files, images, zip files, excel
        spreadsheets, etc."
    ),     

    dcc_markdown(" Here's an example that parses CSV or Excel files and displays the results
       in a table. Note that this example uses the DataTable from the DashTable
        project."
    ),

    upload_datafile.source_code,
    upload_datafile.layout,

    dcc_markdown(
      "This example responds to image uploads by displaying them in 
      the app with the `html_img` component."
    ),

    upload_image.source_code,
    upload_image.layout,

    dcc_markdown(
      "The children attribute of the Upload component accepts any Dash component.
       Clicking on the children element will trigger the upload action, as will
      dragging and dropping files. Here are a few different ways that you could
      style the upload component using standard dash components."
    ),

    upload_gallery.source_code,
    upload_gallery.layout,

    dcc_markdown(
      "```julia
      Access this documentation in your Python terminal with:
      
      help?> DashCoreComponents.dcc_upload
      
      Our recommended IDE for writing Dash apps is Dash Enterprise's Data Science Workspaces, which has typeahead support for Dash Component Properties. Find out if your company is using Dash Enterprise.
      ```"
    ),
    
    dcc_markdown(
      "`children` (a list of or a singular dash component, string or number | string; optional): Contents of the upload component."),

      dcc_markdown("  `id` (string; optional): The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.
      
      "),

      dcc_markdown("`accept` (string; optional): Allow specific types of files. See [https://github.com/okonet/attr-accept](https://github.com/okonet/attr-accept) for more information. Keep in mind that mime type determination is not reliable across platforms. CSV files, for example, are reported as text/plain under macOS but as application/vnd.ms-excel under Windows. In some cases there might not be a mime type set at all. See: [https://github.com/react-dropzone/react-dropzone/issues/276](https://github.com/react-dropzone/react-dropzone/issues/276).
      
      "),

      dcc_markdown("`className` (String; optional): HTML class name of the component.
      
      "),

      dcc_markdown("`className_active` (String; optional): HTML class name of the component while active.
      
      "),

      dcc_markdown("`className_disabled` (String; optional): HTML class name of the component if disabled.
      
      "),

      dcc_markdown("`className_reject` (String; optional): HTML class name of the component if rejected.
      
      "),

      dcc_markdown("`contents` (String | list of strings; optional): The contents of the uploaded file as a binary string.
      
      "),

      dcc_markdown("`disable_click` (Boolean; default `false`): Disallow clicking on the component to open the file dialog.
      
      "),

      dcc_markdown("`disabled` (Boolean; default `fasle`): Enable/disable the upload component entirely.
      
      "),

      dcc_markdown("`filename` (String | list of strings; optional): The name of the file(s) that was(were) uploaded. Note that this does not include the path of the file (for security reasons).
      
      "),

      dcc_markdown("`last_modified` (Number | list of numbers; optional): The last modified date of the file that was uploaded in unix time (seconds since 1970).
      
      "),

      dcc_markdown("`loading_state` (Dict; optional): Object that holds the loading state object coming from dash-renderer.
      
      "),

      dcc_markdown("`loading_state` is a Dict with keys:
      
      "),

      dcc_markdown("
        * `component_name` (String; optional): Holds the name of the component that is loading.
        * `is_loading` (Boolean; optional): Determines if the component is loading or not.
      
      "),

      dcc_markdown("`prop_name` (String; optional): Holds which property is loading.
      
      "),

      dcc_markdown("`max_size` (Number; default -1): Maximum file size in bytes. If -1, then infinite.
      
      "),

      dcc_markdown("`min_size` (Number; default 0): Minimum file size in bytes.
      
      "),

      dcc_markdown("`multiple` (Boolean; default `false`): Allow dropping multiple files.
      
      "),

      dcc_markdown("`style` (Dict; optional): CSS styles to apply.
      
      "),

      dcc_markdown("`style_active` (Dict; default Dict('borderStyle' => 'solid', 'borderColor' => '#6c6', 'backgroundColor' => '#eee',)): CSS styles to apply while active.
      
      "),

      dcc_markdown("`style_disabled` (Dict; default Dict('opacity' => 0.5): CSS styles if disabled.
      
      "),

      dcc_markdown("`style_reject` (Dict; default Dict('borderStyle'  => 'solid', 'borderColor' => '#c66', 'backgroundColor' => '#eee',): CSS styles if rejected."
    )
end

end