using Base: @kwdef

abstract type AbstractDto end

@kwdef struct TodoDto <: AbstractDto
    id::Int64
    task::String
    category_id::Int64
    isdone::Bool
end

@kwdef struct UserDto <: AbstractDto
    Id::Int
    Name::String
    Email::String
end


@kwdef struct LoginDto
    Email::String
    Password::String
end


