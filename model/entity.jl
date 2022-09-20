using Dates: DateTime
using Base: @kwdef

abstract type AbstractEntity end

# todo entity
@kwdef struct Todo <: AbstractEntity
    id::Int
    user_id::Int
    category_id::Int
    task::String
    created_at::DateTime
    updated_at::DateTime
end

# user enitity
@kwdef struct User <: AbstractEntity
    id::Int
    name::String
    email::String
    password::String
    created_at::DateTime
    updated_at::DateTime
end

