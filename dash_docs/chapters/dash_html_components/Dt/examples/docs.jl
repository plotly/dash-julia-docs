using Dash, DashCoreComponents

app = dash()

app.layout = dcc_markdown(
  "
  # html_a
### Reference & Documentation
An A component. A is a wrapper for the `<a>` HTML5 element. For detailed attribute info see: [https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a)

Keyword arguments:

* children (a list of or a singular dash component, string or number; optional): The children of this component.
* id (string; optional): The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.
* accessKey (string; optional): Keyboard shortcut to activate or add focus to the element.
* aria-* (string; optional): A wildcard aria attribute.
* className (string; optional): Often used with CSS to style elements with common properties.
* contentEditable (string; optional): Indicates whether the element's content is editable.
* contextMenu (string; optional): Defines the ID of a `<menu>` element which will serve as the element's context menu.
* data-* (string; optional): A wildcard data attribute.
* dir (string; optional): Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left).
* download (string; optional): Indicates that the hyperlink is to be used for downloading a resource.
* draggable (string; optional): Defines whether the element can be dragged.
* hidden (a value equal to: 'hidden', 'HIDDEN' | boolean; optional): Prevents rendering of given element, while keeping child elements, e.g. script elements, active.
* href (string; optional): The URL of a linked resource.
* hrefLang (string; optional): Specifies the language of the linked resource.
* key (string; optional): A unique identifier for the component, used to improve performance by React.js while rendering components See [https://reactjs.org/docs/lists-and-keys.html](https://reactjs.org/docs/lists-and-keys.html) for more info.
* lang (string; optional): Defines the language used in the element.
* loading_state (dict; optional): Object that holds the loading state object coming from dash-renderer. `loading_state` is a dict with keys:
    * component_name (string; optional): Holds the name of the component that is loading.
    * is_loading (boolean; optional): Determines if the component is loading or not.
    * prop_name (string; optional): Holds which property is loading.
* media (string; optional): Specifies a hint of the media for which the linked resource was designed.
* n_clicks (number; default 0): An integer that represents the number of times that this element has been clicked on.
* n_clicks_timestamp (number; default -1): An integer that represents the time (in ms since 1970) at which n_clicks changed. This can be used to tell which button was changed most recently.
* referrerPolicy (string; optional): Specifies which referrer is sent when fetching the resource.
* rel (string; optional): Specifies the relationship of the target object to the link object.
* role (string; optional): The ARIA role attribute.
* shape (string; optional)
* spellCheck (string; optional): Indicates whether spell checking is allowed for the element.
* style (dict; optional): Defines CSS styles which will override styles previously set.
* tabIndex (string; optional): Overrides the browser's default tab order and follows the one specified instead.
* target (string; optional): Specifies where to open the linked document (in the case of an `<a>` element) or where to display the response received (in the case of a `<form>` element).
* title (string; optional): Text to be displayed in a tooltip when hovering over the element.
  "
)

run_server(app, "0.0.0.0", debug=true)