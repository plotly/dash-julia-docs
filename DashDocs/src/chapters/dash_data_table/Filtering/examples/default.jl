using Dash, DashHtmlComponents, DashCoreComponents
using DashTable

using CSV, DataFrames   

df = CSV.read(download("https://raw.githubusercontent.com/plotly/datasets/master/gapminder2007.csv"), DataFrame)
app = dash()

app.layout = html_div([
  DashTable.dash_datatable(
      id="datatable-interactivity",
      columns=[
          Dict("name" =>  i, "id" =>  i, "deletable" =>  true, "selectable" =>  true) for i in names(df)
      ],
      data=Dict.(pairs.(eachrow(df))),
      editable=true,
      filter_action="native",
      sort_action="native",
      sort_mode="multi",
      column_selectable="single",
      row_selectable="multi",
      row_deletable=true,
      selected_columns=[],
      selected_rows=[],
      page_action="native",
      page_current= 0,
      page_size= 10,
  ),
  html_div(id="datatable-interactivity-container")
])
callback!(app,
    Output("datatable-interactivity", "style_data_conditional"),
    Input("datatable-interactivity", "selected_columns")
) do selected_columns
    return [Dict(
        "if"=> Dict( "column_id"=> i ),
        "background_color"=> "#D2F3FF"
    ) for i in selected_columns]
end

callback!(app,
    Output("datatable-interactivity-container", "children"),
    Input("datatable-interactivity", "derived_virtual_data"),
    Input("datatable-interactivity", "derived_virtual_selected_rows")
    ) do rows, derived_virtual_selected_rows
    # When the table is first rendered, `derived_virtual_data` and
    # `derived_virtual_selected_rows` will be `None`. This is due to an
    # idiosyncrasy in Dash (unsupplied properties are always None and Dash
    # calls the dependent callbacks when the component is first rendered).
    # So, if `rows` is `None`, then the component was just rendered
    # and its value will be the same as the component"s dataframe.
    # Instead of setting `None` in here, you could also set
    # `derived_virtual_data=df.to_rows("dict")` when you initialize
    # the component.
    if derived_virtual_selected_rows isa Nothing
        derived_virtual_selected_rows = []
    end      
    dff = (rows isa Nothing) ? df  :  DataFrame(rows)
    colors = [(i in derived_virtual_selected_rows ? "#7FDBFF" : "#0074D9") for i in 1:nrow(dff)]
    return [
        if column in names(dff)
            dcc_graph(
                id=column,
                figure=Dict(
                    "data" =>  [
                        Dict(
                            "x" =>  dff[!,"country"],
                            "y" =>  dff[!,column],
                            "type" =>  "bar",
                            "marker" =>  Dict("color" =>  colors),
                        )
                    ],
                    "layout" =>  Dict(
                        "xaxis" =>  Dict("automargin" =>  true),
                        "yaxis" =>  Dict(
                            "automargin" =>  true,
                            "title" =>  Dict("text" =>  column)
                        ),
                        "height" =>  250,
                        "margin" =>  Dict("t" =>  10, "l" =>  10, "r" =>  10),
                    ),
                ),
            )
            # check if column exists - user may have deleted it
            # If `column.deletable=False`, then you don't
            # need to do this check.
        end
        for column in ["pop", "lifeExp", "gdpPercap"]
    ]
end
run_server(app, "0.0.0.0", debug=true)

