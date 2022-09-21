module TodoApp

include("./db/DB.jl")
include("./model/Model.jl")
include("./service/Service.jl")
include("./repository/Repository.jl")

using HTTP
using .Model: UserDto

ROUTER = HTTP.Router()
HTTP.register!(ROUTER, "GET", "/api/", index)

function main()

    
end

function index()
end


    

end # module
