module LoginController

using HTTP, JSON3

using ..TodoApp: ROUTER
using ..Model

function hello(req::HTTP.Request)
    json = JSON3.write((message="hello, world",))
    return HTTP.Response(200, ["Content-Type" => "application/json"], json)
end
HTTP.register!(ROUTER, "GET", "api/v1/hello", hello)

function login(req::HTTP.Request)
    return HTTP.Response(200, ["Authorization" => "email:password", "Content-Type" => "application/json"], JSON3.write((message="ok",)))
end

function auth(req::HTTP.Request)
    print(req)
    try
        token = HTTP.header(req, "Authorization")
        token == "" && return HTTP.Response(400, ["Content-Type" => "appliaction/json"], JSON3.write("token not found"))
        email, password = split(token, ":")
        if password == "password"
            return HTTP.Response(200, "authorized")
        else
            return HTTP.Response(401, "")
        end
    catch e
        println(e)
        return HTTP.Response(500, ["Content-Type" => "application/json", ], JSON3.write((message="error",)))
    end
end


end # module