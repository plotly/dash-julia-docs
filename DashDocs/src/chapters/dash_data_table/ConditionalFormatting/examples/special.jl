using Dash 
using DashTable

using CSV, DataFrames   

df = CSV.read("datasets/region_params.csv", DataFrame)
df[!, "Rating"] = map(df.Humidity) do h 
  if h > 30
    return "⭐⭐⭐"
  elseif h > 20
    return "⭐⭐"
  else
    return "⭐"
  end
end

df[!, "Growth"] = map(df[!,"Temperature"]) do t
  if t >= 0
    return "↗️"
  else 
    return "↘️"
  end
 end

 df[!,"Status"] =  map(df[!,"Temperature"]) do t
  if t >= 0
    return "🔥"
  else 
    return "🚒"
  end
 end


app = dash()

app.layout = DashTable.dash_datatable(
    data = map(eachrow(df)) do r
      Dict(names(r) .=> values(r))
    end,
    columns=[Dict("name" =>c, "id" => c) for c in names(df)]
    
)

run_server(app, "0.0.0.0", debug=true)
