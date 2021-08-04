using Dash, DashHtmlComponents
using DashTable

using CSV, DataFrames, JSON

types = Dict(
    "id" =>  "numeric",
    "Complaint_ID" =>  "numeric",
    "ZIP_code" =>  "numeric",
    "Date_received" =>  "datetime",
    "Date_sent_to_company" =>  "datetime",
)
df = CSV.read(download("https://github.com/plotly/datasets/raw/master/26k-consumer-complaints.csv"), DataFrame)
df[!,"id"] = df[!, "Column1"]
select!(df, Not(:Column1))
select!(df,vcat("id",(names(df))[1:end-1]))
rename!(df,[replace(n, " " => "_") for n in names(df)])
rename!(df,[replace(n, "-" => "_") for n in names(df)])

app = dash(serve_locally=true)


app.layout = DashTable.dash_datatable(
    id="demo-table",
    data=Dict.(pairs.(eachrow(df))),
    columns=[Dict( "id" =>  i, "name" =>  i, "type" =>  get(types, i, "any")) for i in names(df)],
    filter_action="custom",
    page_action="native",
    page_size=15,
    virtualization=true,
    style_cell=Dict(
        "min-width" =>  "100px"
    ),
    css=[
        Dict( "selector" =>  ".row-1", "rule" =>  "min-height : 500px;" )
    ]
)
function to_string(filter)
    operator_type = get(filter,"type", "relational-operator")
    operator_subtype = get(filter,"subType","=")

    if operator_type == "relational-operator"
        if operator_subtype == "="
            return "=="
        else
            return operator_subtype
        end
    elseif operator_type == "logical-operator"
        if operator_subtype == "&&"
            return "&"
        else
            return "|"
        end
    elseif operator_type == "expression" && operator_subtype == "value" && typeof(get(filter,"value","Hello")) == String
        return "$(string(get(filter,"value")))"
    else
        return get(filter,"value",123)
    end
end

construct_filter(derived_query_structure, df; complexOperator=nothing) = (derived_query_structure, df) 
function construct_filter(derived_query_structure::NamedTuple, df; complexOperator=nothing)

    # there is no query; return an empty filter string and the
    # original dataframe
    if derived_query_structure isa Nothing
        return ("", df)
    end

    # the operator typed in by the user; can be both word-based or
    # symbol-based
    operator_type =derived_query_structure.type

    # the symbol-based representation of the operator
    operator_subtype = derived_query_structure.subType

    # the LHS and RHS of the query, which are both queries themselves
    left, right = nothing, nothing
    if haskey(derived_query_structure,:left) 
        left = derived_query_structure.left
    end
    if haskey(derived_query_structure,:rigt) 
        right = derived_query_structure.right
    end

    # the base case
    if left isa Nothing && right isa Nothing
        @show "here"
        return (to_string(derived_query_structure), df)
    end
    # recursively apply the filter on the LHS of the query to the
    # dataframe to generate a new dataframe
    (left_query, left_df) = construct_filter(left, df)

    # apply the filter on the RHS of the query to this new dataframe
    # (right_query, right_df) = construct_filter(right, left_df)
    # "datestartswith" and "contains" can"t be used within a pandas
    # filter string, so we have to do this filtering ourselves
    # if !(complexOperator isa Nothing)
    #     right_query = right.value
    #     # perform the filtering to generate a new dataframe
    #     if complexOperator == "datestartswith"
    #         return ("", right_df[right_df[left_query].astype(str).str.startswith(right_query)])
    #     elseif complexOperator == "contains":
    #         return ("", right_df[right_df[left_query].astype(str).str.contains(right_query)])
    #     else
    #     end
    # end

    # if operator_type == "relational-operator" and operator_subtype in ["contains", "datestartswith"]:
    #     return construct_filter(derived_query_structure, df, complexOperator=operator_subtype)

    # # construct the query string; return it and the filtered dataframe
    # return ("{} {} {}".format(
    #     left_query,
    #     to_string(derived_query_structure) if left_query != "" and right_query != "" else "",
    #     right_query
    # ).strip(), right_df)
    return left_query, right_query
end
callback!(app,
    Output("demo-table", "data"),
    Input("demo-table", "derived_filter_query_structure")
) do derived_query_structure
    # (pd_query_string, df_filtered) = construct_filter(derived_query_structure, df)

    # if pd_query_string != ""
    #     df_filtered = df_filtered.query(pd_query_string)
    # end

    return Dict.(pairs.(eachrow(df)))
end

run_server(app, "0.0.0.0", debug=true)
