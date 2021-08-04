using Dash, DashHtmlComponents, DashCoreComponents
using DashTable

using CSV, DataFrames,  DataFramesMeta  

df = CSV.read(download("https://raw.githubusercontent.com/plotly/datasets/master/gapminder2007.csv"), DataFrame)
df[!,"id"] = df[!,"country"]
app = dash()

app.layout = html_div([
  DashTable.dash_datatable(
        id="datatable-row-ids",
        columns=[
          Dict("name" =>  i, "id" =>  i, "deletable" =>  true, "selectable" =>  true) for i in names(df)
            # omit the id column
            if i != "id"
        ],
        data=Dict.(pairs.(eachrow(df))),
        editable=true,
        filter_action="native",
        sort_action="native",
        sort_mode="multi",
        row_selectable="multi",
        row_deletable=true,
        selected_rows=[],
        page_action="native",
        page_current= 0,
        page_size= 10,
    ),
    html_div(id="datatable-row-ids-container")
])


callback!(app,
Output("datatable-row-ids-container", "children"),
Input("datatable-row-ids", "derived_virtual_row_ids"),
Input("datatable-row-ids", "selected_row_ids"),
Input("datatable-row-ids", "active_cell")
    ) do row_ids, selected_row_ids, active_cell
    # When the table is first rendered, `derived_virtual_data` and
    # `derived_virtual_selected_rows` will be `None`. This is due to an
    # idiosyncrasy in Dash (unsupplied properties are always None and Dash
    # calls the dependent callbacks when the component is first rendered).
    # So, if `rows` is `None`, then the component was just rendered
    # and its value will be the same as the component"s dataframe.
    # Instead of setting `None` in here, you could also set
    # `derived_virtual_data=df.to_rows("dict")` when you initialize
    # the component.
    selected_id_set = selected_row_ids isa Nothing ? [] : selected_row_ids
    
    if row_ids isa Nothing
        dff = df
        row_ids = df[!,"id"]
    else
        dff = filter(r -> any(occursin.(row_ids, r.country)), df)
    end  
    active_row_id = !(active_cell isa Nothing) ? active_cell.row_id : Nothing
    
    colors = [( id == active_row_id) ? "#FF69B4" : (id in selected_id_set ? 
    "#7FDBFF" : "#0074D9") for id in row_ids]
    return [
      if column in names(dff)
        dcc_graph(
            id=string(column, "--row-ids"),
            figure=Dict(
                "data" => [
                  Dict(
                        "x"=> dff[!,"country"],
                        "y"=> dff[!,column],
                        "type"=> "bar",
                        "marker"=> Dict("color"=> colors),
                  )
                ],
                "layout"=> Dict(
                    "xaxis"=> Dict("automargin"=> true),
                    "yaxis"=> Dict(
                        "automargin"=> true,
                        "title"=> Dict("text"=> column)
                    ),
                    "height"=> 250,
                    "margin"=> Dict("t"=> 10, "l"=> 10, "r"=> 10),
                ),
            ),
        )
      end
        # check if column exists - user may have deleted it
        # If `column.deletable=False`, then you don"t
        # need to do this check.
        for column in ["pop", "lifeExp", "gdpPercap"]
    ]
end
run_server(app, "0.0.0.0", debug=true)

