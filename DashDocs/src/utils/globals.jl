struct ExampleData
    source ::String
    layout ::Function
    callbacks ::Function
end
const EXAMPLES_REGISTRY = Dict{String, ExampleData}()

const TOP_LEVEL = []

const DATASETS = Dict{String, DataFrame}()
const CHAPTERS = Dict{String, Function}()