using Dash, DashHtmlComponents, DashCoreComponents
using DashTable
using Random

Random.seed!(123)

using CSV, DataFrames 

app = dash()

app.layout = html_div([
  DashTable.dash_datatable(
      id="editing-prune-data",
      columns=[Dict(
          "name" =>  "Column $i",
          "id" =>  "column-$i"
      ) for i in 1:4],
      data=[
          Dict("column-$i" =>  (j + (i-1)*5)-1 for i in 1:4)
          for j in 1:5
      ],
      editable=true
  ),
  html_div(id="editing-prune-data-output")
])

callback!(app,
Output("editing-prune-data-output", "children"),
              Input("editing-prune-data", "data")
) do rows
    pruned_rows = NamedTuple[]
    for row in rows
        # require that all elements in a row are specified
        # the pruning behavior that you need may be different than this
        if all([cell != "" for cell in values(row)])          
            push!(pruned_rows,row)
        end
    end
    return html_div([
        html_div("Raw Data"),
        html_pre(string(rows)),
        html_hr(),
        html_div("Pruned Data"),
        html_pre(string(pruned_rows)),
    ])
end

run_server(app, "0.0.0.0", debug=true)
