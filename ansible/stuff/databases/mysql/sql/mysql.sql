CREATE DATABASE marcin;
USE marcin;
commit;

CREATE TABLE marcin.users (
    userId integer NOT NULL AUTO_INCREMENT,
    userName varchar(15),
    userPassword varchar(15),
    userEmail  varchar(50),
    PRIMARY KEY (userId)
)
ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
commit;

insert into marcin.users(userId,userName,userPassword,userEmail)
values (null,'qcsAdmin','qcsAdmin','qcsAdmin@mail.com');
insert into marcin.users(userId,userName,userPassword,userEmail)
values (null,'qcsEngineer','qcsEngineer','qcsEngineer@mail.com');
insert into marcin.users(userId,userName,userPassword,userEmail)
values (null,'qcsClient','qcsClient','qcsClient@mail.com');
commit;

CREATE TABLE marcin.roles (
    roleId integer NOT NULL AUTO_INCREMENT,
    roleName varchar(15),
    PRIMARY KEY (roleId)
)
ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
commit;

insert into marcin.roles(roleId,roleName) values (null,'Administrator');
insert into marcin.roles(roleId,roleName) values (null,'Engineer');
insert into marcin.roles(roleId,roleName) values (null,'QCS Client');
commit;

CREATE TABLE marcin.user_roles (
	userId integer NOT NULL,
	roleId integer NOT NULL,
	FOREIGN KEY (userId) REFERENCES marcin.users (userId) ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY (roleId) REFERENCES marcin.roles (roleId) ON DELETE RESTRICT ON UPDATE CASCADE,
	PRIMARY KEY (userId, roleId)
)
ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
commit;

insert into marcin.user_roles(userId,roleId) values (1,1);
insert into marcin.user_roles(userId,roleId) values (2,2);
insert into marcin.user_roles(userId,roleId) values (3,3);
commit;