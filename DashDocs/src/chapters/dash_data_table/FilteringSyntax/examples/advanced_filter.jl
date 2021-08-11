using Dash, DashHtmlComponents, DashCoreComponents
using DashTable

using CSV, DataFrames, JSON 

df = CSV.read(download("https://raw.githubusercontent.com/plotly/datasets/master/gapminder2007.csv"), DataFrame)

df[!,"id"] = df[!,"country"]

app = dash()


app.layout = html_div([

    dcc_radioitems(
        id="filter-query-read-write",
        options=[
            Dict("label" =>  "Read filter_query", "value" =>  "read"),
            Dict("label" =>  "Write to filter_query", "value" =>  "write")
        ],
        value="read"
    ),

    html_br(),

    dcc_input(id="filter-query-input", placeholder="Enter filter query"),

    html_div(id="filter-query-output"),

    html_hr(),

    DashTable.dash_datatable(
        id="datatable-advanced-filtering",
        columns=[
            Dict("name" =>  i, "id" =>  i, "deletable" =>  true) for i in names(df)
            # omit the id column
            if i != "id"
        ],
        data=Dict.(pairs.(eachrow(df))),
        editable=true,
        page_action="native",
        page_size=10,
        filter_action="native"
    ),
    html_hr(),
    html_div(id="datatable-query-structure", style=Dict("whitespace" =>  "pre"))
])


callback!(app,
    Output("filter-query-input", "style"),
    Output("filter-query-output", "style"),
    Input("filter-query-read-write", "value")
) do val
    input_style = Dict("width" =>  "100%")
    output_style = Dict()
    if val == "read"
        input_style["display"] ="none"
        output_style["display"]="inline-block"
    else
        input_style["display"]="inline-block"
        output_style[display]="none"
    end
    return input_style, output_style
end


callback!(app,
    Output("datatable-advanced-filtering", "filter_query"),
    Input("filter-query-input", "value")
) do query
    if query isa Nothing
        return ""
    end
    return query
end


callback!(app,
    Output("filter-query-output", "children"),
    Input("datatable-advanced-filtering", "filter_query")
) do query
    if query isa Nothing
        return "No filter query"
    end
    return dcc_markdown("""`filter_query = "$(query)"`""")
end


callback!(app,
    Output("datatable-query-structure", "children"),
    Input("datatable-advanced-filtering", "derived_filter_query_structure")
) do query
    if query isa Nothing
        return ""
    end
    return html_details([
        html_summary("Derived filter query structure"),
        html_div(dcc_markdown("""```json
        $(JSON.json(query))
    ```"""))
    ])
end
run_server(app, "0.0.0.0", debug=true)
