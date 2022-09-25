# todo.jl
module TodoService

using Model: TodoDto
using TodoRepository

new(dto::TodoDto, user_id::Integer) = TodoRepository.save(dto, user_id)
get_by_id(id::Integer, user_id::Integer) = TodoRepository.find_by_id(id, user_id)
get_all(user_id) = TodoRepository.find_all(user_id)
update(dto::TodoDto) = TodoRepository.update(dto)
delete(id, user_id) = TodoRepository.delete(id, user_id)


end # module
    