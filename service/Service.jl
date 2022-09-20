module Service

using ..Model
using ..DB


using .Model: UserDto, LoginDto
using .DB
using DataFrames


abstract type AbstractService end
abstract type LoginService end
abstract type TodoService end


# UserDtoを取得する
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

# パスワード認証: 
# ok => UserDtoを返す, error => nothingを返す
function login(::Type{LoginService}, login_dto::LoginDto)::Tuple{Bool,Union{UserDto,Nothing}}
    user = get_user(user_id)
    if user === nothing
        return false, nothing
    end
    if user.password == login_dto.password
       return true, user
    else
        return false, nothing
    end 
end

function create(::Type{TodoService}, todo_dto::TodoDto)
    if !exists_by_email(TodoRepository, todo_dto.email)
        return false
    end
    
    todo = Todo(todo_dto) # 
    result = create(TodoRepository, todo)
    
    return result
end

function 

end # module
