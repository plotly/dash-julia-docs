using Dash, DashHtmlComponents
using DashDaq

external_stylesheets = ["https://codepen.io/anon/pen/mardKv.css"]

app = dash(external_stylesheets=external_stylesheets)

theme =  Dict(
    "dark" => true,
    "detail" => "#007439",
    "primary" => "#00EA64",
    "secondary" => "#6E6E6E",
)

rootLayout = html_div([
    daq_booleanswitch(
        on=true,
        id="darktheme-daq-booleanswitch",
        className="dark-theme-control"
    ), html_br(),
    daq_toggleswitch(
        id="darktheme-daq-toggleswitch",
        className="dark-theme-control"
    ), html_br(),
    daq_colorpicker(
        value=(hex="#171717",),
        id="darktheme-daq-colorpicker",
        className="dark-theme-control"
    ), html_br(),
    daq_gauge(
        min=0,
        max=10,
        value=6,
        color=theme["primary"],
        id="darktheme-daq-gauge",
        className="dark-theme-control"
    ), html_br(),
    daq_graduatedbar(
        value=4,
        color=theme["primary"],
        id="darktheme-daq-graduatedbar",
        className="dark-theme-control"
    ), html_br(),
    daq_indicator(
        value=true,
        color=theme["primary"],
        id="darktheme-daq-indicator",
        className="dark-theme-control"
    ), html_br(),
    daq_knob(
        min=0,
        max=10,
        value=6,
        id="darktheme-daq-knob",
        className="dark-theme-control"
    ), html_br(),
    daq_leddisplay(
        value="3.14159",
        color=theme["primary"],
        id="darktheme-daq-leddisplay",
        className="dark-theme-control"
    ), html_br(),
    daq_numericinput(
        min=0,
        max=10,
        value=4,
        id="darktheme-daq-numericinput",
        className="dark-theme-control"
    ), html_br(),
    daq_powerbutton(
        on=true,
        color=theme["primary"],
        id="darktheme-daq-powerbutton",
        className="dark-theme-control"
    ), html_br(),
    daq_precisioninput(
        precision=4,
        value=299792458,
        id="darktheme-daq-precisioninput",
        className="dark-theme-control"
    ), html_br(),
    daq_stopbutton(
        id="darktheme-daq-stopbutton",
        className="dark-theme-control"
    ), html_br(),
    daq_slider(
        min=0,
        max=100,
        value=30,
        targets = Dict("25" => Dict("label" => "TARGET")),
        color=theme["primary"],
        id="darktheme-daq-slider",
        className="dark-theme-control"
    ), html_br(),
    daq_tank(
        min=0,
        max=10,
        value=5,
        id="darktheme-daq-tank",
        className="dark-theme-control"
    ), html_br(),
    daq_thermometer(
        min=95,
        max=105,
        value=98.6,
        id="darktheme-daq-thermometer",
        className="dark-theme-control"
    ), html_br()

])

app.layout = html_div(id="dark-theme-container", children=[
  daq_toggleswitch(
      id="toggle-theme",
      label=["Light", "Dark"],
      value=true
  ),
  html_br(),
  html_div(
      id="theme-colors",
      children=[
          daq_colorpicker(
              id="primary-color",
              label="Primary color",
              value=(hex="#00EA64",)
          ),
          daq_colorpicker(
              id="secondary-color",
              label="Accent color",
              value=(hex="#6E6E6E",)
          ),
          daq_colorpicker(
              id="detail-color",
              label="Detail color",
              value=(hex="#007439",)
          )
      ]
  ),
  html_div(id="dark-theme-components", children=[
      daq_darkthemeprovider(theme=theme, children=rootLayout)
  ], style=Dict("border" => "solid 1px #A2B1C6", "border-radius" => "5px", "padding" => "50px", "margin-top" => "20px"))
], style=Dict("padding" => "50px"))


callback!(app,
  Output("dark-theme-components", "children"),
  [Input("toggle-theme", "value"),
   Input("primary-color", "value"),
   Input("secondary-color", "value"),
   Input("detail-color", "value")]
) do dark, p, s, d
  if(dark)
      theme["dark"]=true
  else
    theme["dark"]=false
  end
  if !(p isa Nothing)
      theme["primary"]=p.hex
      for child in rootLayout.children
          if hasproperty(child,:color)
            if !(child.color isa Nothing)
              child.color =  p.hex
            end              
          end
      end
  end     

  if !(s isa Nothing)
      theme["secondary"]=s.hex
  end
  if !(d isa Nothing)
      theme["detail"]=d.hex
  end
  return daq_darkthemeprovider(theme=theme, children=rootLayout)
end

callback!(app,
  Output("dark-theme-components", "style"),
  [Input("toggle-theme", "value")],
  [State("dark-theme-components", "style")]
) do dark, currentStyle
  new_style = Dict()
  for val in keys(currentStyle)
    new_style[string(val)] = currentStyle[val]
  end
  if dark
      new_style["backgroundColor"]="#303030"
  else
      new_style["backgroundColor"]="white"
  end
  return new_style
end
run_server(app, "0.0.0.0", debug=true)