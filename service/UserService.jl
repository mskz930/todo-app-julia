module UserService

using ..Model: UserDto
using ..UserRepository

function new(user::UserDto)
    if !UserRepository.exists(user.email)
        return UserRepository.ave(user)
    else
        println("user is already exists.")
        return false
    end
end

get_user_by_email(email::AbstractString) = UserRepository.find_by_email(email)
update(user::UserDto) = UserRepository.update(user)
delete_by_email(email::AbstractString) = UserRepository.delete_by_email(email)

end # module