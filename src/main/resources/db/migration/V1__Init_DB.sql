create table hibernate_sequence
(
    next_val bigint
) engine = InnoDB;

insert into hibernate_sequence
values (1);

create table post
(
    post_id  bigint not null,
    filename varchar(255),
    text     varchar(255),
    user_id  bigint,
    primary key (post_id)
) engine = InnoDB;

create table user_role
(
    user_id bigint not null,
    roles   varchar(255)
) engine = InnoDB;

create table user_subscriptions
(
    subscriber_id bigint not null references users,
    user_id       bigint not null references users,
    primary key (user_id, subscriber_id)
) engine = InnoDB;

create table users
(
    id       bigint not null,
    active   bit    not null,
    age      varchar(255),
    gender   varchar(255),
    password varchar(255),
    username varchar(255),
    primary key (id)
) engine = InnoDB;

alter table post
    add constraint post_user_fk foreign key (user_id) references users (id);

alter table user_role
    add constraint user_role_user_fk foreign key (user_id) references users (id);

insert into users
values (1, true, '1', 'r', '22', 'admin');
insert into users
values (2, true, '1', 'r', '22', 'Photoshoot');

insert into user_role
values (1, 'USER');
insert into user_role
values (1, 'MODER');
insert into user_role
values (1, 'ADMIN');
insert into user_role
values (2, 'USER');