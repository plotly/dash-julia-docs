macro parse_example_source(name)
    println(__source__)
end


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

is_callbackcall(expr) = expr.head == :call && expr.args[1] == :callback!

function is_callback(expr)
  is_callbackcall(expr) && return true #callback!((x)->x, ....)
  (expr.head == :do && is_callbackcall(expr.args[1])) && return true #do syntax
  return false
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
                arg.args[2]
              )
            )
            continue
          end
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

