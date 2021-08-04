using Dash
using DashTable

using CSV, DataFrames 

df = CSV.read(download("https://raw.githubusercontent.com/plotly/datasets/master/gapminder2007.csv"), DataFrame)
df = df[!,["continent", "country", "pop", "lifeExp"]]
df[!,"Mock Date"] = [
    Dates.CompoundPeriod(Dates.Hour(13*(i-1)))+DateTime(2020, 1, 1, 0, 0, 0)
    for i in 1:nrow(df)
]
app = dash()
app.layout = DashTable.dash_datatable(
    columns=[
        Dict("name" =>  "Continent", "id" =>  "continent", "type" =>  "numeric"),
        Dict("name" =>  "Country", "id" =>  "country", "type" =>  "text"),
        Dict("name" =>  "Population", "id" =>  "pop", "type" =>  "numeric"),
        Dict("name" =>  "Life Expectancy", "id" =>  "lifeExp", "type" =>  "numeric"),
        Dict("name" =>  "Mock Dates", "id" =>  "Mock Date", "type" =>  "datetime")
    ],
    data=Dict.(pairs.(eachrow(df))),
    filter_action="native",

    style_table=Dict(
        "height" =>  400,
    ),
    style_data=Dict(
        "width" =>  "150px", "minWidth" =>  "150px", "maxWidth" =>  "150px",
        "overflow" =>  "hidden",
        "textOverflow" =>  "ellipsis",
    )
)


run_server(app, "0.0.0.0", debug=true)
