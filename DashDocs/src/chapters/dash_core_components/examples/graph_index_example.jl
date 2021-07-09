using Dash, DashCoreComponents

app = dash()
app.layout = dcc_graph(
  figure = (
    data = [
      (
        x=[1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012],
        y=[219, 146, 112, 127, 124, 180, 236, 207, 236, 263, 350, 430, 474, 526, 488, 537, 500, 439],
        name="Rest of world",
        marker=Dict(
            "color"=>"rgb(55, 83, 109)"
        )
      ),
     (
        x=[1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003,2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012],
        y=[16, 13, 10, 11, 28, 37, 43, 55, 56, 88, 105, 156, 270, 299, 340, 403, 549, 499],
        name="China",
        marker=Dict(
          "color" => "rgb(26, 118, 255)"
        )
      )
    ],
    layout=(
      title="US Export of Plastic Scrap",
      showlegend=true,
      legend=(
          x=0,
          y=1.0
      ),
      margin=(l=40, r=0, t=40, b=30)
    )
  ),
  style=Dict("height" => 300),
  id="my-graph"
)
run_server(app, "0.0.0.0", debug=true)