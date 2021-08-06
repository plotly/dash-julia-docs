@doc_chapter "/dash_core_components/upload" begin

  @example upload_datafile "upload_datafile.jl"
  @example upload_image "upload_image.jl"
  @example upload_gallery "upload_gallery.jl"

  @layout html_div() do

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

    source"upload_datafile",
    layout"upload_datafile",

    dcc_markdown(
      "This example responds to image uploads by displaying them in 
      the app with the `html_img` component."
    ),

    source"upload_image",
    layout"upload_image",

    dcc_markdown(
      "The children attribute of the Upload component accepts any Dash component.
       Clicking on the children element will trigger the upload action, as will
      dragging and dropping files. Here are a few different ways that you could
      style the upload component using standard dash components."
    ),

    source"upload_gallery",
    layout"upload_gallery",

    html_h3("dcc_upload Reference"),
    dcc_markdown("""
        ```
            Access this documentation in your Julia REPL with:

            ?help dcc_upload

            Our recommended IDE for writing Dash apps is Dash Enterprise's Data Science Workspaces, which has typeahead support for Dash Component Properties. Find out if your company is using Dash Enterprise.
        ```
    """),
    dcc_markdown(string(@doc dcc_upload))
end

end