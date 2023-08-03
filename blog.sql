CREATE SCHEMA blog;
USE blog;

CREATE TABLE user(
    user_id varchar(10) primary key not null,
    email varchar(20) not null,
    creUser DATE not null
);

CREATE TABLE tab(
    tab_id INT not null primary key ,
    user_id varchar(10)not null,
    title varchar(20) not null,
    content varchar(500) not null,
    creTab DATETIME,
    FOREIGN KEY (user_id) references user(user_id)
);

CREATE TABLE comment(
  comment_id INT not null primary key ,
  user_id varchar(10) not null ,
  co_content varchar(20) not null ,
  creComen DATETIME,
  tab_id Int not null,
  foreign key (user_id) references user(user_id),
  foreign key (tab_id) references tab(tab_id)
);