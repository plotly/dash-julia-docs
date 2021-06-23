using Dash, DashCoreComponents
app = dash()

app.layout = dcc_markdown("
#### Dash and Markdown

Dash supports [Markdown](http://commonmark.org/help).

Markdown is a simple way to write and format text.
It includes a syntax for things like **bold text** and *italics*,
[links](http://commonmark.org/help), inline `code` snippets, lists,
quotes, and more.
")
run_server(app, "0.0.0.0", debug=true)