ALTER TABLE contacts ADD email VARCHAR(60);
ALTER TABLE contacts ADD email VARCHAR(60) AFTER name;
ALTER TABLE contacts ADD email VARCHAR(60) FIRST;

ALTER TABLE table_name DROP COLUMN column_name

show index from info;
alter table info add index (name);
alter table info add index (cid);