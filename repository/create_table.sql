create table todos (
    id int not null
    , user_id int not null
    , task text
    , done bool
    , created_at datetime
    , updated_at datetime
);