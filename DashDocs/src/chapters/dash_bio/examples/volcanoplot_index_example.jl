using Dash, DashBio, DashCoreComponents

using CSV, DataFrames   

df = CSV.read(download("https://raw.githubusercontent.com/plotly/datasets/master/solar.csv"), DataFrame)

app = dash()


app.layout = dcc_graph(figure=dashbio_volcanoplot(
  dataframe=df
))
run_server(app, "0.0.0.0", debug=true)