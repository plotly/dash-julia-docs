using Dash, DashCoreComponents, DashHtmlComponents, Printf

function LoadExampleCode(filename, wd = nothing)
  example_file_as_string = read(filename, String)

  wd = joinpath(pwd(), isnothing(wd) ? "" : wd )
  return cd(wd) do

    parsed_exprs = ParseExampleExpr(Base.parse_input_line(example_file_as_string; filename = filename))

    return (
        layout = html_div(
            className = "example-container",
            children = parsed_exprs.layout,
            style = Dict("marginBottom" => "10px"),
        ),
        source_code = html_div(
            children = dcc_markdown(
                @sprintf("```julia\n%s\n```", example_file_as_string)
            ),
            className = "code-container",
            style = Dict("borderLeft" => "thin lightgrey solid"),
        ),
        callback! = eval(parsed_exprs.func)
       )
  end

end
const top_level_eval = Set([:using, :import, :const])

function ProcessArgs(args)
  result = []
  for code_block in args
    if code_block isa Expr
        if code_block.head == :call && code_block.args[1] == :run_server
          continue
        end
        if code_block.head in top_level_eval
          eval(code_block)
          continue
        end
        if code_block.head == :(=) && code_block.args[1] == :app
          continue
        end
        if code_block.head == :(=) && code_block.args[1] == :(app.layout)

          push!(result,
            Expr(:(=),
              :layout,
              code_block.args[2]
            )
          )
          continue
        end
    end
    push!(result, code_block)
  end
  return result
end

function ParseExampleExpr(expr)
  callback_funcs = Expr(:block)
  result = Expr(:block)
  result.args = ProcessArgs(expr.args)
  layout_get = Expr(:block,
    :(app = dash()),
    result.args...,
    :(return layout)
  )

  layout = eval(layout_get)
  return (layout = layout, func = Expr(:function, :(app,), result))
end

is_callbackcall(expr) = expr.head == :call && expr.args[1] == :callback!

function is_callback(expr)
  is_callbackcall(expr) && return true #callback!((x)->x, ....)
  (expr.head == :do && is_callbackcall(expr.args[1])) && return true #do syntax
  return false
end

function LoadAndDisplayComponent(example_string)
  return html_div(
    (
      html_div(
        children = dcc_markdown(@printf("```Julia\n%s```", example_string)),
        className = "code-container",
        style = Dict("borderLeft" => "thin lightgrey solid")
      ),
      html_div(
        children = include_string(Main, example_string),
        className = "example-container",
        style = Dict("marginBottom" => "10px", "overflow-x" => "initial")
      ),
    )
  )
end

function LoadAndDisplayComponent2(example_string)
  return html_div(
    (
      html_div(
        children = dcc_markdown(@printf("```Julia\n%s```", example_string)),
        className = "code-container",
        style = Dict("borderLeft" => "thin lightgrey solid")
      ),
      html_div(
        children = include_string(Main, example_string),
        className = "example-container",
        style = Dict("marginBottom" => "10px", "padding-bottom" => "30px")
      ),
    )
  )
end
