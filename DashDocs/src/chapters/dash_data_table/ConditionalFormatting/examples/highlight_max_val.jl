using CSV, DataFrames   

df = CSV.read("datasets/firm_table.csv", DataFrame)
df[!,"id"] = 1:nrow(df)
app = dash()

function style_table_by_max_value(df)
  df1 = select(df, Not(:id))
  nm = names(df1)
  new_nm = names(df1,Number)
  df_numeric_columns = df[!,new_nm]
  df_numeric_columns_mat = Array(df_numeric_columns)
  max_val, max_idx = findmax(df_numeric_columns_mat, dims=2)
  max_across_table = maximum(max_val)
  styles = Dict[]
  for (idx,col) in enumerate(max_val)
    if col == max_across_table
      push!(styles,
        Dict(
          "if" =>  Dict(
              "filter_query" =>  "{id} = $idx",
              "column_id" =>  new_nm[idx]
            ),
          "backgroundColor" =>  "#39CCCC",
          "color" =>  "white"
        )
      )
    end
  end  
  return styles
end
app.layout = DashTable.dash_datatable(
    data = map(eachrow(df)) do r
      Dict(names(r) .=> values(r))
    end,
    sort_action="native",
    columns=[Dict("name" =>c, "id" => c) for c in names(df) if c != "id"],
    style_data_conditional=style_table_by_max_value(df)
    
)

run_server(app, "0.0.0.0", debug=true)
