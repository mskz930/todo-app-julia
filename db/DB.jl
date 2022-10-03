module DB

using MySQL

export MySQL, DBInterface

Base.@kwdef struct Config
    host::String="localhost"
    user::String="root"
    password::Union{String,Nothing}=nothing
    db::String="test"
    port::Int64=3306
end




execute(conn::MySQL.Connection, sql::AbstractString, params...) = DBInterface.execute(conn, sql, params) 

function connect(func::Function, config=Config())
    conn = DBInterface.connect(MySQL.Connection, 
        config.host, 
        config.user, 
        config.password, 
        db=config.db, 
        port=config.port
    )
    try
        func(conn)
    catch e
        println(e)
    finally
        close(conn)
    end
end

end # module