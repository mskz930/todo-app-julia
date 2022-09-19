module Repository

include("./model/Model.jl")

using .Model: TodoDto

abstract type AbstractRepository end
abstract type TodoRepository <: AbstractRepository end

#=
function create(::Type{TodoRepository}, dto::TodoDto)
    todo = convert(Todo, dto)
end
    

function convert(::Type{Todo}, dto::TodoDto)
    
end
=#

end # module