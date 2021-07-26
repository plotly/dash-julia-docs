@doc_chapter "/dash_core_components/textarea" begin

    @example simple_textarea "simple_textarea.jl"
    @example button_press "button_press.jl"
  
    @layout html_div() do

    html_h1("Textarea Examples and Reference"),

    html_h3("Simple Textarea Example"),

    source"simple_textarea",
    layout"simple_textarea",

    html_h3("Update `dcc_textarea` callback on button press"),

    source"button_press",
    layout"button_press"

end

end