module SessionController

using HTTP

using ..Model: User

const Session = Dict{Symbol, User}()

get_user(username::Symbol) = Session[username]

function write_cookie(username)
    user = get_user(username)
    [
        "Set-Cookie" => "userId: $(user.id),userName: $(user.name)",
        "Content-Type" => "application/json",
    ]
end

function new(req::HTTP.Request)
    res = Response(200, [], "")
end

end # module