module TodoApp

using HTTP, Sockets

const DIR = @__DIR__
const ROUTER = HTTP.Router()
const tasks = Dict{String, HTTP.Server}()

# データベース
include("./db/DB.jl")
using .DB

# モデル
include("./model/Model.jl")
using .Model

# リポジトリ
include("./repository/UserRepository.jl")
include("./repository/TodoRepository.jl")
using .UserRepository, .TodoRepository

# サービス
include("./service/UserService.jl")
include("./service/TodoService.jl")
# include("./service/LoginService.jl")
using .UserService, .TodoService

# コントローラ
include("./controller/UserController.jl")
include("./controller/LoginController.jl")
include("./controller/TodoController.jl")
using .UserController, .LoginController, .TodoController


HTTP.register!(ROUTER, "POST", "api/v1/todo/new", TodoController.new)
HTTP.register!(ROUTER, "GET", "api/v1/todo", TodoControoler.get_all)

function up()
    println("start web server: http://localhost:8080/api/v1/")
    task = HTTP.serve!(ROUTER, Sockets.localhost, 8080)
    push!(tasks, "TodoApp" => task)
end

function kill()
    global tasks
    for key in keys(task)
        tasks[key] |> close
    end
    println("shut down server")
end

end # module

