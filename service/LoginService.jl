# login.jl

using Model: UserDto, LoginDto

# UserDtoを取得する
function get_user(dto::LoginDto)::UserDto
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
function login(login_dto::LoginDto)::Tuple{Bool,Union{UserDto,Nothing}}
    user = get_user(user_id)
    if user === nothing
        return
    end
    if user.password == login_dto.password
       return
    else
        return user
    end 
end