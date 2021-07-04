
module chapters_dash_html_components_button

using Dash, DashHtmlComponents

include("../../../utils.jl")

export examples

examples_path = joinpath(@__DIR__, "examples")

docs = LoadExampleCode(string(examples_path, "/docs.jl"))
button_basic = LoadExampleCode(string(examples_path, "/button_basic.jl"))
button_ctx = LoadExampleCode(string(examples_path, "/button_ctx.jl"))

app =  dash()

button_basic.callback!(app) 
button_ctx.callback!(app) 
examples = [button_basic, button_ctx]

app.layout = html_div() do

    html_h1("Button Examples and Reference"),

    html_h3("Button Basic Example"),

    dcc_markdown("""
    An example of a default button without any extra properties
     and `n_clicks` in the callback. `n_clicks` is an integer that
      represents that number of times the button has been clicked.
       Note that the original value is `None`.
    """),

    button_basic.source_code,
    button_basic.layout,

    html_h3("Determining which Button Changed with callback_context"),

    dcc_markdown("""
    This example utilizes the `callback_context` property,
    to determine which input was changed.
    """),
    button_ctx.source_code,
    button_ctx.layout,

    html_h3("Button Properties"),

    dcc_markdown(
        """
        Access this documentation in your Julia REPL with:
        ```    
            help? html_button
        ```
        Our recommended IDE for writing Dash apps is Dash Enterprise's 
        [Data Science Workspaces](https://plotly.com/dash/workspaces/),
        which has typeahead support for Dash Component Properties. Find out
        if your company is using [Dash Enterprise](https://go.plotly.com/company-lookup).
        """
    ),
    dcc_markdown(
    """
    * `children` (a list of or a singular dash component, String or Number; optional): The children of this component.
 
    * `id` (String; optional): The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.
    
    * `accessKey` (String; optional): Keyboard shortcut to activate or add focus to the element.
    
    * `aria-*` (String; optional): A wildcard aria attribute.
    
    * `autoFocus` (a value equal to: "autoFocus", "autofocus", "AUTOFOCUS" | Boolean; optional): The element should be automatically focused after the page loaded.
    
    * `className` (String; optional): Often used with CSS to style elements with common properties.
    
    * `contentEditable` (String; optional): Indicates whether the element"s content is editable.
    
    * `contextMenu` (String; optional): Defines the ID of a `<menu>` element which will serve as the element"s context menu.
    
    * `data-*` (String; optional): A wildcard data attribute.
    
    * `dir` (String; optional): Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left).
    
    * `disabled` (a value equal to: "disabled", "DISABLED" | Boolean; optional): Indicates whether the user can interact with the element.
    
    * `draggable` (String; optional): Defines whether the element can be dragged.
    
    * `form` (String; optional): Indicates the form that is the owner of the element.
    
    * `formAction` (String; optional): Indicates the action of the element, overriding the action defined in the `<form>`.
    
    * formEncType (String; optional): If the button/input is a submit button (type="submit"), this attribute sets the encoding type to use during form submission. If this attribute is specified, it overrides the enctype attribute of the button"s form owner.
    
    * `formMethod` (String; optional): If the button/input is a submit button (type="submit"), this attribute sets the submission method to use during form submission (GET, POST, etc.). If this attribute is specified, it overrides the method attribute of the button's form owner.
    
    * `formNoValidate` (a value equal to: "formNoValidate", "formnovalidate", "FORMNOVALIDATE" | Boolean; optional): If the button/input is a submit button (type="submit"), this Boolean attribute specifies that the form is not to be validated when it is submitted. If this attribute is specified, it overrides the novalidate attribute of the button's form owner.
    
    * `formTarget` (String; optional): If the button/input is a submit button (type="submit"), this attribute specifies the browsing context (for example, tab, window, or inline frame) in which to display the response that is received after submitting the form. If this attribute is specified, it overrides the target attribute of the button"s form owner.
    
    * `hidden` (a value equal to: "hidden", "HIDDEN" | Boolean; optional): Prevents rendering of given element, while keeping child elements, e.g. script elements, active.
    
    * `key` (String; optional): A unique identifier for the component, used to improve performance by React.js while rendering components See [https://reactjs.org/docs/lists-and-keys.html](https://reactjs.org/docs/lists-and-keys.html) for more info.
    
    * `lang` (String; optional): Defines the language used in the element.
    
    * `loading_state` (dict; optional): Object that holds the loading state object coming from dash-renderer.
    
    * `loading_state` is a dict with keys:
    
        * `component_name` (String; optional): Holds the name of the component that is loading.

        * `is_loading` (Boolean; optional): Determines if the component is loading or not.

        * `prop_name` (String; optional): Holds which property is loading.
    
    * `n_clicks` (Number; default 0): An integer that represents the number of times that this element has been clicked on.
    
    * `n_clicks_timestamp` (Number; default -1): An integer that represents the time (in ms since 1970) at which n_clicks changed. This can be used to tell which button was changed most recently.
    
    * `name` (String; optional): Name of the element. For example used by the server to identify the fields in form submits.
    
    * `role` (String; optional): The ARIA role attribute.
    
    * `spellCheck` (String; optional): Indicates whether spell checking is allowed for the element.
    
    * `style` (dict; optional): Defines CSS styles which will override styles previously set.
    
    * `tabIndex` (String; optional): Overrides the browser's default tab order and follows the one specified instead.
    
    * `title` (String; optional): Text to be displayed in a tooltip when hovering over the element.
    
    * `type` (String; optional): Defines the type of the element.
    
    * `value` (String; optional): Defines a default value which will be displayed in the element on page load.
    """)
end

end
