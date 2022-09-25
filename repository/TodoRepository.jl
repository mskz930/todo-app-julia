# TodoRepository.jl
module TodoRepository

using DB
using Model
using TodoRepository

# Todoを保存
function save(dto::TodoDto)::Bool
    result = DB.connect() do conn
        sql = """insert into todos(id, user_id, task, isdone, created_at, updated_at) 
            values (?, ?, ?, ?, ?)"""
        now = Dates.now()
        stmt = DBInterface.prepare(conn, sql)
        DBInterface.execute(stmt, (dto.user_id, dto.task, dto.isdone, now, now))
    end
    return result
end

# Todoを取得
function find_by_id(user_id::Integer, id::Integer)
    rows = DB.connect() do conn
        sql = "select id, category_id, task, isdone where id = ? and user_id = ?"
        stmt = DBInteraface.stmt(conn, sql)
        rows = DBInterface.execute(stmt, (user_id, id)) |> DataFrame
    end
    if size(rows, 1) > 0
        return
    end
    row = eachrow(rows)[1]
    
    return TodoDto(row...)
end

function find(user_id::Integer)
    rows = DB.connect() do conn
        sql = "select id, category_id, task, isdone where user_id = ?"
        stmt = DBInterface.prepare(conn, sql)
        DBInterface.execute(stmt, user_id) |> DataFrame
    end
    todos = TodoDto[]
    for row in eachrow(rows)
        todo = TodoDto(row...)
        push!(todos, todo)
    end
    todos
end

# TODOの更新
function update(todo::TodoDto)
    result = DB.conn() do conn
        sql = """update todos set
        task = ?, isdone = ?, category_id = ?
        where id = ? and user_id = ?
        """
        stmt = DBInterface.prepare(conn, sql)
        DBInterface.execute(stmt, 
            (dto.task, dto.isdone, dto.category_id, dto.id, dto.user_id))
    end
    return result
end

# TODOの削除
function delete_by_id(id::Integer, user_id::Integer)
    result = DB.conn() do conn
        sql = "delete from todos where id = ? and user_id = ?"
        stmt = DBInterface.prepare(conn, sql)
        DBInterface.execte(stmt, (id, user_id))
    end
end

end # module