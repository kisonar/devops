CREATE TABLE users (
    userId int(11) NOT NULL AUTO_INCREMENT,
    userName varchar(15),
    userPassword varchar(15),
    userEmail  varchar(50),
    PRIMARY KEY (userId)
);
COMMIT;

INSERT INTO users(userId,userName,userPassword,userEmail) VALUES (null,'qcsAdmin','qcsAdmin','qcsAdmin@mail.com');
INSERT INTO users(userId,userName,userPassword,userEmail) VALUES (null,'qcsEngineer','qcsEngineer','qcsEngineer@mail.com');
INSERT INTO users(userId,userName,userPassword,userEmail) VALUES (null,'qcsClient','qcsClient','qcsClient@mail.com');
INSERT INTO users(userId,userName,userPassword,userEmail) VALUES (null,'Marcin','MarcinPass','marcinmigdal@wp.pl');
COMMIT;

CREATE TABLE roles (
    roleId int(11) NOT NULL AUTO_INCREMENT,
    roleName varchar(15),
    PRIMARY KEY (roleId)
);
COMMIT;

INSERT INTO roles(roleId,roleName) VALUES (null,'Administrator');
INSERT INTO roles(roleId,roleName) VALUES (null,'Engineer');
INSERT INTO roles(roleId,roleName) VALUES (null,'QCS Client');
INSERT INTO roles(roleId,roleName) VALUES (null,'User');
COMMIT;

CREATE TABLE user_roles (
	userId int(11) NOT NULL,
	roleId int(11) NOT NULL,
	FOREIGN KEY (userId) REFERENCES users (userId) ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY (roleId) REFERENCES roles (roleId) ON DELETE RESTRICT ON UPDATE CASCADE,
	PRIMARY KEY (userId, roleId)
);
COMMIT;

INSERT INTO user_roles(userId,roleId) VALUES (1,1);
INSERT INTO user_roles(userId,roleId) VALUES (2,2);
INSERT INTO user_roles(userId,roleId) VALUES (3,3);
COMMIT;