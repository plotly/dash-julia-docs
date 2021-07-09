module chapters_dash_daq

using Dash, DashHtmlComponents, DashCoreComponents, DashDaq, Chain, Pkg

function get_pkg_version(name::AbstractString)
    @chain Pkg.dependencies() begin
        values
        [x for x in _ if x.name == name]
        only
        _.version
    end
end

include("../../utils.jl")

export examples

examples_path = joinpath(@__DIR__, "examples")

booleanswitch_index_example = LoadExampleCode(string(examples_path, "/booleanswitch_index_example.jl"))
colorpicker_index_example = LoadExampleCode(string(examples_path, "/colorpicker_index_example.jl"))
gauge_index_example = LoadExampleCode(string(examples_path, "/gauge_index_example.jl"))
graduatedbar_index_example = LoadExampleCode(string(examples_path, "/graduatedbar_index_example.jl"))
indicator_index_example = LoadExampleCode(string(examples_path, "/indicator_index_example.jl"))
joystick_index_example = LoadExampleCode(string(examples_path, "/joystick_index_example.jl"))
knob_index_example = LoadExampleCode(string(examples_path, "/knob_index_example.jl"))
leddisplay_index_example = LoadExampleCode(string(examples_path, "/leddisplay_index_example.jl"))
numericinput_index_example = LoadExampleCode(string(examples_path, "/numericinput_index_example.jl"))
powerbutton_index_example = LoadExampleCode(string(examples_path, "/powerbutton_index_example.jl"))
precisioninput_index_example = LoadExampleCode(string(examples_path, "/precisioninput_index_example.jl"))
slider_index_example = LoadExampleCode(string(examples_path, "/slider_index_example.jl"))
stopbutton_index_example = LoadExampleCode(string(examples_path, "/stopbutton_index_example.jl"))
tank_index_example = LoadExampleCode(string(examples_path, "/tank_index_example.jl"))
thermometer_index_example = LoadExampleCode(string(examples_path, "/thermometer_index_example.jl"))
toggleswitch_index_example = LoadExampleCode(string(examples_path, "/toggleswitch_index_example.jl"))
darkthemeprovider_index_example = LoadExampleCode(string(examples_path, "/darkthemeprovider_index_example.jl"))

examples = [
    booleanswitch_index_example, darkthemeprovider_index_example
]

app =  dash()

n = get_pkg_version("DashDaq")

app.layout = html_div() do

    html_h1("Dash DAQ"),

    dcc_markdown("
    Dash is a web application framework that provides pure Julia abstraction around HTML, CSS, and JavaScript.
    Dash DAQ comprises a robust set of controls that make it simpler to integrate data acquisition and controls into your Dash applications.
    The source is on GitHub at [plotly/dash-daq](https://github.com/plotly/dash-daq).
    These docs are using version $n."),

    html_a(html_h3("BooleanSwitch"), href="dash_daq/boolean_switch"),

    dcc_markdown("A switch component that toggles between on and off."),

    booleanswitch_index_example.source_code,
    booleanswitch_index_example.layout,

    html_a(html_h3("ColorPicker"), href="dash_daq/color_picker"),

    dcc_markdown("A color picker."),

    colorpicker_index_example.source_code,
    colorpicker_index_example.layout,

    html_a(html_h3("Gauge"), href="dash_daq/gauge"),

    dcc_markdown("A gauge component that points to some value between some range."),

    gauge_index_example.source_code,
    gauge_index_example.layout,

    html_a(html_h3("GraduatedBar"), href="#"),

    dcc_markdown("A graduated bar component that displays a value within some range as a percentage."),

    graduatedbar_index_example.source_code,
    graduatedbar_index_example.layout,

    html_a(html_h3("Indicator"), href="#"),

    dcc_markdown("A boolean indicator LED."),

    indicator_index_example.source_code,
    indicator_index_example.layout,

    html_a(html_h3("Joystick"), href="#"),

    dcc_markdown("A joystick that can be used to apply direction and force."),

    joystick_index_example.source_code,
    joystick_index_example.layout,

    html_a(html_h3("Knob"), href="#"),

    dcc_markdown("A knob component that can be turned to a value between some range."),

    knob_index_example.source_code,
    knob_index_example.layout,

    html_a(html_h3("LEDDisplay"), href="#"),

    dcc_markdown("A 7-segment LED display component."),

    leddisplay_index_example.source_code,
    leddisplay_index_example.layout,

    html_a(html_h3("NumericInput"), href="#"),

    dcc_markdown("A numeric input component that can be set to a value between some range."),

    numericinput_index_example.source_code,
    numericinput_index_example.layout,
    
    html_a(html_h3("PowerButton"), href="#"),

    dcc_markdown("A power button component that can be turned on or off."),

    powerbutton_index_example.source_code,
    powerbutton_index_example.layout,

    html_a(html_h3("PrecisionInput"), href="#"),

    dcc_markdown("A numeric input component that converts an input value to the desired precision.
    "),

    precisioninput_index_example.source_code,
    precisioninput_index_example.layout,

    html_a(html_h3("Slider"), href="#"),

    dcc_markdown("A slider component with support for a target value.
    "),

    slider_index_example.source_code,
    slider_index_example.layout,

    html_a(html_h3("StopButton"), href="#"),

    dcc_markdown("A stop button."),

    stopbutton_index_example.source_code,
    stopbutton_index_example.layout,

    html_a(html_h3("Tank"), href="#"),

    dcc_markdown("A tank component that fills to a value between some range."),

    tank_index_example.source_code,
    tank_index_example.layout,

    html_a(html_h3("Thermometer"), href="#"),

    dcc_markdown("A thermometer component that fills to a value between some range."),

    thermometer_index_example.source_code,
    thermometer_index_example.layout,

    html_a(html_h3("ToggleSwitch"), href="#"),

    dcc_markdown("A switch component that toggles between two values."),

    toggleswitch_index_example.source_code,
    toggleswitch_index_example.layout,

    html_a(html_h3("DarkThemeProvider"), href="dash_daq/dark_theme_provider"),

    dcc_markdown("A component placed at the root of the component tree to 
    make all components match the dark theme."),

    darkthemeprovider_index_example.source_code,
    darkthemeprovider_index_example.layout

end

end