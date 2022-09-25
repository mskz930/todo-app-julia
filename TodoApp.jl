module TodoApp

const DIR = @__DIR__

const paths = [".db/", "./model", "./controller", "./repository", "./service"]

for path in paths
    !(path in LOAD_PATH) && push!(LOAD_PATH, path)
end

#=
include("./db/DB.jl")
include("./model/Model.jl")
include("./repository/Repository.jl")
include("./service/Service.jl")
include("./controller/Controller.jl")
=#

using HTTP
using TodoController

# HTTP.register!(ROUTER, "GET", "/api/", index)

const ROUTER = HTTP.Router()

#=
function main()
    ROUTER = HTTP.Router()
    # index routing
    HTTP.register!(ROUTER, "GET", "/", req -> JSON.json("hello"))
    
    # user router
    HTTP.register!(ROUTER, "POST", "/user/new", UserController.new)
    
    # user router
    HTTP.register!(ROUTER, "GET", "/login", LoginController.login)
    HTTP.register!(ROUTER, "GET", "/auth", LoginController.auth)


    HTTP.serve(ROUTER, Sockets.localhost, 8080)
end=#

end # module

