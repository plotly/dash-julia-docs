using Dash, DashHtmlComponents, DashCoreComponents

app = dash()

app.layout = html_div() do
    dcc_input(
        placeholder="Enter a value...",
        type="text",
        value=""
    )
end

run_server(app, "0.0.0.0", debug=true)
app.layout = dcc_input(
  placeholder = "Enter a value...",
  type = "text",
  value = "",
)

run_server(app, "0.0.0.0", debug=true)
