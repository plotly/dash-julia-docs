using Dash, DashHtmlComponents, DashCoreComponents
using Dates
app = dash()

app.layout = dcc_datepickersingle(
    id="date-picker-single",
    date=DateTime(1997, 5, 10)
)
run_server(app, "0.0.0.0", debug=true)