using Dash, DashCoreComponents, PlotlyJS, DataFrames

df_wide = DataFrame(
    year=1995:2012,
    world=[219, 146, 112, 127, 124, 180, 236, 207, 236, 263, 350, 430, 474, 526, 488, 537, 500, 439],
    china=[16, 13, 10, 11, 28, 37, 43, 55, 56, 88, 105, 156, 270, 299, 340, 403, 549, 499],
)

df = DataFrames.stack(df_wide, Not(:year), variable_name=:country, value_name=:y)
fig = plot(
    df, x=:year, y=:y, color=:country,
    Layout(
        title_text="US Export of Plastic Scrap",
        legend=attr(x=0, y=1)
    )
)

app = dash()
app.layout = dcc_graph(figure=fig, style=Dict("height"=>300), id="my-graph")
run_server(app, "0.0.0.0", debug=true)
