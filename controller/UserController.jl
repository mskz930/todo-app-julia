# user_controller.jl
module UserController

using HTTP, JSON3
using ..Model: UserDto

function new(req::HTTP.Request)
    user = JSON3.read(req.body, UserDto)
    println(user)
    success = true
    # success = new(UserService(), user)
    if success
        data = JSON3.write(user)
        HTTP.Response(200, ["Content-Type" => "application/json"], body=data)
    else
        error_response = ErrorResponse(500, "create user failed")
        return JSON3.write(error_response)
    end
end

end # module







