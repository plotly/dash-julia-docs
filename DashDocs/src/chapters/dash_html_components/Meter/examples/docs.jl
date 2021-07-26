using Dash, DashCoreComponents

app = dash()

app.layout = dcc_markdown(
  """
# html_meter
### Reference & Documentation
A `Meter` component. `Meter` is a wrapper for the `<meter>` HTML5 element. For detailed attribute info see: [https://developer.mozilla.org/en-US/docs/Web/HTML/Element/meter](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/meter)


#### Keyword arguments:

* `children` (a list of or a singular dash component, String or Number; optional): The children of this component.
* `id` (String; optional): The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.
* `accessKey` (String; optional): Keyboard shortcut to activate or add focus to the element.
* `aria-*` (String; optional): A wildcard aria attribute.
* `className` (String; optional): Often used with CSS to style elements with common properties.
* `contentEditable` (String; optional): Indicates whether the element's content is editable.
* `contextMenu` (String; optional): Defines the ID of a `<menu>` element which will serve as the element's context menu.

* `data-*` (String; optional): A wildcard data attribute.
* `dir` (String; optional): Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left).
* `draggable` (String; optional): Defines whether the element can be dragged.
* `form` (String; optional): Indicates the form that is the owner of the element.
* `hidden` (a value equal to: "hidden", "HIDDEN" | Boolean; optional): Prevents rendering of given element, while keeping child elements, e.g. script elements, active.
* `high` (String; optional): Indicates the lower bound of the upper range.
* `key` (String; optional): A unique identifier for the component, used to improve performance by React.js while rendering components See [https://reactjs.org/docs/lists-and-keys.html](https://reactjs.org/docs/lists-and-keys.html) for more info.
* `lang` (String; optional): Defines the language used in the element.
* `loading_state` (Dict; optional): Object that holds the loading state object coming from dash-renderer. loading_state is a Dict with keys:
    * `component_name` (String; optional): Holds the name of the component that is loading.
    * `is_loading` (Boolean; optional): Determines if the component is loading or not.
    * `prop_name` (String; optional): Holds which property is loading.



* `low` (String; optional): Indicates the upper bound of the lower range.
* `max` (String | Number; optional): Indicates the maximum value allowed.
* `min` (String | Number; optional): Indicates the minimum value allowed.
* `n_clicks` (Number; default 0): An integer that represents the number of times that this element has been clicked on.
* `n_clicks_timestamp` (Number; default -1): An integer that represents the time (in ms since 1970) at which n_clicks changed. This can be used to tell which button was changed most recently.
* `optimum` (String; optional): Indicates the optimal numeric value.
* `role` (String; optional): The ARIA role attribute.

* `spellCheck` (String; optional): Indicates whether spell checking is allowed for the element.
* `style` (Dict; optional): Defines CSS styles which will override styles previously set.
* `tabIndex` (String; optional): Overrides the browser's default tab order and follows the one specified instead.
* `title` (String; optional): Text to be displayed in a tooltip when hovering over the element.
* `value` (String; optional): Defines a default value which will be displayed in the element on page load.
  """
  
)

run_server(app, "0.0.0.0", debug=true)