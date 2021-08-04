using Dash, DashHtmlComponents, DashCoreComponents
using DashTable

using CSV, DataFrames 

df = CSV.read(download("https://raw.githubusercontent.com/plotly/datasets/master/gapminder2007.csv"), DataFrame)
df[!," index"] =1:nrow(df)

app = dash()

PAGE_SIZE = 5

app.layout =  DashTable.dash_datatable(
    id="table-filtering",
    columns=[
        Dict("name" =>  i, "id" =>  i) for i in sort(names(df))
    ],
    page_current=0,
    page_size=PAGE_SIZE,
    page_action="custom",

    filter_action="custom",
    filter_query=""
)
operators = [["ge ", ">="],
["le ", "<="],
["lt ", "<"],
["gt ", ">"],
["ne ", "!="],
["eq ", "=="],
["contains "],
["datestartswith "]]

function split_filter_part(filter_part)    
    for operator_type in operators
        for operator in operator_type
            if occursin(operator,filter_part)
                name_part, value_part = split(filter_part,operator,limit=2)
                name = name_part[
                    findfirst(isequal('{'), 
                    name_part)+1:findlast(isequal('}'), name_part)-1
                ]
                value_part = strip(value_part)
                v0 = value_part[1]
                if (v0 == value_part[end] && v0 in ("'", '"', '`'))
                    value = replace(value_part[2: end], string("\\",v0) => v0)
                else
                    try
                        value = Float64(value_part)
                    catch
                        value = value_part
                    end
                end
                return name, strip(operator_type[1]), value
            end
        end
    end
end

callback!(app,
    Output("table-filtering", "data"),
    Input("table-filtering", "page_current"),
    Input("table-filtering", "page_size"),
    Input("table-filtering", "filter_query")
    ) do page_current,page_size, filter
    filtering_expressions = split(filter," && ")
    dff = df
    for filter_part in filtering_expressions
        if filter_part != ""            
            col_name, operator, filter_value = split_filter_part(filter_part)
            if operator in ("eq", "ne", "lt", "le", "gt", "ge")
                if operator == "eq"
                    dff = DataFrames.filter(r -> r[col_name]==filter_value, dff)
                elseif operator == "ne"
                    dff = DataFrames.filter(r -> r[col_name]!=filter_value, dff)
                elseif operator == "lt"
                    dff = DataFrames.filter(r -> r[col_name]<filter_value, dff)
                elseif operator == "le"
                    dff = DataFrames.filter(r -> r[col_name]<=filter_value, dff)
                elseif operator == "gt"
                    dff = DataFrames.filter(r -> r[col_name]>filter_value, dff)
                else
                    dff = DataFrames.filter(r -> r[col_name]>=filter_value, dff)
                end                
            elseif operator == "contains"
                dff = DataFrames.filter(r -> occursin(filter_value,string(r[col_name])), dff)
            else
                dff = DataFrames.filter(r -> startswith(r[col_name],filter_value), dff)
            end
        end
    end
    if nrow(dff) > ((page_current+ 1)*page_size)
        return Dict.(pairs.(eachrow(
            dff[(page_current*page_size+1):((page_current+ 1)*page_size), :]
        )))
    else
        return Dict.(pairs.(eachrow(dff)))
    end
end


run_server(app, "0.0.0.0", debug=true)
