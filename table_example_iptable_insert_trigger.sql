CREATE TABLE iptable (
     id SMALLINT NOT NULL AUTO_INCREMENT,
     ip VARCHAR(15),
     host VARCHAR(30),
     location VARCHAR(30),
     city VARCHAR(30),
     organization VARCHAR(50),
     isp VARCHAR(30),
     asname VARCHAR(50),
     PRIMARY KEY (id),
  INDEX (ip),
  INDEX (host),
  INDEX (location),
  INDEX (city),
  INDEX (organization),
  INDEX (isp),
  INDEX (asname)
);

ALTER TABLE iptable ADD ip2 VARCHAR(15) AFTER ip;
ALTER TABLE iptable ADD ipid INT AFTER ip2;
ALTER TABLE iptable ADD ip2id INT AFTER ipid;

ALTER TABLE iptable ADD INDEX (ip2);
ALTER TABLE iptable ADD INDEX (ipid);
ALTER TABLE iptable ADD INDEX (ip2id);

delimiter |

CREATE TRIGGER ipinsert AFTER INSERT ON iptable
  FOR EACH ROW
  BEGIN
    UPDATE iptable SET ipid = SUBSTRING_INDEX(NEW.ip, '.', 1)*256*256*256+SUBSTRING_INDEX(SUBSTRING_INDEX(NEW.ip, '.', 2),'.', -1)*256*256+SUBSTRING_INDEX(SUBSTRING_INDEX(NEW.ip, '.', 3),'.', -1)*256+SUBSTRING_INDEX(NEW.ip, '.', -1);
  END;
|

CREATE TRIGGER ipupdate AFTER UPDATE ON iptable
  FOR EACH ROW
  BEGIN
    UPDATE iptable SET ipid = SUBSTRING_INDEX(NEW.ip, '.', 1)*256*256*256+SUBSTRING_INDEX(SUBSTRING_INDEX(NEW.ip, '.', 2),'.', -1)*256*256+SUBSTRING_INDEX(SUBSTRING_INDEX(NEW.ip, '.', 3),'.', -1)*256+SUBSTRING_INDEX(NEW.ip, '.', -1);
  END;
|

delimiter ;

SHOW TRIGGERS;