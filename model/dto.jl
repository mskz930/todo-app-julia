using Base: @kwdef

abstract type AbstractDto end

struct TodoDto
    id::Int64
    task::String
    category_id::Int64
    isdone::Bool
end

@kwdef struct UserDto
    Id::Int
    Name::String
    Email::String
end


@kwdef struct LoginDto
    Email::String
    Password::String
end


