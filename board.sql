Create schema board;

USE board;

CREATE TABLE user(
    user_id varchar(10) primary key not null
);

CREATE TABLE tab(
  colum_id int primary key not null,
  title varchar(30) not null,
  type enum('공지사항', '교육현황', '커뮤니티'),
  create_at DATETIME,
  user_id varchar(10),
  target enum('공통', '관리자'),
  view_count int,
  FOREIGN KEY (user_id) REFERENCES user(user_id)
);


