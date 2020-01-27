--change my.cnf file
--In /etc/my.cnf under the [mysqld] section add: 
max_connections = 500
--save and restart(service mysqld restart)

--check
SHOW VARIABLES;
--temporary change
SET GLOBAL max_connections = 300;
SHOW VARIABLES;