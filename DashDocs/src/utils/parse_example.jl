
const top_level_exprs = Set([:using, :import, :const])
# pull up and return top level calls from Expr
function top_level_popout!(e::Expr)
    top_inds = findall(e.args) do arg
        return isa(arg, Expr) && arg.head in top_level_exprs
    end
    result = e.args[top_inds]
    deleteat!(e.args, top_inds)
    return result
end

#parse if it is  DataFrame(urldownload(url)) expression, returns url
function check_is_download(right::Expr)
    (right.head != :call || right.args[1] != :DataFrame || !isa(right.args[2], Expr)) && return nothing
    (right.args[2].head != :call || right.args[2].args[1] != :urldownload) && return nothing
    return string(right.args[2].args[2])
end
#parse if it is  dataset(type, dataset) expression, returns "$type|$dataset"
function check_is_rdataset(right::Expr)
    (right.head != :call || right.args[1] != :dataset) && return nothing
    return join(string.(right.args[2:end]), "|")
end
function check_dataset(right::Expr)
    downlad_name = check_is_download(right)
    return isnothing(downlad_name) ? check_is_rdataset(right) : downlad_name
end
function datasets_popout!(e::Expr)
    for arg in e.args
        !isa(arg, Expr) && continue
        arg.head != :(=) && continue
        (!isa(arg.args[1], Symbol)  || !isa(arg.args[2], Expr)) && continue
        var = arg.args[1]
        right = arg.args[2]
        url = check_dataset(right)
        isnothing(url) && continue
        if !haskey(DATASETS, url)
            DATASETS[url] = eval(right)
        end
        arg.args[2] = :(copy(DATASETS[$url]))
    end
end

is_callbackcall(expr) = expr.head == :call && expr.args[1] == :callback!

function is_callback(expr)
  is_callbackcall(expr) && return true #callback!((x)->x, ....)
  (expr.head == :do && is_callbackcall(expr.args[1])) && return true #do syntax
  return false
end
function remove_callbacks!(expr::Expr)
  filter!(expr.args) do arg
      !isa(arg, Expr) && return true
      return !is_callback(arg)
  end
  for arg in expr.args
    if arg isa Expr
      remove_callbacks!(arg)
    end
  end
end
#make the function that return layout of example
function make_layout_function(e::Expr)
    fbody = Expr(:block)
    for arg in e.args
      if arg isa Expr

          if arg.head == :call && arg.args[1] == :run_server
            continue
          end
          if is_callback(arg)
            continue
          end
          if arg.head == :(=) && arg.args[1] == :app
            continue
          end
          if arg.head == :(=) && arg.args[1] == :(app.layout)

            push!(fbody.args,
              Expr(:(=),
                :layout,
                :(
                    html_div(
                        $(arg.args[2]),
                        className = "example-container",
                        style = Dict("marginBottom" => "10px"),
                    )
                )

              )
            )
            continue
          end
          remove_callbacks!(arg)
      end
      push!(fbody.args, arg)
    end
    push!(fbody.args, :(return layout))
    return Expr(:function, Expr(:tuple), fbody)
end

#make the function that return regs callbacks
function make_callbacks_function(e::Expr)
    fbody = Expr(:block)
    for arg in e.args
      if arg isa Expr

          if arg.head == :call && arg.args[1] == :run_server
            continue
          end
          if arg.head == :(=) && arg.args[1] == :app
            continue
          end
          if arg.head == :(=) && arg.args[1] == :(app.layout)
            continue
          end
      end
      push!(fbody.args, arg)
    end
    return Expr(:function, Expr(:tuple, :app), fbody)
end

#split example expression into top_level part, layout making function and callbacks register function
function split_example_expr!(example::Expr)
    top_level = top_level_popout!(example)
    datasets_popout!(example)
    layout = make_layout_function(example)
    callbacks = make_callbacks_function(example)
    return (
        top_level,
        layout,
        callbacks
    )
end

function register_example(name, filename::AbstractString)
    source = read(filename, String)

    expr = Base.parse_input_line(source; filename = filename)
    top_level, layout, callbacks  = split_example_expr!(expr)
    append!(TOP_LEVEL, top_level)
    EXAMPLES_REGISTRY[name] = ExampleData(source, eval(layout), eval(callbacks))
end

