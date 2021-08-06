using Dash, DashHtmlComponents
using DashTable

using CSV, DataFrames, Colors   

df = CSV.read("datasets/firm_table.csv", DataFrame)
app = dash()

function discrete_background_color_bins(df; n_bins=5, columns="all")
  bounds = [(i-1) * (1.0 / n_bins) for i in 1:n_bins+1]
  nme = names(df, Number)
  if columns == "all"        
      df_numeric_columns = df[!,nme]
  else
      df_numeric_columns = df[!,columns]
  end
  df_max = maximum(Array(df_numeric_columns))
  df_min = minimum(Array(df_numeric_columns))
  ranges = [
      ((df_max - df_min) * i) + df_min
      for i in bounds
  ]
  styles = Dict[]
  legend = Component[]
  for i in 1:length(bounds)-1
      min_bound = ranges[i]
      max_bound = ranges[i+1]
      backgroundColor = string("#",lowercase(hex.(colormap("Blues",n_bins))[i]))
      color = i > (length(bounds) / 2.) ? "white" : "inherit"
      for column in nme
        chk = i < (length(bounds) - 1) ? " && {$column} < $max_bound" : ""
          push!(styles, Dict(               
             "if" => Dict(  
                  "filter_query" => string("{$column} >= $min_bound", chk),
                  "column_id"=> column
              ),
              "backgroundColor" => backgroundColor,
              "color"=> color
          )
      )
      end
      push!(legend,
          html_div(style=Dict("display"=> "inline-block", "width"=> "60px"), children=[
              html_div(
                  style=Dict(
                      "backgroundColor"=> backgroundColor,
                      "borderLeft"=> "1px rgb(50, 50, 50) solid",
                      "height"=> "10px"
                  )
              ),
              html_small(round(min_bound, digits=2), style=Dict("paddingLeft"=> "2px"))
          ])
      )
    end

  return (styles, html_div(legend, style=Dict("padding"=> "5px 0 5px 0")))
end
(styles, legend) = discrete_background_color_bins(df)
app.layout = html_div([
    html_div(children=[legend], style=Dict("float" => "right")),
    DashTable.dash_datatable(
        data=Dict.(pairs.(eachrow(df))),
        sort_action="native",
        columns=[Dict("name" =>c, "id" => c) for c in names(df)],
        style_data_conditional=styles
    ),
])
 
run_server(app, "0.0.0.0", debug=true)
