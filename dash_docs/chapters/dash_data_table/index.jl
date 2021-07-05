module chapters_dash_data_table

using Dash, DashHtmlComponents, DashCoreComponents, DashTable, Chain, Pkg

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

quick_start = LoadExampleCode(string(examples_path, "/quick_start.jl"))

examples = [
    
]

app =  dash()

n = get_pkg_version("DashTable")

app.layout = html_div() do

    html_h1("Dash Data Table"),

    dcc_markdown(
      "
      **Dash DataTable is an interactive table component designed for viewing, editing, and exploring large datasets.**

      This component was written from scratch in React.js specifically for the Dash community. 
      Its API was designed to be ergonomic and its behavior is completely customizable through its 
      properties. DataTable is rendered with standard, semantic HTML `<table/>` markup, which makes it 
      accessible, responsive, and easy to style.

      These docs are using Dash Data Table version $n.
      "
    ),

    html_h3("Quick Start"),

    quick_start.source_code,
    quick_start.layout,
    dcc_markdown(
      "# User Guide
### Reference
A comprehensive list of all of the DataTable properties with examples.

### DataTable Height
How to set the height of the DataTable. Examples include how to set the height with vertical scroll, pagination, virtualization, and fixed headers.

### DataTable Width & Column Width
How to set the width of the table and the columns. Examples include how to handle word wrapping, cell clipping, horizontal scroll, fixed columns, and more.

### Styling
The style of the DataTable is highly customizable. This chapter includes examples for:

### Displaying multiple rows of headers
Text alignment
Styling the table as a list view
Changing the colors (including a dark theme!)
Conditional Formatting
Several examples of how to highlight certain cells, rows, or columns based on their value or state.

### Number Formatting
Several examples of how to format and localize numbers.

### Sorting, Filtering, Selecting, and Paging Natively
The DataTable is interactive. This chapter demonstrates the interactive features of the table and how to wire up these interations to Python callbacks. These actions include:

* Paging
* Selecting Rows
* Sorting Columns
* Filtering Data
### DataTable Tooltips
Display tooltips on data and header rows, conditional tooltips, define tooltips for each cell, customize behavior.

### Julia-Driven Filtering, Paging, Sorting
In Part 3, the paging, sorting, and filtering was done entirely clientside (in the browser). This means that you need to load all of the data into the table up-front. If your data is large, then this can be prohibitively slow. In this chapter, you'll learn how to write your own filtering, sorting, and paging backends in Python with Dash. We'll do the data processing with Pandas but you could write your own routines with SQL or even generate the data on the fly!

### Editable DataTable
The DataTable is editable. Like a spreadsheet, it can be used as an input for controlling models with a variable number of inputs. This chapter includes recipes for:

* Determining which cell has changed
* Filtering out null values
* Adding or removing columns
* Adding or removing rows
* Ensuring that a minimum set of rows are visible
* Running Python computations on certain columns or cells
### Typing and User Input Processing
In this chapter, you'll learn how to configure the table to

* assign the column type
* change the data presentation
* change the data formatting
* validate or coerce user data input
* apply default behavior for valid and invalid data
### Dropdowns Inside DataTable
Cells can be rendered as editable Dropdowns. This is our first stake in bringing a full typing system to the table. Rendering cells as dropdowns introduces some complexity in the markup and so there are a few limitations that you should be aware of.

### Virtualization
Examples using DataTable virtualization.

### Filtering Syntax
An explanation and examples of filtering syntax for both frontend and backend filtering in the DataTable.
  "
    )
    
    

end

end
