using Base: Number
using CSV: eltype
using Dash 
using DashTable

using CSV, DataFrames   

df = CSV.read("datasets/firm_table.csv", DataFrame)
df[!,"id"] = 1:size(df)[1]
app = dash()

function style_row_by_top_values(df, nlg=2)
  df1 = select(df, Not(:id))
  nm = names(df1)
  new_nm = String[]
  for (idx, ec) in enumerate(eachcol(df1))
    if (eltype(ec) <: Number)
      push!(new_nm,nm[idx])
    end
  end
  df_numeric_columns = df[!,new_nm]
  styles = Dict[]
  for i in 1:nrow(df_numeric_columns)
    row_loc = sortperm(Array(df_numeric_columns[i, new_nm]), rev=true)
    for j in 1:nlg
      val = Dict(
        "if" => Dict(
            "filter_query" => "{id} = $i",
            "column_id" => new_nm[row_loc[j]]
        ),
        "backgroundColor" => "#39CCCC",
        "color" => "white"
      )
      push!(styles,val)
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
    style_data_conditional=style_row_by_top_values(df)
    
)

run_server(app, "0.0.0.0", debug=true)
