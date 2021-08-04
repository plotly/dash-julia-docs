include("Reference/index.jl");
include("Height/index.jl");
include("Width/index.jl");
include("Styling/index.jl");
include("ConditionalFormatting/index.jl");
include("Filtering/index.jl");
include("Tooltips/index.jl");
include("JuliaSorting/index.jl");
include("Editable/index.jl");
include("Typing/index.jl");
include("Dropdowns/index.jl");
include("Virtualization/index.jl");
include("FilteringSyntax/index.jl");

@doc_chapter "/dash_data_table" begin

@example quick_start "quick_start.jl"

@layout html_div() do

    html_h1("Dash Data Table"),

    dcc_markdown(
      """
      **Dash DataTable is an interactive table component designed for viewing, editing, and exploring large datasets.**

      This component was written from scratch in React.js specifically for the Dash community. 
      Its API was designed to be ergonomic and its behavior is completely customizable through its 
      properties. DataTable is rendered with standard, semantic HTML `<table/>` markup, which makes it 
      accessible, responsive, and easy to style.

      These docs are using Dash Data Table version $(pkgver"DashTable").
      """
    ),

    html_h3("Quick Start"),

    source"quick_start",
    layout"quick_start",
    html_h1("User Guide"),
    html_a(html_h3("Reference"), href="/dash_data_table/reference"),
    dcc_markdown("""
      A comprehensive list of all of the DataTable properties with examples.
    """),
    html_a(html_h3("DataTable Height"), href="/dash_data_table/datatable_height"),
    dcc_markdown("""
      How to set the height of the DataTable. Examples include how to set the height with vertical scroll, pagination, virtualization, and fixed headers.
    """),
    html_a(html_h3("DataTable Width & Column Width"), href="/dash_data_table/column_width"),

    dcc_markdown("""
      How to set the width of the table and the columns. Examples include how to handle word wrapping, cell clipping, horizontal scroll, fixed columns, and more.
    """),
    html_a(html_h3("Styling"), href="/dash_data_table/styling"),

    dcc_markdown("""
      The style of the DataTable is highly customizable. This chapter includes examples for:
     
      - Displaying multiple rows of headers
      - Text alignment
      - Styling the table as a list view
      - Changing the colors (including a dark theme!)
    """),
    html_a(html_h3("Conditional Formatting"), href="/dash_data_table/conditional_formatting"),
      
    dcc_markdown("""
      Several examples of how to highlight certain cells, rows, or columns based on their value or state.
    """),
    html_a(html_h3("Number Formatting"), href="#"),

    dcc_markdown("""
      Several examples of how to format and localize numbers.
    """),
    html_a(html_h3("Sorting, Filtering, Selecting, and Paging Natively"), href="/dash_data_table/interactivity"),

    dcc_markdown("""
      The DataTable is interactive. This chapter demonstrates the interactive features of the table and how to wire up these interations to Python callbacks. These actions include:

      * Paging
      * Selecting Rows
      * Sorting Columns
      * Filtering Data
    """),
    html_a(html_h3("DataTable Tooltips"), href="/dash_data_table/tooltips"),

    dcc_markdown("""
      Display tooltips on data and header rows, conditional tooltips, define tooltips for each cell, customize behavior.
    """),
    html_a(html_h3("Julia-Driven Filtering, Paging, Sorting"), href="/dash_data_table/julia_filtering"),

    dcc_markdown("""
      In Part 3, the paging, sorting, and filtering was done entirely clientside (in the browser). This means that you need to load all of the data into the table up-front. If your data is large, then this can be prohibitively slow. In this chapter, you'll learn how to write your own filtering, sorting, and paging backends in Python with Dash. We'll do the data processing with Pandas but you could write your own routines with SQL or even generate the data on the fly!
    """),
    html_a(html_h3("Editable DataTable"), href="/dash_data_table/editable"),
    dcc_markdown("""
      The DataTable is editable. Like a spreadsheet, it can be used as an input for controlling models with a variable number of inputs. This chapter includes recipes for:

      * Determining which cell has changed
      * Filtering out null values
      * Adding or removing columns
      * Adding or removing rows
      * Ensuring that a minimum set of rows are visible
      * Running Python computations on certain columns or cells
    """),
    html_a(html_h3("Typing and User Input Processing"), href="/dash_data_table/typing"),
    dcc_markdown("""
      In this chapter, you'll learn how to configure the table to

      * assign the column type
      * change the data presentation
      * change the data formatting
      * validate or coerce user data input
      * apply default behavior for valid and invalid data
    """),
    html_a(html_h3("Dropdowns Inside DataTable"), href="/dash_data_table/dropdown"),
    dcc_markdown("""
      Cells can be rendered as editable Dropdowns. This is our first stake in bringing a full typing system to the table. Rendering cells as dropdowns introduces some complexity in the markup and so there are a few limitations that you should be aware of.
    """),
    html_a(html_h3("Virtualization"), href="/dash_data_table/virtualization"),
    dcc_markdown("""
      Examples using DataTable virtualization.
    """),
    html_a(html_h3("Filtering Syntax"), href="/dash_data_table/filtering_syntax"),
    dcc_markdown("""
      An explanation and examples of filtering syntax for both frontend and backend filtering in the DataTable.
    """)
    
    

end

end
