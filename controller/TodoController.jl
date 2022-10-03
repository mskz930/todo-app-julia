module TodoController

using HTTP
using ..TodoApp: ROUTER
using ..Model: ErrorResponse
using ..TodoService

function new(req::HTTP.Request)
    try
        todo = JSON3.read(req.body)
        TodoService.new(todo, user_id)
        
        return HTTP.Response(200, ["Content-Type" => "application/json"], body=body)
    catch e
        println(e)
        body = ErrorResponse(status=500, message="internal server error")
        return HTTP.Response(500, ["Content-Type" => "application/json"], body=JSON3.write(body))
    end
end


end # module