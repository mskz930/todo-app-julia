module Repository

include("./model/Model.jl")

using .Model: TodoDto

abstract type AbstractRepository end
struct TodoRepository <: AbstractRepository end

function save(::TodoRepository, dto::TodoDto)::Bool
    result = DB.connect() do conn
        sql = """insert into todos(user_id, task, isdone, created_at, updated_at) 
            values (?, ?, ?, ?, ?)"""
        now = Dates.now()
        stmt = DBInterface.prepare(connn, sql)
        DBInterface.execute(stmt, dto.user_id, dto.task, dto.isdone, now, now)
    end
    return result
end

function find_by_id(::TodoRepository, id::Integer)
    todo = DB.connect() do conn
        sql = "select id, user_id, task, isdone"

end # module
