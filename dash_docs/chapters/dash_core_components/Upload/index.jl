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
    upload_gallery.layout
    

end

end