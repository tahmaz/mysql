--show all variables:
SHOW VARIABLES;

--show log files:
SHOW VARIABLES LIKE "general_log%";
SET GLOBAL general_log = 'OFF';

--show process list:
SHOW PROCESSLIST;
SHOW FULL PROCESSLIST;
SHOW PROCESSLIST \G;

--for kill process id 41, /* thread_id */ is a comment:
kill /* thread_id */ 41;

desc performance_schema.threads;
select name, type, instrumented from performance_schema.threads;  //after mysql ver 5.6
update performance_schema.threads set instrumented = 'NO' where name != 'thread/sql/one_connection';