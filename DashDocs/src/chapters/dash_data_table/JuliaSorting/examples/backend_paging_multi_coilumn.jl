using Dash, DashHtmlComponents, DashCoreComponents
using DashTable

using CSV, DataFrames 

df = CSV.read(download("https://raw.githubusercontent.com/plotly/datasets/master/gapminder2007.csv"), DataFrame)
df[!," index"] =1:nrow(df)

app = dash()

PAGE_SIZE = 5

app.layout =  DashTable.dash_datatable(
    id="table-multicol-sorting",
    columns=[
        Dict("name" =>  i, "id" =>  i) for i in sort(names(df))
    ],
    page_current=0,
    page_size=PAGE_SIZE,
    page_action="custom",

    sort_action="custom",
    sort_mode="multi",
    sort_by=[]
  )

 callback!(app,
    Output("table-multicol-sorting", "data"),
    Input("table-multicol-sorting", "page_current"),
    Input("table-multicol-sorting", "page_size"),
    Input("table-multicol-sorting", "sort_by")
    ) do page_current, page_size, sort_by
    if isempty(sort_by)
      dff = df
    else
      dir = [(i.direction == "asc" ? true : false) for i in sort_by]
      cid = [i.column_id for i in sort_by]
      dff = sort(df, cid, rev=dir) 
    end

        return Dict.(pairs.(eachrow(
          dff[(page_current*page_size+1):((page_current+ 1)*page_size), :]
        )))
end



run_server(app, "0.0.0.0", debug=true)
