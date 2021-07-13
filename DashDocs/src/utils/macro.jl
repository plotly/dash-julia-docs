macro eval_toplevel()
    result = Expr(:block)
    result.args = TOP_LEVEL
    return esc(result)
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
            EXAMPLES_REGISTRY[$name].layout()
    )
end

macro pkgver_str(name)
    for pkg in values(Pkg.dependencies())
        pkg.name == name && return pkg.version
    end
    error("Package $name don't found")
end

macro doc_chapter(url, body)
    base_dir = joinpath(dirname(string(__source__.file)), "examples")
    local layout::Expr
    for arg in body.args
        !isa(arg, Expr) && continue
        if arg.head == :macrocall
            if arg.args[1] == Symbol("@example")
                register_example(string(arg.args[3]), joinpath(base_dir, string(arg.args[4])))
            end
            if arg.args[1] == Symbol("@layout")
                layout = arg.args[3]
            end
        end
    end

    return esc(:(
         CHAPTERS[$url] = function () $(layout) end
        ))
end