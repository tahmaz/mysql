--mysql trigger insert two table and create table that mach another:
CREATE TABLE mypoll LIKE poller_output;

delimiter | 
CREATE TRIGGER cacti.pollertomypoll BEFORE INSERT ON poller_output
FOR EACH ROW BEGIN
INSERT INTO mypoll (local_data_id,rrd_name, time, output)
VALUES (NEW.local_data_id,  NEW.rrd_name, NEW.time, NEW.output);
END
|