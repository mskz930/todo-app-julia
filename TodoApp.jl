module TodoApp

include("./DB.jl")
include("./model/Model.jl")
include("./service/Service.jl")
include("./repository/Repository.jl")

using HTTP
using .Model: UserDto

function main()
    
end

function index()
end


    

end # module
