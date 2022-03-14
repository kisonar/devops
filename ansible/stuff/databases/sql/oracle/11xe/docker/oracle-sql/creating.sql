-- as system user
CREATE USER mossad IDENTIFIED BY mossad;
--  DEFAULT TABLESPACE mossad #TODO
COMMIT;

--grant permissions
GRANT CREATE SESSION TO mossad WITH ADMIN OPTION;
GRANT CREATE procedure to mossad;
GRANT CREATE sequence to mossad;
GRANT CREATE session to mossad;
GRANT CREATE table to mossad;
GRANT CREATE trigger to mossad;
GRANT CREATE type to mossad;
GRANT RESOURCE to mossad;
COMMIT;

CREATE TABLE mossad.task_status (
  id INT NOT NULL,
  val VARCHAR2(20) NOT NULL,  
  CONSTRAINT TASK_STATUS_PK PRIMARY KEY ("ID")
) ;
COMMIT;
CREATE UNIQUE INDEX TASK_STATUS_UNIQUE_INDEX_VAL ON mossad.TASK_STATUS (VAL);
COMMIT;
INSERT INTO mossad.task_status VALUES (1,'Not started');
INSERT INTO mossad.task_status VALUES (2,'Ongoing');
INSERT INTO mossad.task_status VALUES (3,'Finished');
INSERT INTO mossad.task_status VALUES (4,'Paused');
INSERT INTO mossad.task_status VALUES (5,'Under creation');
COMMIT;

CREATE TABLE mossad.task_type (
  id INT NOT NULL,
  val VARCHAR2(20) NOT NULL, 
  CONSTRAINT task_type_PK PRIMARY KEY ("ID")
) ;
COMMIT;
INSERT INTO mossad.task_type VALUES (1,'Private');
INSERT INTO mossad.task_type VALUES (2,'Home');
INSERT INTO mossad.task_type VALUES (3,'Work');
INSERT INTO mossad.task_type VALUES (4,'Friends');
INSERT INTO mossad.task_type VALUES (5,'Hobby');
INSERT INTO mossad.task_type VALUES (6,'None');
COMMIT;

CREATE TABLE mossad.task_priority (
  id INT NOT NULL,
  val VARCHAR2(20) NOT NULL, 
  CONSTRAINT task_priority_PK PRIMARY KEY ("ID")
) ;
COMMIT;
INSERT INTO mossad.task_priority VALUES (1,'High');
INSERT INTO mossad.task_priority VALUES (2,'Medium');
INSERT INTO mossad.task_priority VALUES (3,'Low');
INSERT INTO mossad.task_priority VALUES (4,'Not specified');
INSERT INTO mossad.task_priority VALUES (5,'Unknown');
COMMIT;

CREATE TABLE mossad.mossad_user (
  id INT NOT NULL,
  name VARCHAR2(20) NOT NULL, 
  surname  VARCHAR2(20) NOT NULL, 
  email  VARCHAR2(20) NOT NULL,
  password VARCHAR2(20) NOT NULL,
  CONSTRAINT mossad_user_PK PRIMARY KEY ("ID")
) ;
COMMIT;
CREATE UNIQUE INDEX mossad_user_UNIQUE_INDEX_email ON mossad.mossad_user (email);
COMMIT;
--//TODO add autoincrement
INSERT INTO mossad.mossad_user VALUES (1,'user1name','user1surname','user1email@wp.pl','user1password');
INSERT INTO mossad.mossad_user VALUES (2,'user2name','user2surname','user2email@wp.pl','user2password');
INSERT INTO mossad.mossad_user VALUES (3,'user3name','user3surname','user3email@wp.pl','user3password');
INSERT INTO mossad.mossad_user VALUES (4,'user4name','user4surname','user4email@wp.pl','user4password');
COMMIT;

CREATE TABLE mossad.mossad_task (
  id INT NOT NULL,
  title VARCHAR2(20) NOT NULL, 
  description VARCHAR2(20) ,
  priority INT NOT NULL ,
  userId int NOT NULL ,
  status int NOT NULL,
  type int NOT NULL,
  CONSTRAINT mossad_task_PK PRIMARY KEY ("ID"),
  CONSTRAINT mossad_task_priority_fk FOREIGN KEY (priority) REFERENCES mossad.task_priority (id),
  CONSTRAINT mossad_task_status_fk FOREIGN KEY (status) REFERENCES mossad.task_status (id),
  CONSTRAINT mossad_task_type_fk FOREIGN KEY (type) REFERENCES mossad.task_type (id),
  CONSTRAINT mossad_task_user_fk FOREIGN KEY (userId) REFERENCES mossad.mossad_user (id)
) ;
COMMIT;

INSERT INTO mossad.mossad_task VALUES ('1', 'Task title', 'Task descrption', '2', '1', '3', '6');
COMMIT;

--TODO to add to task table dodac pozniuej
--due time
--repetition
--estimation how long
--location 
--URL
--postpone counter

-- --
--TODO

--Task repetition
--Note
--Tag
--Sharing Task