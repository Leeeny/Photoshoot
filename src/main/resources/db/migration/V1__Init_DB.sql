create table banlist
(
    id        bigint not null,
    banned_id bigint not null,
    primary key (id)
) engine = InnoDB;

create table blocked_users
(
    id          bigint not null,
    date_of_ban datetime(6),
    reason      varchar(255),
    time_of_ban datetime(6),
    primary key (id)
) engine = InnoDB;

create table complaints
(
    user_id     bigint not null,
    date        datetime(6),
    description varchar(255),
    post_id     bigint,
    reason      varchar(255),
    primary key (user_id)
) engine = InnoDB;

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