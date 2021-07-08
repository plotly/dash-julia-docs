macro eval_toplevel()
    println("dddd")
    result = Expr(:block)
    result.args = TOP_LEVEL
    return esc(result)
end

function source_formatted(source)

end

macro source_str(name)
    source_str = "```julia\n$(EXAMPLES_REGISTRY[name].source)\n```"
    return :(
        html_div(
            dcc_markdown($source_str),
            className = "code-container",
            style = Dict("borderLeft" => "thin lightgrey solid"),
        )
    )
end
macro layout_str(name)
    return :(
        html_div(
            EXAMPLES_REGISTRY[$name].layout(),
            className = "example-container",
            style = Dict("marginBottom" => "10px"),
        )
    )
end

macro doc_chapter(name, url, body)
end