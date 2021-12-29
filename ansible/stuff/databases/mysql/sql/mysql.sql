CREATE DATABASE marcin;
USE marcin;
COMMIT;

CREATE TABLE marcin.users (
    userId integer NOT NULL AUTO_INCREMENT,
    userName varchar(15),
    userPassword varchar(15),
    userEmail  varchar(50),
    PRIMARY KEY (userId)
)
ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
COMMIT;

INSERT INTO marcin.users(userId,userName,userPassword,userEmail) VALUES (null,'qcsAdmin','qcsAdmin','qcsAdmin@mail.com');
INSERT INTO marcin.users(userId,userName,userPassword,userEmail)VALUES (null,'qcsEngineer','qcsEngineer','qcsEngineer@mail.com');
INSERT INTO marcin.users(userId,userName,userPassword,userEmail)VALUES (null,'qcsClient','qcsClient','qcsClient@mail.com');
COMMIT;

CREATE TABLE marcin.roles (
    roleId integer NOT NULL AUTO_INCREMENT,
    roleName varchar(15),
    PRIMARY KEY (roleId)
)
ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
COMMIT;

INSERT INTO marcin.roles(roleId,roleName) VALUES (null,'Administrator');
INSERT INTO marcin.roles(roleId,roleName) VALUES (null,'Engineer');
INSERT INTO marcin.roles(roleId,roleName) VALUES (null,'QCS Client');
COMMIT;

CREATE TABLE marcin.user_roles (
	userId integer NOT NULL,
	roleId integer NOT NULL,
	FOREIGN KEY (userId) REFERENCES marcin.users (userId) ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY (roleId) REFERENCES marcin.roles (roleId) ON DELETE RESTRICT ON UPDATE CASCADE,
	PRIMARY KEY (userId, roleId)
)
ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
COMMIT;

INSERT INTO marcin.user_roles(userId,roleId) VALUES (1,1);
INSERT INTO marcin.user_roles(userId,roleId) VALUES (2,2);
INSERT INTO marcin.user_roles(userId,roleId) VALUES (3,3);
COMMIT;