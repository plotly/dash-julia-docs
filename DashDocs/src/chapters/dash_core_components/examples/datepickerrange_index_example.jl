using Dash, DashHtmlComponents, DashCoreComponents
using Dates
app = dash()

app.layout = dcc_datepickerrange(
  id="date-picker-range",
  start_date=DateTime(1997, 5, 3),
  end_date_placeholder_text="Select a date!"
)
run_server(app, "0.0.0.0", debug=true)