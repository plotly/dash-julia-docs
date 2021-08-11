using Dash
using DashTable

using CSV, DataFrames 

df = CSV.read(download("https://raw.githubusercontent.com/plotly/datasets/master/gapminder2007.csv"), DataFrame)
df[!," index"] =1:nrow(df)

app = dash()

PAGE_SIZE = 5

app.layout =  DashTable.dash_datatable(
  id="datatable-paging",
  columns=[
      Dict("name" =>  i, "id" =>  i) for i in sort(names(df))
  ],
  page_current=0,
  page_size=PAGE_SIZE,
  page_action="custom"
)

callback!(app,
    Output("datatable-paging", "data"),
    Input("datatable-paging", "page_current"),
    Input("datatable-paging", "page_size")
    )  do page_current, page_size
    return Dict.(pairs.(eachrow(
      df[(page_current*page_size+1):((page_current+ 1)*page_size), :]
    )))

end
run_server(app, "0.0.0.0", debug=true)
