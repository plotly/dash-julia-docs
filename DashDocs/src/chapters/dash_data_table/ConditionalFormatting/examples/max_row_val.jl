using Base: Number
using CSV: eltype
using Dash 
using DashTable

using CSV, DataFrames   

df = CSV.read("datasets/firm_table.csv", DataFrame)
df[!,"id"] = 1:size(df)[1]
app = dash()

function highlight_max_row(df)
  df1 = select(df, Not(:id))
  nm = names(df1)
  new_nm = String[]
  for (idx, ec) in enumerate(eachcol(df1))
    if (eltype(ec) <: Number)
      push!(new_nm,nm[idx])
    end
  end
    df_numeric_columns = df[!,new_nm]
  locs = let x = Symbol[]
    map(eachrow(df_numeric_columns)) do rw
      push!(x, argmax(rw))
    end
    x
  end
    return [
        Dict(
            "if" =>  Dict(
                "filter_query" =>  "{id} = $idx",
                "column_id" =>  col
            ),
            "backgroundColor" =>  "#3D9970",
            "color" =>  "white"
        )
        for (idx,col) in enumerate(locs)
    ]
end
app.layout = DashTable.dash_datatable(
    data = map(eachrow(df)) do r
      Dict(names(r) .=> values(r))
    end,
    sort_action="native",
    columns=[Dict("name" =>c, "id" => c) for c in names(df) if c!= "id"],
    style_data_conditional=highlight_max_row(df)
    
)

run_server(app, "0.0.0.0", debug=true)
