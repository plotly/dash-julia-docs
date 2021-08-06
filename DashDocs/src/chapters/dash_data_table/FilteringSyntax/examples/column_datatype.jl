using Dash
using DashTable

using CSV, DataFrames, Dates

df = CSV.read(download("https://raw.githubusercontent.com/plotly/datasets/master/gapminder2007.csv"), DataFrame)
df = df[!,["continent", "country", "pop", "lifeExp"]]
df[!,"Mock Date"] = [
    Dates.CompoundPeriod(Dates.Hour(13*(i-1)))+DateTime(2020, 1, 1, 0, 0, 0)
    for i in 1:nrow(df)
]
app = dash()

function table_type(df_column)
    if eltype(df_column) == DateTime 
        return "datetime"
    elseif (
        (eltype(df_column) == String) || 
        (eltype(df_column) == Bool)
    )
        return "text"
    elseif (
        (eltype(df_column) == Int) || 
        (eltype(df_column) == Int32) ||
        (eltype(df_column) == Int64) ||
        (eltype(df_column) == Int16) ||
        (eltype(df_column) == Int8)
    )
        return "numeric"
    else
        return "any"
    end
end
app.layout = DashTable.dash_datatable(
    columns=[
        Dict("name" =>  i, "id" =>  i, "type" =>  table_type(df[!,i])) for i in names(df)
    ],
    data=Dict.(pairs.(eachrow(df))),
    filter_action="native",

    css=[Dict(
        "selector" =>  "table",
        "rule" =>  "table-layout : fixed"  # note - this does not work with fixed_rows
    )],
    style_table=Dict("height" =>  400),
    style_data=Dict(
        "width" =>  "$(100. /ncol(df))%",
        "textOverflow" =>  "hidden"
    )
)


run_server(app, "0.0.0.0", debug=true)
