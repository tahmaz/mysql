SHOW EVENTS;

CREATE EVENT e_daily
    ON SCHEDULE
      EVERY 1 DAY
    COMMENT 'clear mypoll table each hour.'
    DO
      DELETE FROM mypoll where time < DATE_SUB(NOW() , INTERVAL 1 DAY);

CREATE EVENT IF NOT EXISTS session_cleaner_event
ON SCHEDULE
  EVERY 13 DAY_HOUR
  COMMENT 'Clean up sessions at 13:00 daily!'
  DO
    DELETE FROM site_activity.sessions;



CREATE EVENT e_daily
    ON SCHEDULE
	  EVERY '1 0' DAY_HOUR       
    STARTS '2013-05-07 00:00:00'
    COMMENT 'clear mypoll table each hour.'
    DO
      DELETE FROM mypoll where time < DATE_SUB(NOW() , INTERVAL 1 DAY);