using Base: @kwdef

abstract type AbstractDto end

@kwdef struct TodoDto <: AbstractDto
    id::Int64
    task::String
    category_id::Int64
    isdone::Bool
end

"""
    UserDto

ユーザー情報用DTO
"""
@kwdef struct UserDto <: AbstractDto
    Id::Int
    Name::String
    Email::String
end

"""

ログイン用DTO
"""
@kwdef struct LoginDto
    Email::String
    Password::String
end


