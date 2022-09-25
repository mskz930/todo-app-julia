module DB

using MySQL

export MySQL, DBInterface

const config = (
    host = "localhost",
    user = "root",
    password = nothing,
    db = "test",
    port = 3306,
)



execute(conn::MySQL.Connection, sql::AbstractString, params...) = DBInterface.execute(conn, sql, params) 

function connect(func::Function)
    conn = DBInterface.connect(MySQL.Connection, config.host, config.user, config.password, db=config.db, port=config.port)
    try
        func(conn)
    catch e
        println(e)
    finally
        close(conn)
    end
end

end # module