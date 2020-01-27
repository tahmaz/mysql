CREATE DATABASE products CHARACTER SET utf8 COLLATE utf8_bin;		
create table amazon (
id INT NOT NULL AUTO_INCREMENT,
filename varchar(200),
link varchar(200),
name varchar(200),
image_link varchar(200),
review int,
price varchar(20),
count varchar(20),
insertdate DATETIME,
     PRIMARY KEY (id)
);
ALTER TABLE amazon CONVERT TO CHARACTER SET utf8 COLLATE utf8_bin;

CREATE USER 'user1'@'localhost' IDENTIFIED BY 'user_pass';
CREATE USER 'user1'@'%' IDENTIFIED BY 'user_pass';    /*from all host*/


GRANT ALL ON products.* TO 'user1'@'%';    /*from all host*/
flush privileges;
exit;