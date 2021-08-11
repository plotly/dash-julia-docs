using Dash, DashHtmlComponents, DashCoreComponents
using DashTable

using CSV, DataFrames 

df = CSV.read(download("https://raw.githubusercontent.com/plotly/datasets/master/gapminder2007.csv"), DataFrame)
df[!," index"] =1:nrow(df)

app = dash()

PAGE_SIZE = 5

app.layout = html_div([ 
  DashTable.dash_datatable(
    id="datatable-paging-page-count",
    columns=[
        Dict("name" =>  i, "id" =>  i) for i in sort(names(df))
    ],
    page_current=0,
    page_size=PAGE_SIZE,
    page_action="custom"
  ),
  html_br(),
    dcc_checklist(
        id="datatable-use-page-count",
        options=[
            Dict("label"=> "Use page_count", "value"=> "True")
        ],
        value=["True"]
    ),
    "Page count:",
    dcc_input(
        id="datatable-page-count",
        type="number",
        min=1,
        max=29,
        value=20
    )
])

callback!(app,
    Output("datatable-paging-page-count", "data"),
    Input("datatable-paging-page-count", "page_current"),
    Input("datatable-paging-page-count", "page_size")
    )  do page_current, page_size
    return Dict.(pairs.(eachrow(
      df[(page_current*page_size+1):((page_current+ 1)*page_size), :]
    )))

end

callback!(app,
    Output("datatable-paging-page-count", "page_count"),
    Input("datatable-use-page-count", "value"),
    Input("datatable-page-count", "value")
    ) do use_page_count, page_count_value
    if length(use_page_count) == 0 || page_count_value isa Nothing
        return nothing
    end
    return page_count_value
  end


run_server(app, "0.0.0.0", debug=true)
