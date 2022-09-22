# todo.jl

new(::TodoService, dto::TodoDto, user_id::Integer) = save(TodoRepository, dto, user_id)
get_by_id(::TodoService, id::Integer, user_id::Integer) = find_by_id(TodoRepository(), id, user_id)
get_all(::TodoService, user_id) = find_all(TodoRepository(), user_id)
update(::TodoService, dto::TodoDto) = update(TodoRepository(), dto)
delete(::TodoService, id, user_id) = delete(TodoRepository(), id, user_id)
