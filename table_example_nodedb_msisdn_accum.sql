create database node;

grant CREATE,INSERT,DELETE,UPDATE,SELECT on node.* to user@localhost;
grant all privileges on node.* to user@localhost identified by 'password';
flush privileges;

create table node.subsc (
id INT NOT NULL AUTO_INCREMENT,
msisdn varchar(15),
package varchar(100),
     PRIMARY KEY (id),
	INDEX (msisdn),
	INDEX (package)
);

create table node.accum (
id INT NOT NULL AUTO_INCREMENT,
msisdn varchar(15),
quota int,
package varchar(100),
     PRIMARY KEY (id),
	INDEX (msisdn),
	INDEX (quota),
	INDEX (package)
);



--/usr/bin/mysql -uuser -p < create_db.sql