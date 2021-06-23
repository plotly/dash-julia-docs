using Dash, DashHtmlComponents, DashCoreComponents

using DashDaq

app = dash()
theme = Dict(
    "dark" => false,
    "detail" => "#007439",
    "primary" => "#00EA64",
    "secondary" => "#6E6E6E"
)

app.layout = html_div(id="dark-theme-provider-demo", children=[
  html_br(),
  daq_toggleswitch(
      id="daq-light-dark-theme",
      label=["Light", "Dark"],
      style=Dict("width" => "250px", "margin" => "auto"),
      value=false
  ),
  html_div(
      id="dark-theme-component-demo",
      children=[
          daq_darkthemeprovider(theme=theme, children=daq_knob(value=6))
      ],
      style=Dict("display" => "block", "margin-left" => "calc(50% - 110px)")
  )
])

callback!(
  app, Output("dark-theme-component-demo", "children"), 
  Input("daq-light-dark-theme", "value")) do dark_theme
    if dark_theme
      theme["dark"] = true
    else
      theme["dark"] = false
    end
    return daq_darkthemeprovider(theme=theme, children=daq_knob(value=6))
end

callback!(
  app, Output("dark-theme-component-demo", "style"), 
  Input("daq-light-dark-theme", "value")) do dark_theme
    if dark_theme
      return Dict("background-color" => "#303030", "color" => "white")
    else
      return Dict("background-color" => "white", "color" => "black")
    end
end

run_server(app, "0.0.0.0", debug=true)