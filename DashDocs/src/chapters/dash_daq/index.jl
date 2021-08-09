include("BooleanSwitch/index.jl");
include("ColorPicker/index.jl");
include("DarkThemeProvider/index.jl");
include("Gauge/index.jl");
include("GraduatedBar/index.jl");
include("Indicator/index.jl");
include("Joystick/index.jl");
include("Knob/index.jl");
include("LEDDisplay/index.jl");
include("NumericInput/index.jl");
include("PowerButton/index.jl");
include("PrecisionInput/index.jl");
include("Slider/index.jl");
include("StopButton/index.jl");
include("Tank/index.jl");
include("Thermometer/index.jl");
include("ToggleSwitch/index.jl");
@doc_chapter "/dash-daq" begin


@example booleanswitch_index_example "booleanswitch_index_example.jl"
@example colorpicker_index_example "colorpicker_index_example.jl"
@example gauge_index_example "gauge_index_example.jl"
@example graduatedbar_index_example "graduatedbar_index_example.jl"
@example indicator_index_example "indicator_index_example.jl"
@example joystick_index_example "joystick_index_example.jl"
@example knob_index_example "knob_index_example.jl"
@example leddisplay_index_example "leddisplay_index_example.jl"
@example numericinput_index_example "numericinput_index_example.jl"
@example powerbutton_index_example "powerbutton_index_example.jl"
@example precisioninput_index_example "precisioninput_index_example.jl"
@example slider_index_example "slider_index_example.jl"
@example stopbutton_index_example "stopbutton_index_example.jl"
@example tank_index_example "tank_index_example.jl"
@example thermometer_index_example "thermometer_index_example.jl"
@example toggleswitch_index_example "toggleswitch_index_example.jl"
@example darkthemeprovider_index_example "darkthemeprovider_index_example.jl"


@layout html_div() do

    html_h1("Dash DAQ"),

    dcc_markdown("
    Dash is a web application framework that provides pure Julia abstraction around HTML, CSS, and JavaScript.
    Dash DAQ comprises a robust set of controls that make it simpler to integrate data acquisition and controls into your Dash applications.
    The source is on GitHub at [plotly/dash-daq](https://github.com/plotly/dash-daq).
    These docs are using version $(pkgver"DashDaq")."),

    html_a(html_h3("BooleanSwitch"), href="/dash-daq/booleanswitch"),

    dcc_markdown("A switch component that toggles between on and off."),

    source"booleanswitch_index_example",
    layout"booleanswitch_index_example",

    html_a(html_h3("ColorPicker"), href="/dash-daq/colorpicker"),

    dcc_markdown("A color picker."),

    source"colorpicker_index_example",
    layout"colorpicker_index_example",

    html_a(html_h3("Gauge"), href="/dash-daq/gauge"),

    dcc_markdown("A gauge component that points to some value between some range."),

    source"gauge_index_example",
    layout"gauge_index_example",

    html_a(html_h3("GraduatedBar"), href="/dash-daq/graduatedbar"),

    dcc_markdown("A graduated bar component that displays a value within some range as a percentage."),

    source"graduatedbar_index_example",
    layout"graduatedbar_index_example",

    html_a(html_h3("Indicator"), href="/dash-daq/indicator"),

    dcc_markdown("A boolean indicator LED."),

    source"indicator_index_example",
    layout"indicator_index_example",

    html_a(html_h3("Joystick"), href="/dash-daq/joystick"),

    dcc_markdown("A joystick that can be used to apply direction and force."),

    source"joystick_index_example",
    layout"joystick_index_example",

    html_a(html_h3("Knob"), href="/dash-daq/knob"),

    dcc_markdown("A knob component that can be turned to a value between some range."),

    source"knob_index_example",
    layout"knob_index_example",

    html_a(html_h3("LEDDisplay"), href="/dash-daq/leddisplay"),

    dcc_markdown("A 7-segment LED display component."),

    source"leddisplay_index_example",
    layout"leddisplay_index_example",

    html_a(html_h3("NumericInput"), href="/dash-daq/numericinput"),

    dcc_markdown("A numeric input component that can be set to a value between some range."),

    source"numericinput_index_example",
    layout"numericinput_index_example",

    html_a(html_h3("PowerButton"), href="/dash-daq/powerbutton"),

    dcc_markdown("A power button component that can be turned on or off."),

    source"powerbutton_index_example",
    layout"powerbutton_index_example",

    html_a(html_h3("PrecisionInput"), href="/dash-daq/precisioninput"),

    dcc_markdown("A numeric input component that converts an input value to the desired precision.
    "),

    source"precisioninput_index_example",
    layout"precisioninput_index_example",

    html_a(html_h3("Slider"), href="/dash-daq/slider"),

    dcc_markdown("A slider component with support for a target value.
    "),

    source"slider_index_example",
    layout"slider_index_example",

    html_a(html_h3("StopButton"), href="/dash-daq/stopbutton"),

    dcc_markdown("A stop button."),

    source"stopbutton_index_example",
    layout"stopbutton_index_example",

    html_a(html_h3("Tank"), href="/dash-daq/tank"),

    dcc_markdown("A tank component that fills to a value between some range."),

    source"tank_index_example",
    layout"tank_index_example",

    html_a(html_h3("Thermometer"), href="/dash-daq/thermometer"),

    dcc_markdown("A thermometer component that fills to a value between some range."),

    source"thermometer_index_example",
    layout"thermometer_index_example",

    html_a(html_h3("ToggleSwitch"), href="/dash-daq/toggleswitch"),

    dcc_markdown("A switch component that toggles between two values."),

    source"toggleswitch_index_example",
    layout"toggleswitch_index_example",

    html_a(html_h3("DarkThemeProvider"), href="/dash-daq/darkthemeprovider"),

    dcc_markdown("A component placed at the root of the component tree to
    make all components match the dark theme."),

    source"darkthemeprovider_index_example",
    layout"darkthemeprovider_index_example"

end

end