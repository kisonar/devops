-- as system user
CREATE USER mossad IDENTIFIED BY mossad;
--  DEFAULT TABLESPACE mossad #TODO
commit;

--grant permissions
GRANT CREATE SESSION TO mossad WITH ADMIN OPTION;
grant create procedure to mossad;
grant create sequence to mossad;
grant create session to mossad;
grant create table to mossad;
grant create trigger to mossad;
grant create type to mossad;
GRANT RESOURCE to mossad;
commit;

CREATE TABLE mossad.task_status (
  id INT NOT NULL,
  val VARCHAR2(20) NOT NULL,
  CONSTRAINT TASK_STATUS_PK PRIMARY KEY ("ID")
) ;
commit;
CREATE UNIQUE INDEX TASK_STATUS_UNIQUE_INDEX_VAL ON mossad.TASK_STATUS (VAL);
commit;
insert into mossad.task_status values (1,'Not started');
insert into mossad.task_status values (2,'Ongoing');
insert into mossad.task_status values (3,'Finished');
insert into mossad.task_status values (4,'Paused');
insert into mossad.task_status values (5,'Under creation');
commit;

CREATE TABLE mossad.task_type (
  id INT NOT NULL,
  val VARCHAR2(20) NOT NULL,
  CONSTRAINT task_type_PK PRIMARY KEY ("ID")
) ;
commit;
insert into mossad.task_type values (1,'Private');
insert into mossad.task_type values (2,'Home');
insert into mossad.task_type values (3,'Work');
insert into mossad.task_type values (4,'Friends');
insert into mossad.task_type values (5,'Hobby');
insert into mossad.task_type values (6,'None');
commit;

CREATE TABLE mossad.task_priority (
  id INT NOT NULL,
  val VARCHAR2(20) NOT NULL,
  CONSTRAINT task_priority_PK PRIMARY KEY ("ID")
) ;
commit;
insert into mossad.task_priority values (1,'High');
insert into mossad.task_priority values (2,'Medium');
insert into mossad.task_priority values (3,'Low');
insert into mossad.task_priority values (4,'Not specified');
insert into mossad.task_priority values (5,'Unknown');
commit;

CREATE TABLE mossad.mossad_user (
  id INT NOT NULL,
  name VARCHAR2(20) NOT NULL,
  surname  VARCHAR2(20) NOT NULL,
  email  VARCHAR2(20) NOT NULL,
  password VARCHAR2(20) NOT NULL,
  CONSTRAINT mossad_user_PK PRIMARY KEY ("ID")
) ;
commit;
CREATE UNIQUE INDEX mossad_user_UNIQUE_INDEX_email ON mossad.mossad_user (email);
commit;
--//TODO add autoincrement
insert into mossad.mossad_user values (1,'user1name','user1surname','user1email@wp.pl','user1password');
insert into mossad.mossad_user values (2,'user2name','user2surname','user2email@wp.pl','user2password');
insert into mossad.mossad_user values (3,'user3name','user3surname','user3email@wp.pl','user3password');
insert into mossad.mossad_user values (4,'user4name','user4surname','user4email@wp.pl','user4password');
commit;

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
commit;

INSERT INTO mossad.mossad_task VALUES ('1', 'Task title', 'Task descrption', '2', '1', '3', '6');
commit;

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