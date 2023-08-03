CREATE SCHEMA blog;
USE blog;

CREATE TABLE user(
    user_id varchar(10) primary key not null,
    email varchar(20) not null,
    creUser DATE not null
);

CREATE TABLE post(
    post_id int AUTO_INCREMENT not null primary key ,
    user_id varchar(10)not null,
    title varchar(100) not null,
    content varchar(1500) not null,
    crepost DATETIME,
    FOREIGN KEY (user_id) references user(user_id)
);

CREATE TABLE comment(
  comment_id INT auto_increment not null primary key ,
  user_id varchar(10) not null ,
  co_content varchar(20) not null ,
  creComen DATETIME,
  post_id Int not null,
  INDEX idx_cooment(comment_id),
  foreign key (user_id) references user(user_id),
  foreign key (post_id) references post(post_id)
);