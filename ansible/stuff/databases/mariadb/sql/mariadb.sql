CREATE TABLE users (
    userId int(11) NOT NULL AUTO_INCREMENT,
    userName varchar(15),
    userPassword varchar(15),
    userEmail  varchar(50),
    PRIMARY KEY (userId)
);
commit;

insert into users(userId,userName,userPassword,userEmail) values (null,'qcsAdmin','qcsAdmin','qcsAdmin@mail.com');
insert into users(userId,userName,userPassword,userEmail) values (null,'qcsEngineer','qcsEngineer','qcsEngineer@mail.com');
insert into users(userId,userName,userPassword,userEmail) values (null,'qcsClient','qcsClient','qcsClient@mail.com');
commit;

CREATE TABLE roles (
    roleId int(11) NOT NULL AUTO_INCREMENT,
    roleName varchar(15),
    PRIMARY KEY (roleId)
);
commit;

insert into roles(roleId,roleName) values (null,'Administrator');
insert into roles(roleId,roleName) values (null,'Engineer');
insert into roles(roleId,roleName) values (null,'QCS Client');
commit;

CREATE TABLE user_roles (
	userId int(11) NOT NULL,
	roleId int(11) NOT NULL,
	FOREIGN KEY (userId) REFERENCES users (userId) ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY (roleId) REFERENCES roles (roleId) ON DELETE RESTRICT ON UPDATE CASCADE,
	PRIMARY KEY (userId, roleId)
);
commit;

insert into user_roles(userId,roleId) values (1,1);
insert into user_roles(userId,roleId) values (2,2);
insert into user_roles(userId,roleId) values (3,3);
commit;