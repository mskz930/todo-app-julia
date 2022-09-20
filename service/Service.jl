module Service

using ..Model
using ..DB


using .Model: UserDto, LoginDto
using .DB
using DataFrames


abstract type AbstractService end
abstract type LoginService <: AbstractService end

login(::Type{LoginService}, args...) = login(LoginService(), args...);

function get_user(::LoginService, dto::LoginDto)::UserDto
    try
        conn = DB.get_conn()
        sql = "select id, name, email from users where id = ?"
        stmt = DBInterface.prepare(conn, sql)
        rows = DBInterface.execute(stmt, dto) |> DataFrame
    catch e
        println(e)
        
    finally
        close(conn)
    end

    if size(rows, 1) == 0
        return
    end
    
    row = rows[1, :]
    user = UserDto(id=row.id, name=row.name, email=row.email)
    return user
end

authenticate(user::UserDto, password::AbstractString) = user.password == password




end # module
