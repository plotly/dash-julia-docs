using Dash, DashCoreComponents

app = dash()

app.layout = dcc_markdown(
  """
  # html_embed
### Reference & Documentation
An `Embed` component. `Embed` is a wrapper for the `<embed>` HTML5 element. For detailed attribute info see: [https://developer.mozilla.org/en-US/docs/Web/HTML/Element/embed](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/embed)
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
* `height` (String | Number; optional): Specifies the height of elements listed here. For all other elements, use the CSS height property. Note: In some instances, such as `<div>`, this is a legacy attribute, in which case the CSS height property should be used instead.
* `hidden` (a value equal to: "hidden", "HIDDEN" | Boolean; optional): Prevents rendering of given element, while keeping child elements, e.g. script elements, active.
* `key` (String; optional): A unique identifier for the component, used to improve performance by React.js while rendering components See [https://reactjs.org/docs/lists-and-keys.html](https://reactjs.org/docs/lists-and-keys.html) for more info.
* `lang` (String; optional): Defines the language used in the element.
* `loading_state` (Dict; optional): Object that holds the loading state object coming from dash-renderer. loading_state is a Dict with keys:
    * `component_name` (String; optional): Holds the name of the component that is loading.
    * `is_loading` (Boolean; optional): Determines if the component is loading or not.
    * `prop_name` (String; optional): Holds which property is loading.
    
* `n_clicks` (Number; default 0): An integer that represents the number of times that this element has been clicked on.
* `n_clicks_timestamp` (Number; default -1): An integer that represents the time (in ms since 1970) at which n_clicks changed. This can be used to tell which button was changed most recently.
* `role` (String; optional): The ARIA role attribute.
* `spellCheck` (String; optional): Indicates whether spell checking is allowed for the element.
* `src` (String; optional): The URL of the embeddable content.
* `style` (Dict; optional): Defines CSS styles which will override styles previously set.
* `tabIndex` (String; optional): Overrides the browser's default tab order and follows the one specified instead.
* `title` (String; optional): Text to be displayed in a tooltip when hovering over the element.
* `type` (String; optional): Defines the type of the element.
* `width` (String | Number; optional): For the elements listed here, this establishes the element's width. Note: For all other instances, such as `<div>`, this is a legacy attribute, in which case the CSS width property should be used instead.
  """
  
)

run_server(app, "0.0.0.0", debug=true)