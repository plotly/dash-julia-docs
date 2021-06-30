using Dash, DashHtmlComponents, DashCoreComponents

# This stylesheet makes the buttons and table pretty.
external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]


global app = dash(external_stylesheets=external_stylesheets)

app.layout = html_div([
    # The memory store reverts to the default on every page refresh
    dcc_store(id="memory"),
    # The local store will take the initial data
    # only the first time the page is loaded
    # and keep it until it is cleared.
    # dcc_store(id="local", storage_type="local"),
    # Same as the local store but will lose the data
    # when the browser/tab closes.
    dcc_store(id="session", storage_type="session"),
    html_table([
        html_thead([
            html_tr(html_th("Click to store in:", colSpan="3")),
            html_tr([
                html_th(html_button("memory", id="memory-button")),
                html_th(html_button("localStorage", id="local-button")),
                html_th(html_button("sessionStorage", id="session-button"))
            ]),
            html_tr([
                html_th("Memory clicks"),
                html_th("Local clicks"),
                html_th("Session clicks")
            ])
        ]),
        html_tbody([
            html_tr([
                html_td(0, id="memory-clicks"),
                html_td(0, id="local-clicks"),
                html_td(0, id="session-clicks")
            ])
        ])
    ])
])

# Create two callback for every store.
for store in ("memory", "local", "session")
# add a click to the appropriate store.
  callback!(app, Output(store, "data"),
    Input(string(store, "-button"), "n_clicks"),
    State(store, "data")) do n_clicks, data
    if n_clicks isa Nothing
        # prevent the None callbacks is important with the store component.
        # you don't want to update the store for nothing.
        throw(PreventUpdate())
    end
    # Give a default data dict with 0 clicks if there's no data.
    if typeof(data) == Nothing
      data = (clicks = 0,)
    else
      data = isempty(data) ? (clicks = 0,) : data
    end
    data = (;data...,clicks = data[Symbol("clicks")]+1)
    return data
  end 

  #  # output the stored clicks in the table cell.
  callback!(app, Output(string(store, "-clicks"), "children"),
    # Since we use the data prop in an output,
    # we cannot get the initial data on load with the data prop.
    # To counter this, you can use the modified_timestamp
    # as Input and the data as State.
    # This limitation is due to the initial None callbacks
    # https://github.com/plotly/dash-renderer/pull/81
    Input(store, "modified_timestamp"),
    State(store, "data")) do ts, data
    if ts isa Nothing
      throw(PreventUpdate())
    end
    
    data = (typeof(data) == Nothing) ? NamedTuple() : data
    if haskey(data, Symbol("clicks"))
      return data[Symbol("clicks")]
    else
      return 0
    end
  end   
end


run_server(app, "0.0.0.0", debug=true)
