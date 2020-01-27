CREATE TABLE routes (
     id INT NOT NULL AUTO_INCREMENT,
	 ne varchar(10),
	 context varchar(30),
     type VARCHAR(5),
     ip varchar(15),
     mask tinyint(4),
     next_hop varchar(15),
     dist smallint,
     metric smallint,
     uptime VARCHAR(15),
     PRIMARY KEY (id),
	INDEX (ne),
	INDEX (context),
	INDEX (ip),
	INDEX (next_hop)
);