using Dash
using DashTable

using CSV, DataFrames, Colors   

df = CSV.read("datasets/pop_data.csv", DataFrame)
app = dash()

function data_bars(df, column)
    n_bins = 100
    bounds = [(i-1) * (1.0 / n_bins) for i in 1:n_bins+1]
    df_max = maximum(Array(df[!,column]))
    df_min = minimum(Array(df[!,column]))
    ranges = [
        ((df_max - df_min) * i) + df_min
        for i in bounds
    ]
    styles = Dict[]
    for i in 1:length(bounds)-1
      min_bound = ranges[i]
      max_bound = ranges[i+1]
      max_bound_percentage = bounds[i+1] * 100
      chk = i < (length(bounds) - 1) ? " && {$column} < $max_bound" : ""
        push!(styles, Dict(
            "if" => Dict(
                "filter_query" => string("{$column} >= $min_bound", chk),
                "column_id" => column
            ),
            "background" => (
                """
                    linear-gradient(90deg,
                    #0074D9 0%,
                    #0074D9 $(max_bound_percentage)%,
                    white $(max_bound_percentage)%,
                    white 100%)
                """
            ),
            "paddingBottom" => 2,
            "paddingTop" => 2
        )
      )
    end

    return styles
end
app.layout =  DashTable.dash_datatable(
        data=Dict.(pairs.(eachrow(df))),
        sort_action="native",
        columns=[Dict("name" =>c, "id" => c) for c in names(df)],
        style_data_conditional=vcat(
          data_bars(df, "lifeExp"),data_bars(df, "gdpPercap")
        ),
      style_cell=Dict(
          "width" => "100px",
          "minWidth" => "100px",
          "maxWidth" => "100px",
          "overflow" => "hidden",
          "textOverflow" => "ellipsis",
      ),
      page_size=20
    )
 
run_server(app, "0.0.0.0", debug=true)
