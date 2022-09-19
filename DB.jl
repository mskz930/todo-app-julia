module DB

using MySQL

const config = (
    host = "localhost",
    user = "root",
    password = nothing,
    db = "test",
    port = 3306,
)

connect() = DBInterface.connect(MySQL.Connection, config.host, config.user, config.password, db=config.db, port=config.port)

execute(conn::MySQL.Connection, sql::AbstractString, params...) = DBInterface.execute(conn, sql, params) 

function execute(func::Function, conn:MySQL.Connection)
    try
        func(conn)
    catch e
        println(e)
    finally
        close(conn)
    end
end

end # module