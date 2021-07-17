using Dash
using DashHtmlComponents
using DashCoreComponents

external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]

app = dash(external_stylesheets=external_stylesheets)

app.layout = html_div([
    html_button("Button 1", id="btn-nclicks-1", n_clicks=0),
    html_button("Button 2", id="btn-nclicks-2", n_clicks=0),
    html_button("Button 3", id="btn-nclicks-3", n_clicks=0),
    html_div(id="container-buttontimestamp")
])

callback!(app, Output("container-buttontimestamp", "children"),
              [Input("btn-nclicks-1", "n_clicks"),
              Input("btn-nclicks-2", "n_clicks"),
              Input("btn-nclicks-3", "n_clicks")]) do btn1, btn2, btn3
              isempty(callback_context().triggered) && throw(PreventUpdate())
            changed_id = [p[:prop_id] for p in callback_context().triggered][1]
    if occursin("btn-nclicks-1", changed_id)
        msg = "Button 1 was most recently clicked"
    elseif occursin("btn-nclicks-2", changed_id)
        msg = "Button 2 was most recently clicked"
    elseif occursin("btn-nclicks-3", changed_id)
        msg = "Button 3 was most recently clicked"
    else
        msg = "None of the buttons have been clicked yet"
    end
    return html_div(msg)
end
run_server(app)