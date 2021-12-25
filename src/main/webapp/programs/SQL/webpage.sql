CREATE DATABASE WebPage;

USE WebPage;

CREATE TABLE user(
email varchar(40),
pass varchar(40) default Null,
PRIMARY KEY(email)
);

CREATE TABLE email(
email_id int not null auto_increment,
sender varchar(40),
reciver varchar(40),
subject varchar(100) default NULL,
message varchar(200) default Null,
FOREIGN KEY(sender) REFERENCES user(email),
FOREIGN KEY(reciver) REFERENCES user(email),
primary key(email_id)
);

CREATE TABLE trash(
trash_id int not null auto_increment,
email varchar(40),
email_id int default null,
deleted boolean default false,
FOREIGN KEY(email) REFERENCES user(email),
FOREIGN KEY(email_id) REFERENCES email(email_id),
primary key(trash_id),
unique key(email,email_id)
);