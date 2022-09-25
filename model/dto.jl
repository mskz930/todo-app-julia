using Base: @kwdef
using JSON3, StructTypes

export TodoDto, LoginDto, UserDto

abstract type AbstractDto end

@kwdef struct TodoDto <: AbstractDto
    id::Int64
    user_id::Int64
    category_id::Int64
    task::String
    done::Bool
end
StructTypes.StructType(::Type{TodoDto}) = StructTypes.Struct()

"""
    UserDto

ユーザー情報用DTO
"""
@kwdef struct UserDto <: AbstractDto
    id::Union{Int,Nothing}
    name::String
    email::String
    password::Union{String,Nothing}
end
StructTypes.StructType(::Type{UserDto}) = StructTypes.Struct()

"""

ログイン用DTO
"""
@kwdef struct LoginRequest
    email::String
    password::String
end
StructTypes.StructType(::Type{LoginRequest}) = StructTypes.Struct()


@kwdef struct ErrorResponse
    status::Union{Int, Nothing}
    message::Union{String, Nothing}
end
StructTypes.StructType(::Type{ErrorResponse}) = StructTypes.Struct()