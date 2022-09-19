using Dates: DateTime

abstract type AbstractEntity end


struct Todo <: AbstractEntity
    id::Int
    user_id::Int
    category_id::Int
    task::String
    created_at::DateTime
    updated_at::DateTime
end

