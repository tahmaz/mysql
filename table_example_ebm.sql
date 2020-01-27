create table kpi (
node varchar(10),
file_name varchar(100),
insert_date datetime,
kpi varchar(100),
count int,
	INDEX (node),
	INDEX (insert_date),
	INDEX (kpi),
	INDEX (count)
);

create table statistics (
id INT NOT NULL AUTO_INCREMENT,
param varchar(100),
name varchar(100),
count int,
insertdate DATETIME,
     PRIMARY KEY (id),
	INDEX (param),
	INDEX (name),
	INDEX (insertdate)
)

insert into ebm.statistics (param,name,count,insertdate) 
SELECT 'event_id_result',CONCAT(event_id,':',event_result)as ee, count(*) AS count,NOW() FROM ebm.sgsn where event_result!="success" GROUP BY ee order by count desc limit 50;

DELETE FROM ebm.statistics WHERE insertdate < DATE_SUB(NOW(), INTERVAL 7 DAY);


--insert statists
/usr/bin/mysql -uebmuser -psome_pass < /home/tahmaz/scripts/sgsn/insert_statistics.sql

--delete old statiscs
/usr/bin/mysql -uebmuser -psome_pass < /home/tahmaz/scripts/sgsn/delete_old_statistics.sql


/*
/usr/share/tomcat/webapps/ROOT/cno/ebm/ebm

select count(*) from statistics;


<th align="center">node</th>

<td><divstyle="width:100px;"><%=rs.getString(1)%></div></td>


| sgsn  |          1 | node        |            1 | node        | A         |        NULL |     NULL | NULL   | YES  | BTREE      |         |               |
| sgsn  |          1 | file_name   |            1 | file_name   | A         |        NULL |     NULL | NULL   | YES  | BTREE      |         |               |
| sgsn  |          1 | insert_date |            1 | insert_date | A         |        NULL |     NULL | NULL   | YES  | BTREE      |         |               |
| sgsn  |          1 | time        |            1 | time        | A         |        NULL |     NULL | NULL   | YES  | BTREE      |         |               |
| sgsn  |          1 | location    |            1 | location    | A         |        NULL |     NULL | NULL   | YES  | BTREE      |         |               |
| sgsn  |          1 | msisdn      |            1 | msisdn      | A         |        NULL |     NULL | NULL   | YES  | BTREE      |         |               |
| sgsn  |          1 | imsi        |            1 | imsi        | A         |        NULL |     NULL | NULL   | YES  | BTREE      |         |             

*/

CREATE TABLE sgsn5_failed SELECT * FROM sgsn LIMIT 0;
CREATE TABLE sgsn5_success SELECT * FROM sgsn LIMIT 0;
CREATE TABLE sgsn6_failed SELECT * FROM sgsn LIMIT 0;
CREATE TABLE sgsn6_success SELECT * FROM sgsn LIMIT 0;

CREATE TABLE sgsn5 SELECT * FROM sgsn LIMIT 0;
CREATE TABLE sgsn6 SELECT * FROM sgsn LIMIT 0;

ALTER TABLE sgsn5 ADD INDEX node (node);
ALTER TABLE sgsn5 ADD INDEX file_name (file_name);
ALTER TABLE sgsn5 ADD INDEX insert_date (insert_date);
ALTER TABLE sgsn5 ADD INDEX time (time);
ALTER TABLE sgsn5 ADD INDEX location (location);
ALTER TABLE sgsn5 ADD INDEX msisdn (msisdn);
ALTER TABLE sgsn5 ADD INDEX imsi (imsi);
ALTER TABLE sgsn5 ADD INDEX event_result (event_result);

ALTER TABLE sgsn6 ADD INDEX node (node);
ALTER TABLE sgsn6 ADD INDEX file_name (file_name);
ALTER TABLE sgsn6 ADD INDEX insert_date (insert_date);
ALTER TABLE sgsn6 ADD INDEX time (time);
ALTER TABLE sgsn6 ADD INDEX location (location);
ALTER TABLE sgsn6 ADD INDEX msisdn (msisdn);
ALTER TABLE sgsn6 ADD INDEX imsi (imsi);
ALTER TABLE sgsn6 ADD INDEX event_result (event_result);

ALTER TABLE sgsn5_failed ADD INDEX node (node);
ALTER TABLE sgsn5_failed ADD INDEX file_name (file_name);
ALTER TABLE sgsn5_failed ADD INDEX insert_date (insert_date);
ALTER TABLE sgsn5_failed ADD INDEX time (time);
ALTER TABLE sgsn5_failed ADD INDEX location (location);
ALTER TABLE sgsn5_failed ADD INDEX msisdn (msisdn);
ALTER TABLE sgsn5_failed ADD INDEX imsi (imsi);

ALTER TABLE sgsn5_failed ADD INDEX node (node);
ALTER TABLE sgsn5_failed ADD INDEX file_name (file_name);
ALTER TABLE sgsn5_failed ADD INDEX insert_date (insert_date);
ALTER TABLE sgsn5_failed ADD INDEX time (time);
ALTER TABLE sgsn5_failed ADD INDEX location (location);
ALTER TABLE sgsn5_failed ADD INDEX msisdn (msisdn);
ALTER TABLE sgsn5_failed ADD INDEX imsi (imsi);

ALTER TABLE sgsn5_failed ADD INDEX node (node);
ALTER TABLE sgsn5_failed ADD INDEX file_name (file_name);
ALTER TABLE sgsn5_failed ADD INDEX insert_date (insert_date);
ALTER TABLE sgsn5_failed ADD INDEX time (time);
ALTER TABLE sgsn5_failed ADD INDEX location (location);
ALTER TABLE sgsn5_failed ADD INDEX msisdn (msisdn);
ALTER TABLE sgsn5_failed ADD INDEX imsi (imsi);


ALTER TABLE sgsn6_failed ADD INDEX node (node);
ALTER TABLE sgsn6_failed ADD INDEX file_name (file_name);
ALTER TABLE sgsn6_failed ADD INDEX insert_date (insert_date);
ALTER TABLE sgsn6_failed ADD INDEX time (time);
ALTER TABLE sgsn6_failed ADD INDEX location (location);
ALTER TABLE sgsn6_failed ADD INDEX msisdn (msisdn);
ALTER TABLE sgsn6_failed ADD INDEX imsi (imsi);

ALTER TABLE sgsn6_success ADD INDEX node (node);
ALTER TABLE sgsn6_success ADD INDEX file_name (file_name);
ALTER TABLE sgsn6_success ADD INDEX insert_date (insert_date);
ALTER TABLE sgsn6_success ADD INDEX time (time);
ALTER TABLE sgsn6_success ADD INDEX location (location);
ALTER TABLE sgsn6_success ADD INDEX msisdn (msisdn);
ALTER TABLE sgsn6_success ADD INDEX imsi (imsi);

ALTER TABLE sgsn5_success ADD INDEX node (node);
ALTER TABLE sgsn5_success ADD INDEX file_name (file_name);
ALTER TABLE sgsn5_success ADD INDEX insert_date (insert_date);
ALTER TABLE sgsn5_success ADD INDEX time (time);
ALTER TABLE sgsn5_success ADD INDEX location (location);
ALTER TABLE sgsn5_success ADD INDEX msisdn (msisdn);
ALTER TABLE sgsn5_success ADD INDEX imsi (imsi);

ALTER TABLE sgsn ADD INDEX event_result (event_result);
ALTER TABLE sgsn5_failed ADD INDEX event_result (event_result);
ALTER TABLE sgsn5_success ADD INDEX event_result (event_result);
ALTER TABLE sgsn6_failed ADD INDEX event_result (event_result);
ALTER TABLE sgsn6_success ADD INDEX event_result (event_result);

SHOW INDEX from sgsn5_success;
SHOW INDEX from sgsn5_failed;
SHOW INDEX from sgsn6_success;
SHOW INDEX from sgsn6_failed;

ALTER TABLE sgsn5 ENGINE=InnoDB;
ALTER TABLE sgsn6 ENGINE=InnoDB;
ALTER TABLE sgsn6_failed ENGINE=InnoDB;
ALTER TABLE sgsn5_failed ENGINE=InnoDB;
ALTER TABLE sgsn5_success ENGINE=InnoDB;
ALTER TABLE sgsn6_success ENGINE=InnoDB;

/*
vi /etc/my.cnf
# Memory and cache settings
wait_timeout = 1000
max_connections = 1000

innodb_buffer_pool_size = 8G
innodb_log_buffer_size = 1G
#innodb_log_file_size = 2G
innodb_write_io_threads = 32
innodb_flush_log_at_trx_commit = 0
innodb_lock_wait_timeout=300
*/

DELETE FROM ebm.sgsn5_failed WHERE insert_date < DATE_SUB(NOW(), INTERVAL 2 HOUR);
DELETE FROM ebm.sgsn5_success WHERE insert_date < DATE_SUB(NOW(), INTERVAL 2 HOUR);
DELETE FROM ebm.sgsn6_failed WHERE insert_date < DATE_SUB(NOW(), INTERVAL 2 HOUR);
DELETE FROM ebm.sgsn6_success WHERE insert_date < DATE_SUB(NOW(), INTERVAL 2 HOUR);

insert into ebm.sgsn5_failed
select * from ebm.sgsn where event_result!="success" and node="sgsn5";
insert into ebm.sgsn5_success
select * from ebm.sgsn where event_result="success" and node="sgsn5";

insert into ebm.sgsn6_failed
select * from ebm.sgsn where event_result!="success" and node="sgsn6";
insert into ebm.sgsn6_success
select * from ebm.sgsn where event_result="success" and node="sgsn6";