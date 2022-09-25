module UserRepository

using DB
using Dates
using DataFrames

export save, 
       find_by_email, 
       find_by_id, 
       exists, 
       update

function save(::UserRepository, dto::UserDto)::Bool
    result = DB.connect() do conn
        sql = """insert into users(id, name, email, password, created_at, updated_at)
            values (?, ?, ?, ?, now(), now())
        """
        stmt = DBInterface.prepare(conn, sql)
        DBInterface.execute(stmt, (dto.id, dto.name, dto.email, dto.password))
        return true
    end
    return result
end

function find_by_email(::UserRepository, email::AbstractString)::Union{UserDto,Nothing}
    user_dto = DB.connect() do conn
        sql = "select id, name, email, password from users where email = ?"
        stmt = DBInterface.prepare(conn, sql)
        rows = DBInterface.execute(stmt, (email, )) |> DataFrame
        if size(rows,1) > 0
            row = rows[1,:]
            return UserDto(row.id, row.name, row.email, row.password)
        else
            return
        end
    end
    return user_dto
end

function find_by_id(::UserRepository, id::Integer)::UserDto
    user_dto = DB.connect() do conn
        sql =  "select id, name, email, password from users where id = ?"
        stmt = DBInterface.prepare(conn, sql)
        rows = DBInterface.execute(stmt, (id,)) |> DaraFrame
        row = rows[1,:]
        UserDto(row.id, row.name, row.email, row.password)
    end
    return user_dto
end

function exists(::UserRepository, id::Integer)
    result = DB.connect() do  conn
        sql = "select count(*) from users where id = ?"
        stmt = DBInterface.prepare(conn, sql)
        rows = DBInterface.execute(stmt, (id,)) |> DataFrame
        return size(rows, 1) > 0
    end
    return result
end

function exists(::UserRepository, email::AbstractString)
    result = DB.connect() do  conn
        sql = "select count(*) from users where email = ?"
        stmt = DBInterface.prepare(conn, sql)
        rows = DBInterface.execute(stmt, (email,)) |> DataFrame
        println(rows)
        return size(rows, 1) > 0
    end
    println(result)
    return result
end

function update(::UserRepository, user::UserDto)
    result = DB.connect() do conn
        sql = "update users set name = ?, password = ?, updated_at = now() where email = ?"
        stmt = DBInterface.prepare(conn, sql)
        DBInterface.execute(stmt, (user.name, user.password, user.email))
        "success"
    end
    isnothing(result) && return false
    return true
end

end # module