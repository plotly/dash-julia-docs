using Dash, DashHtmlComponents, DashCoreComponents
using DashTable

using CSV, DataFrames 

df = CSV.read(download("https://raw.githubusercontent.com/plotly/datasets/master/gapminder2007.csv"), DataFrame)
df[!," index"] =1:nrow(df)

app = dash()

PAGE_SIZE = 5

app.layout =  DashTable.dash_datatable(
    id="table-paging-and-sorting",
    columns=[
        Dict("name" =>  i, "id" =>  i) for i in sort(names(df))
    ],
    page_current=0,
    page_size=PAGE_SIZE,
    page_action="custom",

    sort_action="custom",
    sort_mode="single",
    sort_by=[]
  )

callback!(app,
Output("table-paging-and-sorting", "data"),
Input("table-paging-and-sorting", "page_current"),
Input("table-paging-and-sorting", "page_size"),
Input("table-paging-and-sorting", "sort_by")
    ) do page_current, page_size, sort_by
    if isempty(sort_by)
      dff = df
    else
      if sort_by[1].direction == "asc"
        dir = true
      else
        dir = false
      end
      dff = sort(df, [sort_by[1].column_id], rev=dir) 
    end
    return Dict.(pairs.(eachrow(
      dff[(page_current*page_size+1):((page_current+ 1)*page_size), :]
    )))

end



run_server(app, "0.0.0.0", debug=true)
